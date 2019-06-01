#include "mywindow.h"

int max_idx;

/* Class Constructor */
MyWindow::MyWindow(QWidget *parent) : QWidget(parent)
{
	// 初始化變數
	stroke.clear();
    lines.clear();
    painting = false;
	acc_flag=false;
	// 主視窗
    setWindowTitle("Example");
    resize(1200, 480);
	move(100,100);
	setStyleSheet("background-color:#424242;");

	


    /* OK 按鈕 */
	conf_btn = new QPushButton("OK",this); //按鈕名字
	conf_btn->setStyleSheet(
        "QPushButton{border: 2px solid #95A5A6;border-radius:10px;color:rgb(0,0,0);background-color:rgb(195,195,195)}"); //按鈕樣式
    conf_btn->setFont(QFont("Courier", 20, QFont::Bold)); //按鈕字體
	conf_btn->setGeometry(50, 370, 80, 80); //按鈕位置及大小
	connect(conf_btn, SIGNAL(clicked()), this, SLOT(ConfirmButton_clicked())); //點擊按鈕後會呼叫ConfirmButton_clicked函式
	
    /* Clear 按鈕 */
	clr_btn = new QPushButton("Clear",this);
	clr_btn->setStyleSheet(
        "QPushButton{border: 2px solid #95A5A6;border-radius:10px;color:rgb(0,0,0);background-color:rgb(195,195,195)}");
    clr_btn->setFont(QFont("Courier", 20, QFont::Bold));
	clr_btn->setGeometry(150, 370, 80, 80);
	connect(clr_btn, SIGNAL(clicked()), this, SLOT(ClearButton_clicked()));	

	/* sw */
	sw_btn = new QPushButton("sw",this);
	sw_btn->setStyleSheet(
		"QPushButton{border: 2px solid #95A5A6;border-radius:10px;color:rgb(0,0,0);background-color:rgb(195,195,195)}"); //按鈕樣式
	sw_btn->setFont(QFont("Courier", 20, QFont::Bold)); //按鈕字體
	sw_btn->setFont(QFont("Courier", 20, QFont::Bold));
	sw_btn->setGeometry(250, 370, 80, 80);
	connect(sw_btn, SIGNAL(clicked()), this, SLOT(SW_clicked()));	
}

 

/* 將繪圖框存成//jpg ppm */
void MyWindow::ConfirmButton_clicked()
{
	// 選取存圖範圍
	QPixmap qpx;
    QImage img = qpx.grabWidget(this, 50, 50, 280, 280).scaled(28,28,Qt::KeepAspectRatio,Qt::SmoothTransformation).toImage();	
    
	QSize colImgSize = img.size();
 	int width = colImgSize.rwidth();
 	int height = colImgSize.rheight();
 unsigned char* colImgDataPtr = img.bits();
      
      // 將圖片轉成灰階ppm的格式
 	QImage grayImg(colImgSize,QImage::Format_Indexed8);
	unsigned char* grayImgDataPtr = grayImg.bits();
	for(int i=0; i<height; i++)
	{
		for(int j=0; j<width; j++) {
				*grayImgDataPtr = *(colImgDataPtr+1);
				colImgDataPtr += 4;
				grayImgDataPtr++;
		}   
	}   
     
	QVector<QRgb> grayColTable;
	unsigned int rgb = 0;
	for(int i=0; i<256; i++)	
	{
		grayColTable.append(rgb);	
		rgb += 0x00010101;
	}   
	grayImg.setColorTable(grayColTable);
    

    grayImg.save(img_name, "ppm");
	update();
}

/* 清除畫框 */
void MyWindow::ClearButton_clicked()
{
	stroke.clear();	// 清除當前軌跡
    lines.clear();	// 清除畫過的位置
    painting = false;
    update();
}

void MyWindow::mousePressEvent(QMouseEvent* event)
{
    /* 畫筆只能落在此範圍: 325>x>55 && 325>y>55 */
	if(event->x()>55 && event->x()<325 && event->y()>55 && event->y()<325)
    {    
        painting = true;
        stroke.push_back(event->pos());	//存下落筆座標
    }
    update();
}

void MyWindow::mouseMoveEvent(QMouseEvent* event)
{
	/* 只有在滑鼠按下後才紀錄鼠標移動過的座標 */
	if(event->x()>55 && event->x()<325 && event->y()>55 && event->y()<325 && painting)
	{
        stroke.push_back(event->pos());
    	update();
	}
}

void MyWindow::mouseReleaseEvent(QMouseEvent*)
{
	/* 按下滑鼠後鬆開會將畫過的軌跡存在畫布上，並清空軌跡 */
	if(painting)
    {    
        painting = false;        
        lines.push_back(stroke);
        stroke.clear();  
    }
    update();
}

