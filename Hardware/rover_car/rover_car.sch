EESchema Schematic File Version 4
LIBS:rover_car-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "DRIVER DE ROVER"
Date "2019-07-09"
Rev "0.1"
Comp "ELECTRONIC CATS"
Comment1 "EDGAR EMMANUEL CAPUCHINO ESCOBEDO"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C_Small C1
U 1 1 5D1CFEEA
P 1850 1350
F 0 "C1" H 1942 1396 50  0000 L CNN
F 1 ".01uF" H 1942 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1850 1350 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/445/885012207039-554525.pdf" H 1850 1350 50  0001 C CNN
F 4 "710-885012207039" H 1850 1350 50  0001 C CNN "manf#"
	1    1850 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1450 1850 1700
Wire Wire Line
	1850 1250 1850 1050
Wire Wire Line
	1850 1050 2150 1050
Wire Wire Line
	2950 1050 2950 1300
$Comp
L Device:CP1_Small C2
U 1 1 5D1D283F
P 2150 1200
F 0 "C2" H 2241 1246 50  0000 L CNN
F 1 "10uF" H 2241 1155 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 2150 1200 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/865090440003.pdf" H 2150 1200 50  0001 C CNN
F 4 "865090440003	" H 2150 1200 50  0001 C CNN "manf#"
	1    2150 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1100 2150 1050
Connection ~ 2150 1050
Wire Wire Line
	2150 1050 2950 1050
$Comp
L power:GND #PWR03
U 1 1 5D1D3A43
P 2150 1350
F 0 "#PWR03" H 2150 1100 50  0001 C CNN
F 1 "GND" H 2155 1177 50  0000 C CNN
F 2 "" H 2150 1350 50  0001 C CNN
F 3 "" H 2150 1350 50  0001 C CNN
	1    2150 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1300 2150 1350
Wire Wire Line
	1850 800  1850 1050
Connection ~ 1850 1050
$Comp
L Motor:Motor_DC M1
U 1 1 5D1D49D6
P 4050 1550
F 0 "M1" H 4208 1546 50  0000 L CNN
F 1 "Motor_DC" H 4208 1455 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 4050 1460 50  0001 C CNN
F 3 "~" H 4050 1460 50  0001 C CNN
	1    4050 1550
	1    0    0    -1  
$EndComp
$Comp
L Motor:Motor_DC M2
U 1 1 5D1D5151
P 4050 2300
F 0 "M2" H 4208 2296 50  0000 L CNN
F 1 "Motor_DC" H 4208 2205 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 4050 2210 50  0001 C CNN
F 3 "~" H 4050 2210 50  0001 C CNN
	1    4050 2300
	1    0    0    -1  
$EndComp
Text Label 4050 1850 0    50   ~ 0
AOUT1
Text Label 4050 1350 0    50   ~ 0
AOUT2
Text Label 4100 2100 0    50   ~ 0
BOUT1
Text Label 4100 2600 0    50   ~ 0
BOUT2
$Comp
L power:GND #PWR04
U 1 1 5D1DD36E
P 2600 2900
F 0 "#PWR04" H 2600 2650 50  0001 C CNN
F 1 "GND" H 2605 2727 50  0000 C CNN
F 2 "" H 2600 2900 50  0001 C CNN
F 3 "" H 2600 2900 50  0001 C CNN
	1    2600 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2700 2550 2900
Wire Wire Line
	2550 2900 2600 2900
Wire Wire Line
	2650 2700 2650 2900
Wire Wire Line
	2650 2900 2600 2900
Connection ~ 2600 2900
$Comp
L Device:C_Small C3
U 1 1 5D1DE261
P 3350 1350
F 0 "C3" H 3442 1396 50  0000 L CNN
F 1 "2.2uF" H 3442 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3350 1350 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/445/885012107012-553996.pdf" H 3350 1350 50  0001 C CNN
F 4 "710-885012107012" H 3350 1350 50  0001 C CNN "manf#"
	1    3350 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 1300 2850 1250
Wire Wire Line
	2850 1250 3350 1250
$Comp
L power:GND #PWR05
U 1 1 5D1DEF80
P 3350 1550
F 0 "#PWR05" H 3350 1300 50  0001 C CNN
F 1 "GND" H 3355 1377 50  0000 C CNN
F 2 "" H 3350 1550 50  0001 C CNN
F 3 "" H 3350 1550 50  0001 C CNN
	1    3350 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1450 3350 1550
