#include <QtGui/QWidget>
#include <QPushButton>
#include <QPainter>
#include <QPaintEvent>
#include <QImage>
#include <QDebug>
#include <QElapsedTimer>
#include <QPixmap>

#include <QVector>
#include <QPoint>
#include <QMouseEvent>
#include <QPaintEvent>

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <time.h>
#include <math.h>

#define img_name "grayimg.ppm"
#define NODE_LAYER_0 784
#define NODE_LAYER_1 16
#define NODE_LAYER_2 10
#define BUFFER_SIZE 2352


class MyWindow : public QWidget
{
    Q_OBJECT

public:
    explicit MyWindow(QWidget *parent = 0);

protected:
	void paintEvent(QPaintEvent*);

private slots:
    void ConfirmButton_clicked();
    void ClearButton_clicked();
	void SW_clicked();
private:  
	QElapsedTimer timer;
    /* Handwriting */
    QVector<QPoint> stroke;
    QVector<QVector<QPoint> >lines;
    bool painting;

    /* Button */
    QPushButton *clr_btn;
    QPushButton *conf_btn;
	QPushButton *sw_btn;

    /* Mouse Event */
    void mousePressEvent(QMouseEvent* event);
    void mouseMoveEvent(QMouseEvent* event);
    void mouseReleaseEvent(QMouseEvent* event);

	bool acc_flag;
	float results[NODE_LAYER_2];
	bool accuracy();
};

