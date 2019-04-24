# Script to convert MP4 file to GIF (via ffmpeg)

It creates intermediate custom color palette out of input video file and use it for resulting GIF for better picture quality. 

For more info see next articles (with examples):
* [Answer on SuperUser regarding picture quality](https://superuser.com/a/556031)
* [Colten Jackson's article "High Quality Gifs with FFMPEG"](https://medium.com/@colten_jackson/doing-the-gif-thing-on-debian-82b9760a8483)


# Obtaining sources

If you want download **only** this folder (`mp42gif`),
you must execute next command:
```
svn checkout https://github.com/troyane/StackOverflow-pro/trunk/mp42gif
```


# Script usage

Make script executable `chmod +x mp42gif.sh`.

Use script with next parameters:
```
-i|--input   Input MP4 file. 
-f|--fps     FPS frame per second rate as a number. Default FPS=20.
-h|--height  Height value as a number. Script will scale input picture height to given number. 
                        Default Height=512. Width will be calculated proportionally.
-o|--output  Output GIF file. Default Name=output.gif.
--help       Show this usage info.
```

## Example usage

Convert file `1.mp4` using default values:
```
mp42gif.sh -i 1.mp4
```

This will create `output.gif`.