Wire Wire Line
	4100 2100 4050 2100
Wire Wire Line
	4100 2600 4050 2600
$Comp
L Device:R_Small R1
U 1 1 5D1E7C75
P 1650 2100
F 0 "R1" V 1450 2100 50  0000 L CNN
F 1 "200mOhms" H 1550 1950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1650 2100 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/315/AOA0000C334-1314047.pdf" H 1650 2100 50  0001 C CNN
F 4 "667-ERJ-U6SFR20V" H 1650 2100 50  0001 C CNN "manf#"
	1    1650 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1900 1650 2000
$Comp
L power:GND #PWR01
U 1 1 5D1EBA36
P 1650 2300
F 0 "#PWR01" H 1650 2050 50  0001 C CNN
F 1 "GND" H 1655 2127 50  0000 C CNN
F 2 "" H 1650 2300 50  0001 C CNN
F 3 "" H 1650 2300 50  0001 C CNN
	1    1650 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 2200 1650 2250
Wire Wire Line
	1850 1700 2050 1700
Text Label 2050 2100 2    50   ~ 0
GPIO4
Text Label 2050 2200 2    50   ~ 0
GPIO2
Wire Wire Line
	1650 1900 2050 1900
Text Label 2050 2300 2    50   ~ 0
GPIO4
Text Label 2050 2400 2    50   ~ 0
GPIO2
Text Label 8300 5100 0    50   ~ 0
GPIO4
Text Label 8300 5000 0    50   ~ 0
GPIO2
$Comp
L Device:C_Small C7
U 1 1 5D1F7E27
P 6500 1450
F 0 "C7" H 6592 1496 50  0000 L CNN
F 1 ".01uF" H 6592 1405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6500 1450 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/445/885012207039-554525.pdf" H 6500 1450 50  0001 C CNN
F 4 "710-885012207039" H 6500 1450 50  0001 C CNN "manf#"
	1    6500 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1550 6500 1800
Wire Wire Line
	6500 1350 6500 1150
Wire Wire Line
	6500 1150 6800 1150
Wire Wire Line
	7600 1150 7600 1400
$Comp
L Device:CP1_Small C8
U 1 1 5D1F7E35
P 6800 1300
F 0 "C8" H 6891 1346 50  0000 L CNN
F 1 "10uF" H 6891 1255 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 6800 1300 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/865090440003.pdf" H 6800 1300 50  0001 C CNN
F 4 "865090440003	" H 6800 1300 50  0001 C CNN "manf#"
	1    6800 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 1200 6800 1150
Connection ~ 6800 1150
Wire Wire Line
	6800 1150 7600 1150
$Comp
L power:GND #PWR015
U 1 1 5D1F7E42
P 6800 1450
F 0 "#PWR015" H 6800 1200 50  0001 C CNN
F 1 "GND" H 6805 1277 50  0000 C CNN
F 2 "" H 6800 1450 50  0001 C CNN
F 3 "" H 6800 1450 50  0001 C CNN
	1    6800 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 1400 6800 1450
Wire Wire Line
	6500 900  6500 1150
Connection ~ 6500 1150
$Comp
L Motor:Motor_DC M5
U 1 1 5D1F7E59
P 8700 1650
F 0 "M5" H 8858 1646 50  0000 L CNN
F 1 "Motor_DC" H 8858 1555 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 8700 1560 50  0001 C CNN
F 3 "~" H 8700 1560 50  0001 C CNN
	1    8700 1650
	1    0    0    -1  
$EndComp
$Comp
L Motor:Motor_DC M6
U 1 1 5D1F7E63
P 8700 2400
F 0 "M6" H 8858 2396 50  0000 L CNN
F 1 "Motor_DC" H 8858 2305 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 8700 2310 50  0001 C CNN
F 3 "~" H 8700 2310 50  0001 C CNN
	1    8700 2400
	1    0    0    -1  
$EndComp
Text Label 8700 1950 0    50   ~ 0
ADER1
Text Label 8700 1450 0    50   ~ 0
ADER2
Text Label 8750 2200 0    50   ~ 0
BDER1
Text Label 8750 2700 0    50   ~ 0
BDER2
$Comp
L power:GND #PWR016
U 1 1 5D1F7E71
P 7250 3000
F 0 "#PWR016" H 7250 2750 50  0001 C CNN
F 1 "GND" H 7255 2827 50  0000 C CNN
F 2 "" H 7250 3000 50  0001 C CNN
F 3 "" H 7250 3000 50  0001 C CNN
	1    7250 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 2800 7200 3000
