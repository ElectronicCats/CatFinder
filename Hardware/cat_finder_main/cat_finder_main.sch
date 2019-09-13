EESchema Schematic File Version 4
LIBS:cat_finder_main-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ROVER MAIN"
Date "2019-07-04"
Rev ""
Comp "Electronic Cats"
Comment1 "Ing. Rocío Rodríguez"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 9530 1200 0    50   ~ 0
GPIO4
Text Label 9530 1400 0    50   ~ 0
GPIO14E
Text Label 9530 1500 0    50   ~ 0
GPIO15E
Text Label 9530 1600 0    50   ~ 0
GPIO13E
Text Label 9530 1700 0    50   ~ 0
GPIO12E
Text Label 9530 1900 0    50   ~ 0
5V
Text Label 8630 1200 2    50   ~ 0
GND
Text Label 8630 1300 2    50   ~ 0
TX
Text Label 8630 1400 2    50   ~ 0
RX
Text Label 8630 1500 2    50   ~ 0
3.3V-5V
Text Label 8630 1700 2    50   ~ 0
GPIO0
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5D1FDE55
P 2440 3960
F 0 "J1" H 2358 3635 50  0000 C CNN
F 1 "BATT" H 2358 3726 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 2440 3960 50  0001 C CNN
F 3 "~" H 2440 3960 50  0001 C CNN
	1    2440 3960
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5D203ACE
P 3630 3780
F 0 "C3" H 3380 3800 50  0000 L CNN
F 1 "0.1uf" H 3310 3720 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3630 3780 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/427/kseries-211347.pdf" H 3630 3780 50  0001 C CNN
F 4 "K104K15X7RF53H5" H 3630 3780 50  0001 C CNN "manf#"
	1    3630 3780
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5D20843E
P 5200 1710
F 0 "R1" H 5141 1664 50  0000 R CNN
F 1 "330" H 5141 1755 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 5200 1710 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/447/Yageo%20LR_CFR_2013-595289.pdf" H 5200 1710 50  0001 C CNN
F 4 "CFR-25JT-52-330R" H 5200 1710 50  0001 C CNN "manf#"
	1    5200 1710
	-1   0    0    1   
$EndComp
Text Label 2010 6410 2    50   ~ 0
SCL
Text Label 2010 6510 2    50   ~ 0
SDA
$Comp
L Connector:Conn_01x08_Female J3
U 1 1 5D217A12
P 3770 6360
F 0 "J3" H 3798 6336 50  0000 L CNN
F 1 "CSS811" H 3798 6245 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 3770 6360 50  0001 C CNN
F 3 "~" H 3770 6360 50  0001 C CNN
	1    3770 6360
	1    0    0    -1  
$EndComp
Text Label 3570 6260 2    50   ~ 0
SCL
Text Label 3570 6360 2    50   ~ 0
SDA
Text Label 3570 6460 2    50   ~ 0
WAKE
Text Label 3570 6560 2    50   ~ 0
INTCSS
Text Label 3570 6660 2    50   ~ 0
RESET
NoConn ~ 3570 6760
Text Label 10530 2770 2    50   ~ 0
TX
Text Label 10530 2870 2    50   ~ 0
RX
Wire Notes Line
	7000 6530 7000 470 
Wire Notes Line
	480  2650 7000 2650
Wire Notes Line
	480  5260 7000 5260
Text Notes 500  590  0    50   ~ 0
REGULATOR\n
Text Notes 920  2850 0    50   ~ 0
CHARGER\n\n
Text Notes 1010 5400 0    50   ~ 0
SENSORS\n
Text Notes 7300 700  0    50   ~ 0
MICROCONTROLLER\n
$Comp
L Connector_Generic:Conn_01x06 J7
U 1 1 5D21C475
P 10730 2870
F 0 "J7" H 10810 2862 50  0000 L CNN
F 1 "FTDI" H 10810 2771 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 10730 2870 50  0001 C CNN
F 3 "~" H 10730 2870 50  0001 C CNN
	1    10730 2870
	1    0    0    -1  
