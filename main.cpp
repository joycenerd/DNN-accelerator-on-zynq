#include <QtGui/QApplication>
#include "mywindow.h"

int main(int argc, char* argv[])
{
    QApplication app(argc, argv);
    MyWindow mw;
    mw.show();

    return app.exec();
}
