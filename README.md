# ROSProjet

底层控制部分
## 1.	概述

搭载设备的车体为4轮小白电动车。

**控制策略：**
采用57步进电机拉动控制杆，从而实现对油门、刹车以及转向控制。控制57步进电机通过arduino发送PWM信号实现。

**读数策略：**
转向读数使用角度传感器，返回0-3V电压，油门刹车踏板由于步进电机比较稳定，不会脱步，暂时没有编码器返回。


##	2.	控制策略

Arduino作为中间控制板，对下连接电机驱动板，发出PWM信号控制，对上通过串口接收上层应用发送的控制指令。

**电机介绍及使用：**
使用TB6600驱动板，32细分，两相四线，可以控制57步进电机。
-	输入电压：DC9-40V，这里使用24V；
-	信号输入端：代表脉冲信号的PUL+-，代表方向信号的DIR+-，代表使能信号的EN+-；
-	电机绕组连接：根据说明连接A+，A-，B+，B-。电机上面的接线：黑色A+，绿色A-，红色B+，蓝色B-，两相四线；
-	接线说明：使用共阴极接法，即：PUL-，DIR-接地，PUL+与DIR+分别接入脉冲与方向的控制信号，使能信号可以不接。
-	**接线与波动开关的时候一定要断电。**

![motor](https://github.com/liby3/ROSProjet/blob/control/photos/motor.jpg)


**细分数确定：**

|细分|脉冲转数|S1状态|S2状态|S3状态|说明|
|:--:|:--:|:--:|:--:|:--:|:--:|
|NC|NC|ON|ON|ON|NULL|
|1|200|ON|ON|OFF|step=200代表360°|
|2/A|400|ON|OFF|ON|step=400代表360°|
|2/B|400|OFF|ON|ON|step=400代表360°|
|4|800|ON|OFF|OFF|step=800代表360°|
|8|1600|OFF|ON|OFF|step=1600代表360°|
|16|3200|OFF|OFF|ON|step=3200代表360°|
|32|6400|OFF|OFF|OFF|step=6400代表360°|

**拨码开关：**

|电流(A)|S4状态|S5状态|S6状态|
|:--:|:--:|:--:|:--:|
|0.5|ON|ON|ON|
|1.0|ON|OFF|ON|
|1.5|ON|ON|OFF|
|2.0|ON|OFF|OFF|
|2.5|OFF|ON|ON|
|2.8|OFF|OFF|ON|
|3.0|OFF|ON|OFF|
|3.5|OFF|OFF|OFF|

**Arduino：**

-	控制的频率越高，电机转动速度越快，测试的时候可以从1000Hz开始测试。
-	使用Arduino UNO的pin9作为脉冲信号输出，pin8作为方向信号输出。前者通过loop利用*DigitalWrite()*模拟生成PWM信号，改变后者的高低输出可以改变电机转动的方向。

![motor](https://github.com/liby3/ROSProjet/blob/control/photos/arduino.jpg)


## 3.	读数策略


	