void MyWindow::paintEvent(QPaintEvent*)
{
	// 設定畫筆樣式
	QPainter painter(this);
	painter.setFont(QFont("Arial", 10));
	painter.setBrush(Qt::white);
	painter.setPen(QPen(QColor("#FFFFFF")));

	// 建立畫框範圍
	painter.drawRect(49, 49, 282, 282);

	// 設定畫筆樣式
	painter.setPen(QPen(Qt::black, 18));

	// 繪出畫過的位置
	for(int i=0; i<lines.size(); i++) {
		for(int j=0; j<lines[i].size(); ++j)
			painter.drawPoint(lines[i][j].x(), lines[i][j].y());
   	}
	
	// 繪出當前落筆後的軌跡
	for(int i=0; i<stroke.size(); i++)
        painter.drawPoint(stroke[i].x(), stroke[i].y());	
	painter.setPen(QPen(Qt::white));
    painter.drawRect(424, 49, 282, 282);

    painter.drawRect(798, 49, 282, 401);                                        
    painter.setBrush(Qt::NoBrush);
    painter.setPen(QPen(Qt::black));
    painter.drawLine(390, 410, 750, 410);   
    painter.drawImage(424,49,QImage(img_name).scaled(280, 280, Qt::KeepAspectRatio, Qt::SmoothTransformation));
    if(acc_flag)
    {
        char i_str[2];
        char str[20];
        char res_str[20];
        for(int i=0 ; i<10 ;i++)
        {
            painter.setPen(Qt::NoPen);
           if(results[i]>0)
                painter.setBrush(QColor("#3498DB"));
            else
                painter.setBrush(QColor("#F39C12"));
            painter.drawRect(390+36*i, 410, 35, -(results[i]*1.5));
            snprintf(str,sizeof(str),"%.1f",results[i]);
            snprintf(i_str,sizeof(i_str),"%d",i);
            painter.setPen(QPen(Qt::black));
            painter.drawText(390+36*i+9, 410, 20, -10, Qt::AlignCenter, i_str);
        }
        painter.drawLine(390, 410, 750, 410);
        snprintf(res_str,sizeof(res_str),"%d",max_idx);
        painter.setFont(QFont("Arial",280));
        painter.drawText(798, 110, 280, 280, Qt::AlignCenter, res_str);
        painter.setBrush(Qt::NoBrush);      
    }   
}


void MyWindow::SW_clicked()
{   
    qDebug() << "--------Start--------";
    
    acc_flag = accuracy();
  
    update();
    qDebug() << "--------End--------";
}

/* calculate accuracy */
bool MyWindow::accuracy(){

    float w_h1[NODE_LAYER_1][NODE_LAYER_0];
    float w_o[NODE_LAYER_2][NODE_LAYER_1];
    float b_h1[NODE_LAYER_1];
    float b_o[NODE_LAYER_2];

    float v_h1[NODE_LAYER_1];

    int input[NODE_LAYER_0];
    float inputf[NODE_LAYER_0];
    FILE *fileprint;
    char filename[64];
    int i, j;

    float max;
                         // training data //
    strcpy(filename, "merge.txt");

    fileprint = fopen(filename, "r");
    if (fileprint==NULL){
        puts("ERROR: read model.");
        exit(-1);
    }
    for (i=0;i<NODE_LAYER_1;i++)
        for (j=0;j<NODE_LAYER_0;j++)
            fscanf(fileprint, "%x", (unsigned int*)&w_h1[i][j]);
        
    for (i=0;i<NODE_LAYER_1;i++)
        fscanf(fileprint, "%x", (unsigned int*)&b_h1[i]);
    
    for (i=0;i<NODE_LAYER_2;i++)
        for (j=0;j<NODE_LAYER_1;j++)
            fscanf(fileprint, "%x", (unsigned int*)&w_o[i][j]);
        
    for (i=0;i<NODE_LAYER_2;i++)
        fscanf(fileprint, "%x", (unsigned int*)&b_o[i]);
    fclose(fileprint);
    
    // input data 
    unsigned char buffer[BUFFER_SIZE];
    fileprint = fopen(img_name, "r");
    //fileprint = fopen("00001.ppm", "r");



    if (fileprint==NULL){
        puts("err input");
        return 0;
    }
    
    fseek(fileprint, 14, SEEK_SET);
    fread(buffer,1,BUFFER_SIZE,fileprint);
    
    for (i=0;i<NODE_LAYER_0;i++){
        input[i]=buffer[i*3];
    }





	 printf("\n");
    fclose(fileprint);
    for (i=0;i<NODE_LAYER_0;i++){
        input[i] = 255 - input[i];
        inputf[i] = ((float)input[i]) * (1.0/255.0);
    }


    for (i=0;i<NODE_LAYER_1;i++){
        v_h1[i] = 0.0;


        for (j=0;j<NODE_LAYER_0;j++){
            v_h1[i] += inputf[j]*w_h1[i][j];
        }

    }
    for (i=0;i<NODE_LAYER_1;i++){
        v_h1[i] += b_h1[i];
        if(v_h1[i]<0.0) v_h1[i] = 0.0;
    }

    /* Calculate output layer. */  
	for (i=0;i<NODE_LAYER_2;i++){
        results[i] = 0.0;
        for (j=0;j<NODE_LAYER_1;j++)
            results[i] += v_h1[j]*w_o[i][j];
    }
    for (i=0;i<NODE_LAYER_2;i++)
        results[i] += b_o[i];

    for (i=0;i<10;i++)
        printf("results[%d]: %f\n", i , results[i]);
    printf("\n");

    // Find max value. //
    max = results[0];
    max_idx = 0;
    for (i=1;i<NODE_LAYER_2;i++)
        if(max<results[i]){
            max_idx = i;
            max = results[i];
        }
    printf("Final ans:%d\n",max_idx);
	return true;
	//	painter.drawPixmap(220,100,QPixmap(".ppm"));
}