$EndComp
Text Label 9180 3190 2    50   ~ 0
GPIO14
Text Label 9180 3090 2    50   ~ 0
GPIO15
Text Label 10530 3070 2    50   ~ 0
CTS
Text Label 10530 2670 2    50   ~ 0
DTR
$Comp
L power:GND #PWR018
U 1 1 5D230BD1
P 10230 3270
F 0 "#PWR018" H 10230 3020 50  0001 C CNN
F 1 "GND" H 10230 3130 50  0000 C CNN
F 2 "" H 10230 3270 50  0001 C CNN
F 3 "" H 10230 3270 50  0001 C CNN
	1    10230 3270
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5D239A91
P 8980 3290
F 0 "#PWR014" H 8980 3040 50  0001 C CNN
F 1 "GND" H 8980 3150 50  0000 C CNN
F 2 "" H 8980 3290 50  0001 C CNN
F 3 "" H 8980 3290 50  0001 C CNN
	1    8980 3290
	1    0    0    -1  
$EndComp
Wire Wire Line
	10230 3270 10230 3170
Wire Wire Line
	10230 3170 10530 3170
$Comp
L power:GND #PWR07
U 1 1 5D244C67
P 3280 2290
F 0 "#PWR07" H 3280 2040 50  0001 C CNN
F 1 "GND" H 3285 2117 50  0000 C CNN
F 2 "" H 3280 2290 50  0001 C CNN
F 3 "" H 3280 2290 50  0001 C CNN
	1    3280 2290
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LD1117S12TR_SOT223 U1
U 1 1 5D24562A
P 3280 1690
F 0 "U1" H 3280 1932 50  0000 C CNN
F 1 "LD1117A33" H 3280 1841 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 3280 1890 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/389/ld1117a-974076.pdf" H 3380 1440 50  0001 C CNN
F 4 "LD1117AV33" H 3280 1690 50  0001 C CNN "manf#"
	1    3280 1690
	1    0    0    -1  
$EndComp
Wire Wire Line
	3280 2190 3280 1990
Connection ~ 3280 2190
Wire Wire Line
	3280 2290 3280 2190
Wire Wire Line
	2380 1990 2380 2190
Wire Wire Line
	2380 2190 3280 2190
Wire Wire Line
	2980 1690 2380 1690
Connection ~ 2380 1690
Wire Wire Line
	2380 1690 2380 1790
Wire Wire Line
	3980 1990 3980 2190
Wire Wire Line
	3980 2190 3280 2190
Wire Wire Line
	3580 1690 3980 1690
Wire Wire Line
	3980 1690 3980 1790
Connection ~ 3980 1690
$Comp
L power:+3.3V #PWR012
U 1 1 5D250389
P 5200 1000
F 0 "#PWR012" H 5200 850 50  0001 C CNN
F 1 "+3.3V" H 5215 1173 50  0000 C CNN
F 2 "" H 5200 1000 50  0001 C CNN
F 3 "" H 5200 1000 50  0001 C CNN
	1    5200 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5D250A5A
P 5200 1250
F 0 "D2" V 5239 1132 50  0000 R CNN
F 1 "ON" V 5148 1132 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 5200 1250 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/427/vlcs5130-1315889.pdf" H 5200 1250 50  0001 C CNN
F 4 "VLCS5130" V 5200 1250 50  0001 C CNN "manf#"
	1    5200 1250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5D250EB3
P 5200 2000
F 0 "#PWR013" H 5200 1750 50  0001 C CNN
F 1 "GND" H 5205 1827 50  0000 C CNN
F 2 "" H 5200 2000 50  0001 C CNN
F 3 "" H 5200 2000 50  0001 C CNN
	1    5200 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1000 5200 1100
Wire Wire Line
	5200 1400 5200 1610
Wire Wire Line
	5200 1810 5200 2000
NoConn ~ 10530 2970
Text Label 2740 3860 0    50   ~ 0
BATT
Wire Wire Line
	2640 3860 2740 3860