Wire Wire Line
	7200 3000 7250 3000
Wire Wire Line
	7300 2800 7300 3000
Wire Wire Line
	7300 3000 7250 3000
Connection ~ 7250 3000
$Comp
L Device:C_Small C9
U 1 1 5D1F7E80
P 8000 1450
F 0 "C9" H 8092 1496 50  0000 L CNN
F 1 "2.2uF" H 8092 1405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8000 1450 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/445/885012107012-553996.pdf" H 8000 1450 50  0001 C CNN
F 4 "710-885012107012" H 8000 1450 50  0001 C CNN "manf#"
	1    8000 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1400 7500 1350
Wire Wire Line
	7500 1350 8000 1350
$Comp
L power:GND #PWR017
U 1 1 5D1F7E8C
P 8000 1650
F 0 "#PWR017" H 8000 1400 50  0001 C CNN
F 1 "GND" H 8005 1477 50  0000 C CNN
F 2 "" H 8000 1650 50  0001 C CNN
F 3 "" H 8000 1650 50  0001 C CNN
	1    8000 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 1550 8000 1650
Wire Wire Line
	8750 2200 8700 2200
Wire Wire Line
	8750 2700 8700 2700
$Comp
L Device:R_Small R5
U 1 1 5D1F7E9A
P 6300 2200
F 0 "R5" V 6100 2150 50  0000 L CNN
F 1 "200mOhm" H 6200 2000 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6300 2200 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/315/AOA0000C334-1314047.pdf" H 6300 2200 50  0001 C CNN
F 4 "667-ERJ-U6SFR20V" H 6300 2200 50  0001 C CNN "manf#"
	1    6300 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2000 6300 2100
$Comp
L power:GND #PWR013
U 1 1 5D1F7EA7
P 6300 2400
F 0 "#PWR013" H 6300 2150 50  0001 C CNN
F 1 "GND" H 6305 2227 50  0000 C CNN
F 2 "" H 6300 2400 50  0001 C CNN
F 3 "" H 6300 2400 50  0001 C CNN
	1    6300 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2300 6300 2350
Wire Wire Line
	6500 1800 6700 1800
Wire Wire Line
	6300 2000 6700 2000
$Comp
L Driver_Motor:DRV8833PWP U3
U 1 1 5D1F7EB7
P 7300 2100
F 0 "U3" H 7300 2981 50  0000 C CNN
F 1 "DRV8833PWP" H 7300 2890 50  0000 C CNN
F 2 "Package_SO:HTSSOP-16-1EP_4.4x5mm_P0.65mm_EP3.4x5mm_Mask2.46x2.31mm_ThermalVias" H 7750 2550 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/drv8833.pdf" H 7150 2650 50  0001 C CNN
F 4 "595-DRV8833CPWPR" H 7300 2100 50  0001 C CNN "manf#"
	1    7300 2100
	1    0    0    -1  
$EndComp
Text Notes 6750 3450 0    50   ~ 0
MOTORES LLANTAS DERECHA\n\n
Text Notes 2000 3400 0    50   ~ 0
MOTORES LLANTAS IZQUIERDA\n
Text Label 6700 2200 2    50   ~ 0
GPIO14
Text Label 6700 2300 2    50   ~ 0
GPIO15
Text Label 6700 2500 2    50   ~ 0
GPIO15
Text Label 6700 2400 2    50   ~ 0
GPIO14
Text Label 7900 2200 0    50   ~ 0
ADER1
Text Label 7900 2300 0    50   ~ 0
ADER2
Text Label 7900 2400 0    50   ~ 0
BDER1
Text Label 7900 2500 0    50   ~ 0
BDER2
Text Label 3250 2100 0    50   ~ 0
AOUT1
Text Label 3250 2200 0    50   ~ 0
AOUT2
Text Label 3250 2300 0    50   ~ 0
BOUT1
Text Label 3250 2400 0    50   ~ 0
BOUT2
Text Label 8300 5300 0    50   ~ 0
GPIO14
Text Label 8300 5200 0    50   ~ 0
GPIO15
$Comp
L Device:C_Small C4
U 1 1 5D21617C
P 3600 4750
F 0 "C4" H 3692 4796 50  0000 L CNN
F 1 ".01uF" H 3692 4705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3600 4750 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/445/885012207039-554525.pdf" H 3600 4750 50  0001 C CNN
F 4 "710-885012207039" H 3600 4750 50  0001 C CNN "manf#"
	1    3600 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4850 3600 5100
