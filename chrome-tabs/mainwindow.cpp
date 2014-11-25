#include <QToolButton>
#include <QTableWidget>
#include <QLabel>

#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    QToolButton *tb = new QToolButton();
    tb->setText("+");
    tb->setAutoRaise(true);
    connect(tb, SIGNAL(clicked()), this, SLOT(addTab()));

    ui->tabWidget->addTab(new QLabel("You can add tabs by pressing <b>\"+\"</b>"), QString());
    ui->tabWidget->setTabEnabled(0, false);
    ui->tabWidget->tabBar()->setTabButton(0, QTabBar::RightSide, tb);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::addTab()
{
    static int number = 0;
    QLabel *tab = new QLabel(this);
    QString tabName = QString("New tab #%1").arg(++number);
    tab->setText( QString("Inside %1").arg(tabName) );
    ui->tabWidget->insertTab( ui->tabWidget->count() - 1, tab, tabName);
}