$Comp
L power:GND #PWR03
U 1 1 5D2402CD
P 2740 4060
F 0 "#PWR03" H 2740 3810 50  0001 C CNN
F 1 "GND" H 2745 3887 50  0000 C CNN
F 2 "" H 2740 4060 50  0001 C CNN
F 3 "" H 2740 4060 50  0001 C CNN
	1    2740 4060
	1    0    0    -1  
$EndComp
Wire Wire Line
	2640 3960 2740 3960
Wire Wire Line
	2740 3960 2740 4060
$Comp
L power:+3.3V #PWR01
U 1 1 5D2414D2
P 1760 6140
F 0 "#PWR01" H 1760 5990 50  0001 C CNN
F 1 "+3.3V" H 1775 6313 50  0000 C CNN
F 2 "" H 1760 6140 50  0001 C CNN
F 3 "" H 1760 6140 50  0001 C CNN
	1    1760 6140
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5D243A0B
P 1760 6340
F 0 "#PWR02" H 1760 6090 50  0001 C CNN
F 1 "GND" H 1765 6167 50  0000 C CNN
F 2 "" H 1760 6340 50  0001 C CNN
F 3 "" H 1760 6340 50  0001 C CNN
	1    1760 6340
	1    0    0    -1  
$EndComp
Wire Wire Line
	1760 6140 1760 6210
Wire Wire Line
	1760 6210 2010 6210
Wire Wire Line
	1760 6340 1760 6310
Wire Wire Line
	1760 6310 2010 6310
$Comp
L power:+3.3V #PWR08
U 1 1 5D246C08
P 3280 6000
F 0 "#PWR08" H 3280 5850 50  0001 C CNN
F 1 "+3.3V" H 3295 6173 50  0000 C CNN
F 2 "" H 3280 6000 50  0001 C CNN
F 3 "" H 3280 6000 50  0001 C CNN
	1    3280 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3280 6000 3280 6060
Wire Wire Line
	3280 6060 3570 6060
$Comp
L power:VCC #PWR05
U 1 1 5D24F7E2
P 3630 3490
F 0 "#PWR05" H 3630 3340 50  0001 C CNN
F 1 "VCC" H 3647 3663 50  0000 C CNN
F 2 "" H 3630 3490 50  0001 C CNN
F 3 "" H 3630 3490 50  0001 C CNN
	1    3630 3490
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5D25622A
P 3630 4080
F 0 "#PWR06" H 3630 3830 50  0001 C CNN
F 1 "GND" H 3635 3907 50  0000 C CNN
F 2 "" H 3630 4080 50  0001 C CNN
F 3 "" H 3630 4080 50  0001 C CNN
	1    3630 4080
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5D256EC2
P 5220 4080
F 0 "#PWR011" H 5220 3830 50  0001 C CNN
F 1 "GND" H 5225 3907 50  0000 C CNN
F 2 "" H 5220 4080 50  0001 C CNN
F 3 "" H 5220 4080 50  0001 C CNN
	1    5220 4080
	1    0    0    -1  
$EndComp
Wire Wire Line
	5020 3880 5220 3880
Wire Wire Line
	5220 3880 5220 4080
Wire Wire Line
	3630 3880 3630 4080
Wire Wire Line
	5220 3610 5220 3680
Wire Wire Line
	5220 3680 5020 3680
Text Label 5220 3610 0    50   ~ 0
BATT
Connection ~ 3630 3680
Connection ~ 3630 3880
$Comp
L power:+3.3V #PWR016
U 1 1 5D26003E
P 9100 2790
F 0 "#PWR016" H 9100 2640 50  0001 C CNN
F 1 "+3.3V" H 9115 2963 50  0000 C CNN
F 2 "" H 9100 2790 50  0001 C CNN
F 3 "" H 9100 2790 50  0001 C CNN
	1    9100 2790
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR019
U 1 1 5D2614CB
P 8270 1830
F 0 "#PWR019" H 8270 1680 50  0001 C CNN
F 1 "+3.3V" H 8285 2003 50  0000 C CNN
F 2 "" H 8270 1830 50  0001 C CNN
F 3 "" H 8270 1830 50  0001 C CNN
	1    8270 1830
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5D262BFD
P 8110 1880
F 0 "#PWR020" H 8110 1630 50  0001 C CNN
F 1 "GND" H 8110 1740 50  0000 C CNN
F 2 "" H 8110 1880 50  0001 C CNN
F 3 "" H 8110 1880 50  0001 C CNN
	1    8110 1880
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5D2637CD
P 9750 1870
F 0 "#PWR015" H 9750 1620 50  0001 C CNN
F 1 "GND" H 9750 1730 50  0000 C CNN
F 2 "" H 9750 1870 50  0001 C CNN
F 3 "" H 9750 1870 50  0001 C CNN
	1    9750 1870
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Female J4
U 1 1 5D28DF12
P 9380 3090
F 0 "J4" H 9408 3066 50  0000 L CNN
F 1 "DRIVERS" H 9408 2975 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 9380 3090 50  0001 C CNN
F 3 "~" H 9380 3090 50  0001 C CNN
	1    9380 3090
	1    0    0    1   