Wire Wire Line
	3600 4650 3600 4450
Wire Wire Line
	3600 4450 3900 4450
Wire Wire Line
	4700 4450 4700 4700
$Comp
L Device:CP1_Small C5
U 1 1 5D21618A
P 3900 4600
F 0 "C5" H 3991 4646 50  0000 L CNN
F 1 "10uF" H 3991 4555 50  0000 L CNN
F 2 "Capacitor_SMD:C_Elec_4x5.4" H 3900 4600 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/865090440003.pdf" H 3900 4600 50  0001 C CNN
F 4 "865090440003	" H 3900 4600 50  0001 C CNN "manf#"
	1    3900 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4500 3900 4450
Connection ~ 3900 4450
Wire Wire Line
	3900 4450 4700 4450
$Comp
L power:GND #PWR09
U 1 1 5D216197
P 3900 4750
F 0 "#PWR09" H 3900 4500 50  0001 C CNN
F 1 "GND" H 3905 4577 50  0000 C CNN
F 2 "" H 3900 4750 50  0001 C CNN
F 3 "" H 3900 4750 50  0001 C CNN
	1    3900 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4700 3900 4750
Wire Wire Line
	3600 4200 3600 4450
Connection ~ 3600 4450
$Comp
L Motor:Motor_DC M4
U 1 1 5D2161B8
P 5800 5700
F 0 "M4" H 5958 5696 50  0000 L CNN
F 1 "Motor_DC" H 5958 5605 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 5800 5610 50  0001 C CNN
F 3 "~" H 5800 5610 50  0001 C CNN
	1    5800 5700
	1    0    0    -1  
$EndComp
Text Label 5850 5500 0    50   ~ 0
BFDER1
Text Label 5850 6000 0    50   ~ 0
BFDER2
$Comp
L power:GND #PWR010
U 1 1 5D2161C6
P 4350 6300
F 0 "#PWR010" H 4350 6050 50  0001 C CNN
F 1 "GND" H 4355 6127 50  0000 C CNN
F 2 "" H 4350 6300 50  0001 C CNN
F 3 "" H 4350 6300 50  0001 C CNN
	1    4350 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 6100 4300 6300
Wire Wire Line
	4300 6300 4350 6300
Wire Wire Line
	4400 6100 4400 6300
Wire Wire Line
	4400 6300 4350 6300
Connection ~ 4350 6300
Wire Wire Line
	4600 4700 4600 4650
Wire Wire Line
	4600 4650 5100 4650
Wire Wire Line
	5100 4850 5100 4950
Wire Wire Line
	5850 5500 5800 5500
Wire Wire Line
	5850 6000 5800 6000
$Comp
L Device:R_Small R2
U 1 1 5D2161EF
P 3400 5500
F 0 "R2" V 3250 5450 50  0000 L CNN
F 1 "200mOhm" V 3300 5350 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3400 5500 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/315/AOA0000C334-1314047.pdf" H 3400 5500 50  0001 C CNN
F 4 "667-ERJ-U6SFR20V" H 3400 5500 50  0001 C CNN "manf#"
	1    3400 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5300 3400 5400
$Comp
L power:GND #PWR06
U 1 1 5D2161FC
P 3400 5700
F 0 "#PWR06" H 3400 5450 50  0001 C CNN
F 1 "GND" H 3405 5527 50  0000 C CNN
F 2 "" H 3400 5700 50  0001 C CNN
F 3 "" H 3400 5700 50  0001 C CNN
	1    3400 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5600 3400 5650
Wire Wire Line
	3600 5100 3800 5100
Wire Wire Line
	3400 5300 3800 5300
$Comp
L Driver_Motor:DRV8833PWP U2
U 1 1 5D21620A
P 4400 5400
F 0 "U2" H 4400 6281 50  0000 C CNN
F 1 "DRV8833PWP" H 4400 6190 50  0000 C CNN
F 2 "Package_SO:HTSSOP-16-1EP_4.4x5mm_P0.65mm_EP3.4x5mm_Mask2.46x2.31mm_ThermalVias" H 4850 5850 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/drv8833.pdf" H 4250 5950 50  0001 C CNN
F 4 "595-DRV8833CPWPR" H 4400 5400 50  0001 C CNN "manf#"
	1    4400 5400
	1    0    0    -1  
