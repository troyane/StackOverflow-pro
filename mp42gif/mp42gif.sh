#!/bin/bash

#
# Script to convert MP4 video to GIF with generation of custom color palette.
#
#=== Do not touch code below
# Inner variables
input_file=""
input_fps="20"
input_height="512"
output_file="output.gif"

# Great and simple idea got here: https://stackoverflow.com/a/53463162/867349
function cecho() {
    RED="\033[0;31m"
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    NC='\033[0m' # No Color
    printf "${!1}${2} ${NC}\n"
}

function wecho() { # warning, yellow
    cecho "YELLOW" "[WARN] ${1}"
}

function eecho() { # error, red
    cecho "RED" "[ERROR] ${1}"
}

function iecho() { # info, green
    cecho "GREEN" "[INFO] ${1}"
}

if ! [ -x "$(command -v ffmpeg)" ]; then
  eecho 'Error: ffmpeg is not installed.' >&2
  wecho 'Install it by next command "sudo apt install ffmpeg" and run script again.'
  wcho 'Exiting.'
  exit 1
fi

function usage() {
    cat <<HELP_USAGE
    -i|--input   Input MP4 file. 
    -f|--fps     FPS frame per second rate as a number. Default FPS=20.
    -h|--height  Height value as a number. Script will scale input picture height to given number. 
    			 Default Height=512. Width will be calculated proportionally.
    -o|--output  Output GIF file. Default Name=output.gif.
    --help       Show this usage info.
HELP_USAGE
    exit 1
}

function parse_args() {
    if [ "$#" -eq 1 ]
    then
    	eecho "You need to specify arguments."
    	usage
    	exit 1
    fi
    while [[ "$#" -gt 0 ]]; 
    do 
        case $1 in
        	-i|--input)  input_file="$2";   shift;;
        	-f|--fps)    input_fps="$2";    shift;;
        	-h|--height) input_height="$2"; shift;;
			-o|--output) output_file="$2";  shift;;
			--help)      usage ; exit 0;;
            *) eecho "Unknown parameter passed: $1" ; usage;;
        esac
        shift
    done
}

function convert() {
	palette_file="palette.png"
	if [ -z "$input_file" ]
	then
	      eecho "No input file given."
	      usage
	      exit 1
	fi

	iecho "Create palette $palette_file out of $input_file"
	ffmpeg -i "$input_file" \
		   -vf fps=$input_fps,scale=$input_height:-1:flags=lanczos,palettegen\
		   $palette_file
    if [ $? -eq 0 ]; then
       iecho "Palette created."
    else
       eecho "Can't continue. Exiting."
       exit 1
    fi

    iecho "Create GIF file ($output_file) based on input file ($input_file) and palette ($palette_file)."
	ffmpeg -i "$input_file" \
		   -i $palette_file \
		   -filter_complex "fps=$input_fps,scale=$input_height:-1:flags=lanczos[x];[x][1:v]paletteuse" \
		   $output_file
    if [ $? -eq 0 ]; then
	    iecho "Output file created:"
	    ls -lah "$output_file"
    else
       eecho "Can't continue. Exiting."
    fi

	rm $palette_file
}

# Establish run order
function main() {
    iecho "Starting..."
    convert
    iecho "Finished."
}

parse_args "$@"
main