$EndComp
Wire Wire Line
	9180 2790 9100 2790
Wire Wire Line
	8980 3290 9180 3290
Text Label 8630 1800 2    50   ~ 0
SCLE
Text Label 9180 2890 2    50   ~ 0
GPIO12
$Comp
L Device:CP1_Small C1
U 1 1 5D35F3A4
P 2380 1890
F 0 "C1" H 2471 1936 50  0000 L CNN
F 1 "10uf" H 2471 1845 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 2380 1890 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/445/860010372001-1093821.pdf" H 2380 1890 50  0001 C CNN
F 4 "860010372001" H 2380 1890 50  0001 C CNN "manf#"
	1    2380 1890
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C2
U 1 1 5D36122D
P 3980 1890
F 0 "C2" H 4071 1936 50  0000 L CNN
F 1 "10uf" H 4071 1845 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 3980 1890 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/445/860010372001-1093821.pdf" H 3980 1890 50  0001 C CNN
F 4 "860010372001" H 3980 1890 50  0001 C CNN "manf#"
	1    3980 1890
	1    0    0    -1  
$EndComp
Wire Wire Line
	9530 1800 9750 1800
Wire Wire Line
	9750 1870 9750 1800
Wire Wire Line
	8270 1830 8270 1900
Wire Wire Line
	8270 1900 8630 1900
Wire Wire Line
	8630 1600 8110 1600
Wire Wire Line
	8110 1600 8110 1880
Text Label 9180 2990 2    50   ~ 0
GPIO13
Text Label 2380 910  0    50   ~ 0
BATT
Wire Wire Line
	3630 3490 3630 3680
$Comp
L power:GND #PWR023
U 1 1 5D494473
P 7510 1360
F 0 "#PWR023" H 7510 1110 50  0001 C CNN
F 1 "GND" H 7510 1220 50  0000 C CNN
F 2 "" H 7510 1360 50  0001 C CNN
F 3 "" H 7510 1360 50  0001 C CNN
	1    7510 1360
	1    0    0    -1  
$EndComp
Text Label 7600 1160 2    50   ~ 0
GPIO0
Wire Notes Line
	7000 3910 11220 3910
$Comp
L Connector_Generic:Conn_01x12 J8
U 1 1 5D4B16D4
P 8100 4980
F 0 "J8" H 8050 5730 50  0000 L CNN
F 1 "Digital" H 7980 5610 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 8100 4980 50  0001 C CNN
F 3 "~" H 8100 4980 50  0001 C CNN
	1    8100 4980
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x12 J10
U 1 1 5D4B2024
P 8780 5090
F 0 "J10" H 8698 4265 50  0000 C CNN
F 1 "Analog" H 8698 4356 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 8780 5090 50  0001 C CNN
F 3 "~" H 8780 5090 50  0001 C CNN
	1    8780 5090
	-1   0    0    1   
$EndComp
Text Label 7900 4580 2    50   ~ 0
TX
Text Label 7900 4480 2    50   ~ 0
RX
Text Label 7900 4680 2    50   ~ 0
RST
$Comp
L power:GND #PWR024
U 1 1 5D4B3B5B
P 7400 5600
F 0 "#PWR024" H 7400 5350 50  0001 C CNN
F 1 "GND" H 7400 5460 50  0000 C CNN
F 2 "" H 7400 5600 50  0001 C CNN
F 3 "" H 7400 5600 50  0001 C CNN
	1    7400 5600
	1    0    0    -1  