$EndComp
Text Notes 3850 6750 0    50   ~ 0
MOTORES LLANTAS FRONTALES\n\n
Text Label 3800 5500 2    50   ~ 0
GPIO4
Text Label 3800 5600 2    50   ~ 0
GPIO2
Text Label 3800 5800 2    50   ~ 0
GPIO15
Text Label 3800 5700 2    50   ~ 0
GPIO14
Text Label 5000 5500 0    50   ~ 0
AFDER1
Text Label 5000 5600 0    50   ~ 0
AFDER2
Text Label 5000 5700 0    50   ~ 0
BFDER1
Text Label 5000 5800 0    50   ~ 0
BFDER2
Text Label 8300 5400 0    50   ~ 0
GND
$Comp
L power:+12V #PWR02
U 1 1 5D241FAE
P 1850 800
F 0 "#PWR02" H 1850 650 50  0001 C CNN
F 1 "+12V" H 1865 973 50  0000 C CNN
F 2 "" H 1850 800 50  0001 C CNN
F 3 "" H 1850 800 50  0001 C CNN
	1    1850 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1600 1600 1600
Wire Wire Line
	6700 1700 6200 1700
Wire Wire Line
	3800 5000 3200 5000
$Comp
L power:+12V #PWR0104
U 1 1 5D2561B2
P 6500 900
F 0 "#PWR0104" H 6500 750 50  0001 C CNN
F 1 "+12V" H 6515 1073 50  0000 C CNN
F 2 "" H 6500 900 50  0001 C CNN
F 3 "" H 6500 900 50  0001 C CNN
	1    6500 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0105
U 1 1 5D256629
P 3600 4200
F 0 "#PWR0105" H 3600 4050 50  0001 C CNN
F 1 "+12V" H 3615 4373 50  0000 C CNN
F 2 "" H 3600 4200 50  0001 C CNN
F 3 "" H 3600 4200 50  0001 C CNN
	1    3600 4200
	1    0    0    -1  
$EndComp
Wire Notes Line
	450  3850 11200 3850
Wire Notes Line
	5350 500  5350 3850
Wire Notes Line
	7300 3850 7300 6550
Text Notes 7650 6400 0    50   ~ 0
PINES\n
Wire Notes Line
	2700 7800 2700 3850
Text Notes 1150 7650 0    50   ~ 0
ENTRADA DE VOLTAJE
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 5D201608
P 1050 5750
F 0 "J3" H 1130 5742 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 1130 5651 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 1050 5750 50  0001 C CNN
F 3 "~" H 1050 5750 50  0001 C CNN
	1    1050 5750
	1    0    0    -1  
$EndComp
Text Label 850  5850 2    50   ~ 0
GND
$Comp
L power:+12V #PWR08
U 1 1 5D237185
P 850 5750
F 0 "#PWR08" H 850 5600 50  0001 C CNN
F 1 "+12V" V 865 5878 50  0000 L CNN
F 2 "" H 850 5750 50  0001 C CNN
F 3 "" H 850 5750 50  0001 C CNN
	1    850  5750
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x06_Female J1
U 1 1 5D271109
P 8100 5200
F 0 "J1" H 8128 5176 50  0000 L CNN
F 1 "Conn_01x06_Female" H 8128 5085 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 8100 5200 50  0001 C CNN
F 3 "~" H 8100 5200 50  0001 C CNN
	1    8100 5200
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR0106
U 1 1 5D27DD7D
P 8300 4900
F 0 "#PWR0106" H 8300 4750 50  0001 C CNN
F 1 "VCC" V 8300 5050 50  0000 L CNN
F 2 "" H 8300 4900 50  0001 C CNN
F 3 "" H 8300 4900 50  0001 C CNN
	1    8300 4900
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R7
U 1 1 5D250BC0
P 1400 2100
F 0 "R7" H 1459 2146 50  0000 L CNN
F 1 "200mOhms" H 1459 2055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 2100 50  0001 C CNN
F 3 "~" H 1400 2100 50  0001 C CNN
	1    1400 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R9
U 1 1 5D251635
P 6150 2200
F 0 "R9" H 6209 2246 50  0000 L CNN
F 1 "200mOhms" H 6209 2155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 2200 50  0001 C CNN
F 3 "~" H 6150 2200 50  0001 C CNN
	1    6150 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1800 1400 1800
Wire Wire Line
	1400 1800 1400 2000
Wire Wire Line
	1400 2200 1400 2250