$EndComp
Text Label 7900 4880 2    50   ~ 0
2
Text Label 7900 4980 2    50   ~ 0
3
Text Label 7900 5080 2    50   ~ 0
4
Text Label 7900 5180 2    50   ~ 0
5
Text Label 7900 5280 2    50   ~ 0
6
Text Label 7900 5380 2    50   ~ 0
7
Text Label 7900 5580 2    50   ~ 0
9
Text Label 8980 5590 0    50   ~ 0
10
Text Label 8980 5490 0    50   ~ 0
11
Text Label 8980 5390 0    50   ~ 0
12
Text Label 8980 5290 0    50   ~ 0
13
Text Label 8980 5090 0    50   ~ 0
A1
Text Label 8980 4990 0    50   ~ 0
A2
Text Label 8980 4890 0    50   ~ 0
A3
Text Label 8980 4690 0    50   ~ 0
RST
$Comp
L power:GND #PWR026
U 1 1 5D4BA65E
P 9130 5720
F 0 "#PWR026" H 9130 5470 50  0001 C CNN
F 1 "GND" H 9130 5580 50  0000 C CNN
F 2 "" H 9130 5720 50  0001 C CNN
F 3 "" H 9130 5720 50  0001 C CNN
	1    9130 5720
	1    0    0    -1  
$EndComp
Wire Wire Line
	8980 4590 9130 4590
Wire Wire Line
	9130 4590 9130 5720
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 5D4C17BA
P 8450 5850
F 0 "J9" V 8640 5840 50  0000 R CNN
F 1 "i2c" V 8550 5860 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8450 5850 50  0001 C CNN
F 3 "~" H 8450 5850 50  0001 C CNN
	1    8450 5850
	0    -1   -1   0   
$EndComp
Text Label 8450 6050 3    50   ~ 0
SDA
Text Label 8550 6050 3    50   ~ 0
SCL
Text Label 10130 4830 2    50   ~ 0
A3
Text Label 10730 4540 0    50   ~ 0
GPIO12
Text Label 10730 4230 0    50   ~ 0
GPIO13
Text Label 10730 4830 0    50   ~ 0
GPIO15
Text Label 10680 5130 0    50   ~ 0
GPIO14
$Comp
L power:VCC #PWR025
U 1 1 5D4DA522
P 9100 4300
F 0 "#PWR025" H 9100 4150 50  0001 C CNN
F 1 "VCC" H 9117 4473 50  0000 C CNN
F 2 "" H 9100 4300 50  0001 C CNN
F 3 "" H 9100 4300 50  0001 C CNN
	1    9100 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8980 4490 9100 4490
Wire Wire Line
	9100 4490 9100 4300
$Comp
L Device:Jumper JP2
U 1 1 5D4E3A32
P 7810 2550
F 0 "JP2" H 7810 2814 50  0000 C CNN
F 1 "Engine 1A" H 7810 2723 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 7810 2550 50  0001 C CNN
F 3 "~" H 7810 2550 50  0001 C CNN
	1    7810 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP1
U 1 1 5D4E458D
P 7800 3570
F 0 "JP1" H 7800 3834 50  0000 C CNN
F 1 "Engine 2B" H 7800 3743 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 7800 3570 50  0001 C CNN
F 3 "~" H 7800 3570 50  0001 C CNN
	1    7800 3570
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP3
U 1 1 5D4E4BF1
P 7820 3250
F 0 "JP3" H 7820 3514 50  0000 C CNN
F 1 "Engine 2A" H 7820 3423 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 7820 3250 50  0001 C CNN
F 3 "~" H 7820 3250 50  0001 C CNN
	1    7820 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP4
U 1 1 5D4E4FF8
P 7830 2860
F 0 "JP4" H 7830 3124 50  0000 C CNN
F 1 "Engine 1B" H 7830 3033 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 7830 2860 50  0001 C CNN
F 3 "~" H 7830 2860 50  0001 C CNN
	1    7830 2860
	1    0    0    -1  
$EndComp
Text Label 8110 2550 0    50   ~ 0
GPIO12
Text Label 8130 2860 0    50   ~ 0
GPIO13
Text Label 8120 3250 0    50   ~ 0
GPIO15
Text Label 8100 3570 0    50   ~ 0
GPIO14
Text Label 7500 3570 2    50   ~ 0
GPIO14E
Text Label 7520 3250 2    50   ~ 0
GPIO15E
Text Label 7530 2860 2    50   ~ 0
GPIO13E
Text Label 7510 2550 2    50   ~ 0
GPIO12E
$Comp
L power:+3.3V #PWR021
U 1 1 5D48A108
P 4940 5920
F 0 "#PWR021" H 4940 5770 50  0001 C CNN
F 1 "+3.3V" H 4955 6093 50  0000 C CNN
F 2 "" H 4940 5920 50  0001 C CNN
F 3 "" H 4940 5920 50  0001 C CNN
	1    4940 5920
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5D48A735
P 4940 6280
F 0 "#PWR022" H 4940 6030 50  0001 C CNN
F 1 "GND" H 4945 6107 50  0000 C CNN
F 2 "" H 4940 6280 50  0001 C CNN
F 3 "" H 4940 6280 50  0001 C CNN
	1    4940 6280
	1    0    0    -1  
$EndComp
Text Label 5290 6300 2    50   ~ 0
SCL
Text Label 5290 6400 2    50   ~ 0
SDA
Text Label 5290 6500 2    50   ~ 0
FSYNC
$Comp
L Connector:Conn_01x08_Female J5
U 1 1 5D48D256
P 5490 6300
F 0 "J5" H 5518 6276 50  0000 L CNN
F 1 "GY-87" H 5518 6185 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 5490 6300 50  0001 C CNN
F 3 "~" H 5490 6300 50  0001 C CNN
	1    5490 6300
	1    0    0    -1  
$EndComp
Text Label 5290 6600 2    50   ~ 0
INTA
Text Label 5290 6700 2    50   ~ 0
DRDY
Wire Wire Line
	5290 6200 4940 6200
Wire Wire Line
	4940 6200 4940 6280
Wire Wire Line
	5290 6100 4940 6100
Wire Wire Line
	4940 6100 4940 5920
Text Label 5290 6000 2    50   ~ 0
VCC-IN
Text Label 10300 5600 2    50   ~ 0
11
Text Label 10130 4540 2    50   ~ 0
A1
Text Label 10120 5130 2    50   ~ 0
9
$Comp
L Connector:Conn_01x06_Female J2
U 1 1 5D49D204
P 2210 6410
F 0 "J2" H 2238 6386 50  0000 L CNN
F 1 "BME280" H 2238 6295 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 2210 6410 50  0001 C CNN
F 3 "~" H 2210 6410 50  0001 C CNN
	1    2210 6410
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 4780 7400 5600
Wire Wire Line
	7400 4780 7900 4780
Text Label 7900 5480 2    50   ~ 0
8
Text Label 8980 5190 0    50   ~ 0
A0
NoConn ~ 2010 6610
NoConn ~ 2010 6710
Text Label 9530 1300 0    50   ~ 0
GPIO2
Text Notes 7370 4060 0    50   ~ 0
BAST PRO-MINI\n
$Comp
L Device:Jumper_NO_Small JP7
U 1 1 5D4CD611
P 10450 4230
F 0 "JP7" H 10450 4415 50  0000 C CNN
F 1 "Engine 1 A" H 10450 4324 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 10450 4230 50  0001 C CNN
F 3 "~" H 10450 4230 50  0001 C CNN
	1    10450 4230
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 4230 10730 4230
Wire Wire Line
	10350 4230 10130 4230