Wire Wire Line
	1400 2250 1650 2250
Connection ~ 1650 2250
Wire Wire Line
	1650 2250 1650 2300
$Comp
L Device:R_Small R8
U 1 1 5D258DA4
P 3200 5500
F 0 "R8" H 3259 5546 50  0000 L CNN
F 1 "200mOhm" H 3259 5455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3200 5500 50  0001 C CNN
F 3 "~" H 3200 5500 50  0001 C CNN
	1    3200 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1900 6150 2100
Wire Wire Line
	6150 1900 6700 1900
Wire Wire Line
	6150 2300 6150 2350
Wire Wire Line
	6150 2350 6300 2350
Connection ~ 6300 2350
Wire Wire Line
	6300 2350 6300 2400
Wire Wire Line
	3400 5650 3200 5650
Wire Wire Line
	3200 5650 3200 5600
Connection ~ 3400 5650
Wire Wire Line
	3400 5650 3400 5700
Wire Wire Line
	3200 5400 3200 5200
Wire Wire Line
	3200 5200 3800 5200
$Comp
L power:VCC #PWR0101
U 1 1 5D3268F3
P 1600 1600
F 0 "#PWR0101" H 1600 1450 50  0001 C CNN
F 1 "VCC" H 1617 1773 50  0000 C CNN
F 2 "" H 1600 1600 50  0001 C CNN
F 3 "" H 1600 1600 50  0001 C CNN
	1    1600 1600
	1    0    0    -1  
$EndComp
$Comp
L Driver_Motor:DRV8833PWP U1
U 1 1 5D1CE3C8
P 2650 2000
F 0 "U1" H 2650 2881 50  0000 C CNN
F 1 "DRV8833PWP" H 2650 2790 50  0000 C CNN
F 2 "Package_SO:HTSSOP-16-1EP_4.4x5mm_P0.65mm_EP3.4x5mm_Mask2.46x2.31mm_ThermalVias" H 3100 2450 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/drv8833.pdf" H 2500 2550 50  0001 C CNN
F 4 "595-DRV8833CPWPR" H 2650 2000 50  0001 C CNN "manf#"
	1    2650 2000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0102
U 1 1 5D3276DD
P 6200 1700
F 0 "#PWR0102" H 6200 1550 50  0001 C CNN
F 1 "VCC" H 6217 1873 50  0000 C CNN
F 2 "" H 6200 1700 50  0001 C CNN
F 3 "" H 6200 1700 50  0001 C CNN
	1    6200 1700
	1    0    0    -1  
$EndComp
NoConn ~ 7900 2000
NoConn ~ 3250 1900
$Comp
L power:VCC #PWR0103
U 1 1 5D32E8F4
P 3200 5000
F 0 "#PWR0103" H 3200 4850 50  0001 C CNN
F 1 "VCC" H 3217 5173 50  0000 C CNN
F 2 "" H 3200 5000 50  0001 C CNN
F 3 "" H 3200 5000 50  0001 C CNN
	1    3200 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5D2161E1
P 5100 4950
F 0 "#PWR011" H 5100 4700 50  0001 C CNN
F 1 "GND" H 5105 4777 50  0000 C CNN
F 2 "" H 5100 4950 50  0001 C CNN
F 3 "" H 5100 4950 50  0001 C CNN
	1    5100 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5D2161D5
P 5100 4750
F 0 "C6" H 5192 4796 50  0000 L CNN
F 1 "2.2uF" H 5192 4705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5100 4750 50  0001 C CNN
F 3 "https://www.mouser.mx/datasheet/2/445/885012107012-553996.pdf" H 5100 4750 50  0001 C CNN
F 4 "710-885012107012" H 5100 4750 50  0001 C CNN "manf#"
	1    5100 4750
	1    0    0    -1  
$EndComp
Text Label 5800 4750 0    50   ~ 0
AFDER2
Text Label 5800 5250 0    50   ~ 0
AFDER1
$Comp
L Motor:Motor_DC M3
U 1 1 5D2161AE
P 5800 4950
F 0 "M3" H 5958 4946 50  0000 L CNN
F 1 "Motor_DC" H 5958 4855 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 5800 4860 50  0001 C CNN
F 3 "~" H 5800 4860 50  0001 C CNN
	1    5800 4950
	1    0    0    -1  
$EndComp
NoConn ~ 5000 5300
NoConn ~ 5250 3250
$EndSCHEMATC