$Comp
L Device:Jumper_NO_Small JP8
U 1 1 5D4D2033
P 10460 4540
F 0 "JP8" H 10460 4725 50  0000 C CNN
F 1 "Engine 1B" H 10460 4634 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 10460 4540 50  0001 C CNN
F 3 "~" H 10460 4540 50  0001 C CNN
	1    10460 4540
	1    0    0    -1  
$EndComp
Wire Wire Line
	10560 4540 10730 4540
Wire Wire Line
	10360 4540 10130 4540
$Comp
L Device:Jumper_NO_Small JP9
U 1 1 5D4D5761
P 10430 4830
F 0 "JP9" H 10430 5015 50  0000 C CNN
F 1 "Engine 2A" H 10430 4924 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 10430 4830 50  0001 C CNN
F 3 "~" H 10430 4830 50  0001 C CNN
	1    10430 4830
	1    0    0    -1  
$EndComp
Wire Wire Line
	10530 4830 10730 4830
Wire Wire Line
	10130 4830 10330 4830
$Comp
L Device:Jumper_NO_Small JP10
U 1 1 5D4DA54D
P 10400 5130
F 0 "JP10" H 10400 5315 50  0000 C CNN
F 1 "Engine 2B" H 10400 5224 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 10400 5130 50  0001 C CNN
F 3 "~" H 10400 5130 50  0001 C CNN
	1    10400 5130
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 5130 10680 5130
Wire Wire Line
	10300 5130 10120 5130
$Comp
L power:+3.3V #PWR0101
U 1 1 5D54B969
P 3000 6400
F 0 "#PWR0101" H 3000 6250 50  0001 C CNN
F 1 "+3.3V" H 2840 6420 50  0000 C CNN
F 2 "" H 3000 6400 50  0001 C CNN
F 3 "" H 3000 6400 50  0001 C CNN
	1    3000 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5D544C06
P 3200 6470
F 0 "#PWR0102" H 3200 6220 50  0001 C CNN
F 1 "GND" H 3100 6470 50  0000 C CNN
F 2 "" H 3200 6470 50  0001 C CNN
F 3 "" H 3200 6470 50  0001 C CNN
	1    3200 6470
	1    0    0    -1  
$EndComp
Wire Wire Line
	3570 6460 3200 6460
Wire Wire Line
	3200 6460 3200 6470
Wire Wire Line
	3570 6160 3200 6160
Wire Wire Line
	3200 6160 3200 6460
Connection ~ 3200 6460
Wire Wire Line
	3570 6560 3300 6560
Wire Wire Line
	3300 6560 3300 6660
Wire Wire Line
	3300 6660 3570 6660
Wire Wire Line
	3300 6660 3000 6660
Connection ~ 3300 6660
Wire Wire Line
	3000 6660 3000 6400
$Comp
L electroniccats:MCP732831CHARGER U2
U 1 1 5D6C735F
P 4620 3780
F 0 "U2" H 4620 4195 50  0000 C CNN
F 1 "MCP732831CHARGER" H 4620 4104 50  0000 C CNN
F 2 "Batteries:charger_EC_3.3V_battery" H 4620 3780 50  0001 C CNN
F 3 "" H 4620 3780 50  0001 C CNN
F 4 "EC" H 4620 3780 50  0001 C CNN "manf#"
	1    4620 3780
	1    0    0    -1  
$EndComp
Wire Wire Line
	7510 1360 7510 1260
Wire Wire Line
	7510 1260 7600 1260
$Comp
L power:+3.3V #PWR09
U 1 1 5D739360
P 4580 1210
F 0 "#PWR09" H 4580 1060 50  0001 C CNN
F 1 "+3.3V" H 4595 1383 50  0000 C CNN
F 2 "" H 4580 1210 50  0001 C CNN
F 3 "" H 4580 1210 50  0001 C CNN
	1    4580 1210
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J6
U 1 1 5D721C40
P 7800 1160
F 0 "J6" H 7828 1186 50  0000 L CNN
F 1 "PROG" H 7828 1095 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7800 1160 50  0001 C CNN
F 3 "~" H 7800 1160 50  0001 C CNN
	1    7800 1160
	1    0    0    -1  
$EndComp
NoConn ~ 7600 1060
$Comp
L electroniccats:ESP32-CAM U3
U 1 1 5D6F0550
P 9080 1350
F 0 "U3" H 9080 1865 50  0000 C CNN
F 1 "ESP32-CAM" H 9080 1774 50  0000 C CNN
F 2 "Rf:ESP32-CAM" H 9080 1350 50  0001 C CNN
F 3 "" H 9080 1350 50  0001 C CNN
	1    9080 1350
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DPDT_x2 SW1
U 1 1 5D7346B1
P 4180 1410
F 0 "SW1" H 4180 1695 50  0000 C CNN
F 1 "ON Battery" H 4180 1604 50  0000 C CNN
F 2 "connectors:SW_1825116-1" H 4180 1410 50  0001 C CNN
F 3 "~" H 4180 1410 50  0001 C CNN
	1    4180 1410
	1    0    0    -1  
$EndComp
Wire Wire Line
	3980 1410 3980 1690
Wire Wire Line
	4380 1510 4580 1510
Wire Wire Line
	4580 1510 4580 1210
NoConn ~ 4380 1310
Text Label 10130 4230 2    50   ~ 0
A2
$Comp
L Connector:Conn_01x05_Female J11
U 1 1 5D7B90BA
P 10500 5700
F 0 "J11" H 10528 5726 50  0000 L CNN
F 1 "Bast Pin" H 10528 5635 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x05_P2.54mm_Vertical" H 10500 5700 50  0001 C CNN
F 3 "~" H 10500 5700 50  0001 C CNN
	1    10500 5700
	1    0    0    -1  
$EndComp
Text Label 10300 5500 2    50   ~ 0
10
Text Label 10300 5700 2    50   ~ 0
12
Text Label 10300 5800 2    50   ~ 0
13
Text Label 10300 5900 2    50   ~ 0
A0
NoConn ~ 8980 4790
$Comp
L power:VCC #PWR04
U 1 1 5D24A1C2
P 1380 920
F 0 "#PWR04" H 1380 770 50  0001 C CNN
F 1 "VCC" H 1397 1093 50  0000 C CNN
F 2 "" H 1380 920 50  0001 C CNN
F 3 "" H 1380 920 50  0001 C CNN
	1    1380 920 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2380 1010 2380 910 
Wire Wire Line
	2380 1410 2380 1690
Wire Wire Line
	1380 1690 1380 1210
Connection ~ 1380 1210
Wire Wire Line
	1380 1210 1380 920 
Wire Wire Line
	1380 1210 2080 1210
Wire Wire Line
	1380 1690 2380 1690
Wire Wire Line
	3630 3880 4220 3880
$Comp
L Device:R R2
U 1 1 5D7B8864
P 1380 1960
F 0 "R2" H 1450 2006 50  0000 L CNN
F 1 "47k" H 1450 1915 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1310 1960 50  0001 C CNN
F 3 "~" H 1380 1960 50  0001 C CNN
F 4 "1" H 1380 1960 50  0001 C CNN "manf#"
	1    1380 1960
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5D7B9360
P 1380 2220
F 0 "#PWR010" H 1380 1970 50  0001 C CNN
F 1 "GND" H 1385 2047 50  0000 C CNN
F 2 "" H 1380 2220 50  0001 C CNN
F 3 "" H 1380 2220 50  0001 C CNN
	1    1380 2220
	1    0    0    -1  
$EndComp
Wire Wire Line
	1380 1810 1380 1690
Connection ~ 1380 1690
Wire Wire Line
	1380 2110 1380 2220
Wire Wire Line
	3630 3680 4220 3680
$Comp
L Device:Q_PMOS_DGS Q1
U 1 1 5D7BFB03
P 2280 1210
F 0 "Q1" H 2486 1164 50  0000 L CNN
F 1 "Q_PMOS_DGS" H 2486 1255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2480 1310 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/268/TP2104%20C081313-846395.pdf" H 2280 1210 50  0001 C CNN
F 4 "TP2104N3-G" H 2280 1210 50  0001 C CNN "manf#"
	1    2280 1210
	1    0    0    1   
$EndComp
$EndSCHEMATC
