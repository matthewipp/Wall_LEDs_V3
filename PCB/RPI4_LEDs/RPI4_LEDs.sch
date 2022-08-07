EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L teensy:Teensy4.0 U2
U 1 1 6292F1D7
P 8800 3500
F 0 "U2" H 8800 5115 50  0000 C CNN
F 1 "Teensy4.0" H 8800 5024 50  0000 C CNN
F 2 "teensy:Teensy40" H 8400 3700 50  0001 C CNN
F 3 "" H 8400 3700 50  0001 C CNN
	1    8800 3500
	1    0    0    -1  
$EndComp
$Comp
L Audio:MSGEQ7 U4
U 1 1 62933570
P 4100 6150
F 0 "U4" H 4100 6831 50  0000 C CNN
F 1 "MSGEQ7" H 4100 6740 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 4100 6150 50  0001 C CNN
F 3 "http://mix-sig.com/images/datasheets/MSGEQ7.pdf" H 4100 6150 50  0001 C CNN
	1    4100 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 62945DDF
P 10100 4350
F 0 "#PWR011" H 10100 4200 50  0001 C CNN
F 1 "+5V" H 10115 4523 50  0000 C CNN
F 2 "" H 10100 4350 50  0001 C CNN
F 3 "" H 10100 4350 50  0001 C CNN
	1    10100 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 4350 10100 4450
Wire Wire Line
	10100 4450 9900 4450
$Comp
L power:+3.3V #PWR018
U 1 1 62947903
P 4100 5350
F 0 "#PWR018" H 4100 5200 50  0001 C CNN
F 1 "+3.3V" H 4115 5523 50  0000 C CNN
F 2 "" H 4100 5350 50  0001 C CNN
F 3 "" H 4100 5350 50  0001 C CNN
	1    4100 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5350 4100 5450
$Comp
L power:GNDREF #PWR023
U 1 1 62947FA1
P 4100 6900
F 0 "#PWR023" H 4100 6650 50  0001 C CNN
F 1 "GNDREF" H 4105 6727 50  0000 C CNN
F 2 "" H 4100 6900 50  0001 C CNN
F 3 "" H 4100 6900 50  0001 C CNN
	1    4100 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 6900 4100 6800
$Comp
L Device:R_US R3
U 1 1 62949292
P 3250 6450
F 0 "R3" V 3045 6450 50  0000 C CNN
F 1 "220k" V 3136 6450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3290 6440 50  0001 C CNN
F 3 "~" H 3250 6450 50  0001 C CNN
	1    3250 6450
	0    1    1    0   
$EndComp
Wire Wire Line
	3400 6450 3450 6450
$Comp
L power:+3.3V #PWR022
U 1 1 6294B1D3
P 2900 6400
F 0 "#PWR022" H 2900 6250 50  0001 C CNN
F 1 "+3.3V" H 2915 6573 50  0000 C CNN
F 2 "" H 2900 6400 50  0001 C CNN
F 3 "" H 2900 6400 50  0001 C CNN
	1    2900 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 6400 2900 6450
Wire Wire Line
	2900 6450 3100 6450
$Comp
L Device:C C5
U 1 1 62955EE7
P 3350 6150
F 0 "C5" V 3602 6150 50  0000 C CNN
F 1 "0.1u" V 3511 6150 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3388 6000 50  0001 C CNN
F 3 "~" H 3350 6150 50  0001 C CNN
	1    3350 6150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3500 6150 3600 6150
Wire Wire Line
	3200 6150 3200 5950
Wire Wire Line
	3200 5600 2700 5600
Wire Wire Line
	3200 5950 2700 5950
$Comp
L Device:R_US R1
U 1 1 629599D3
P 2550 5600
F 0 "R1" V 2345 5600 50  0000 C CNN
F 1 "22k" V 2436 5600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2590 5590 50  0001 C CNN
F 3 "~" H 2550 5600 50  0001 C CNN
	1    2550 5600
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R2
U 1 1 62959C49
P 2550 5950
F 0 "R2" V 2345 5950 50  0000 C CNN
F 1 "22k" V 2436 5950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2590 5940 50  0001 C CNN
F 3 "~" H 2550 5950 50  0001 C CNN
	1    2550 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	2400 5600 2000 5600
Wire Wire Line
	2400 5950 2000 5950
Text Label 2000 5600 0    50   ~ 0
Left
Text Label 2000 5950 0    50   ~ 0
Right
Wire Wire Line
	3200 5600 3200 5950
Connection ~ 3200 5950
Wire Wire Line
	4600 5850 5000 5850
Text Label 5000 5850 0    50   ~ 0
Strobe
Wire Wire Line
	4600 5950 5000 5950
Text Label 5000 5950 0    50   ~ 0
Reset_Equalizer
Wire Wire Line
	4600 6250 5000 6250
Text Label 5000 6250 0    50   ~ 0
Equalizer_Out
$Comp
L Device:C C6
U 1 1 6295E6BE
P 4850 6450
F 0 "C6" V 5102 6450 50  0000 C CNN
F 1 "0.1u" V 5011 6450 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 4888 6300 50  0001 C CNN
F 3 "~" H 4850 6450 50  0001 C CNN
	1    4850 6450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4600 6450 4700 6450
Wire Wire Line
	5000 6450 5150 6450
Wire Wire Line
	5150 6450 5150 6800
Wire Wire Line
	5150 6800 4100 6800
Connection ~ 4100 6800
Wire Wire Line
	4100 6800 4100 6650
Wire Wire Line
	7700 3450 7300 3450
Wire Wire Line
	7700 3350 7300 3350
Wire Wire Line
	7700 3250 7300 3250
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 629C19B8
P 5450 1550
F 0 "J1" H 5368 1225 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5368 1316 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5450 1550 50  0001 C CNN
F 3 "~" H 5450 1550 50  0001 C CNN
	1    5450 1550
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 629C3A96
P 5450 2050
F 0 "J2" H 5368 1725 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5368 1816 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5450 2050 50  0001 C CNN
F 3 "~" H 5450 2050 50  0001 C CNN
	1    5450 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	5650 1450 6150 1450
Wire Wire Line
	5650 1550 6150 1550
Wire Wire Line
	5650 1950 6150 1950
Wire Wire Line
	5650 2050 6150 2050
Text Label 6150 1450 0    50   ~ 0
CS
Text Label 6150 1550 0    50   ~ 0
MOSI
Text Label 6150 1950 0    50   ~ 0
MISO
Text Label 7300 3250 0    50   ~ 0
CS
Text Label 7300 3350 0    50   ~ 0
MOSI
Text Label 7300 3450 0    50   ~ 0
MISO
Text Label 6150 2050 0    50   ~ 0
SCK
Wire Wire Line
	7700 2150 7450 2150
$Comp
L power:GNDREF #PWR03
U 1 1 629CB4DE
P 7450 2150
F 0 "#PWR03" H 7450 1900 50  0001 C CNN
F 1 "GNDREF" H 7455 1977 50  0000 C CNN
F 2 "" H 7450 2150 50  0001 C CNN
F 3 "" H 7450 2150 50  0001 C CNN
	1    7450 2150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR016
U 1 1 629CD02C
P 10150 4850
F 0 "#PWR016" H 10150 4700 50  0001 C CNN
F 1 "+3.3V" H 10165 5023 50  0000 C CNN
F 2 "" H 10150 4850 50  0001 C CNN
F 3 "" H 10150 4850 50  0001 C CNN
	1    10150 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR014
U 1 1 629CDBDD
P 10550 4800
F 0 "#PWR014" H 10550 4550 50  0001 C CNN
F 1 "GNDREF" H 10555 4627 50  0000 C CNN
F 2 "" H 10550 4800 50  0001 C CNN
F 3 "" H 10550 4800 50  0001 C CNN
	1    10550 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 4850 10150 4950
Wire Wire Line
	10150 4950 10050 4950
Wire Wire Line
	10050 4950 10050 4650
Wire Wire Line
	10050 4650 9900 4650
Wire Wire Line
	10550 4550 10500 4550
Wire Wire Line
	10550 4550 10550 4800
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 629D2246
P 5450 2600
F 0 "J3" H 5368 2275 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5368 2366 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5450 2600 50  0001 C CNN
F 3 "~" H 5450 2600 50  0001 C CNN
	1    5450 2600
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 629D2E5D
P 5450 3050
F 0 "J4" H 5368 2725 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5368 2816 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5450 3050 50  0001 C CNN
F 3 "~" H 5450 3050 50  0001 C CNN
	1    5450 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 629D37A5
P 5450 3500
F 0 "J5" H 5368 3175 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5368 3266 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5450 3500 50  0001 C CNN
F 3 "~" H 5450 3500 50  0001 C CNN
	1    5450 3500
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J6
U 1 1 629D4077
P 5450 3950
F 0 "J6" H 5368 3625 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5368 3716 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5450 3950 50  0001 C CNN
F 3 "~" H 5450 3950 50  0001 C CNN
	1    5450 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	7700 4050 7150 4050
Text Label 7150 4050 0    50   ~ 0
SCK
$Comp
L Connector:Screw_Terminal_01x02 J7
U 1 1 629EB044
P 5450 4400
F 0 "J7" H 5368 4075 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5368 4166 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5450 4400 50  0001 C CNN
F 3 "~" H 5450 4400 50  0001 C CNN
	1    5450 4400
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J8
U 1 1 629EB04A
P 5450 4850
F 0 "J8" H 5368 4525 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5368 4616 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5450 4850 50  0001 C CNN
F 3 "~" H 5450 4850 50  0001 C CNN
	1    5450 4850
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J9
U 1 1 629EB050
P 5450 5300
F 0 "J9" H 5368 4975 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5368 5066 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5450 5300 50  0001 C CNN
F 3 "~" H 5450 5300 50  0001 C CNN
	1    5450 5300
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J11
U 1 1 629EB056
P 5450 5750
F 0 "J11" H 5368 5425 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5368 5516 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5450 5750 50  0001 C CNN
F 3 "~" H 5450 5750 50  0001 C CNN
	1    5450 5750
	-1   0    0    1   
$EndComp
Wire Wire Line
	7700 2450 7000 2450
Wire Wire Line
	7700 2550 7000 2550
Wire Wire Line
	7700 2650 7000 2650
Wire Wire Line
	7700 2750 7000 2750
Wire Wire Line
	7700 2850 7000 2850
Wire Wire Line
	7700 2950 7000 2950
Wire Wire Line
	7700 3050 7000 3050
Wire Wire Line
	7700 3150 7000 3150
Text Label 7000 2450 0    50   ~ 0
LED_0_3V3
Text Label 7000 2550 0    50   ~ 0
LED_1_3V3
Text Label 7000 2650 0    50   ~ 0
LED_2_3V3
Text Label 7000 2750 0    50   ~ 0
LED_3_3V3
Text Label 7000 2850 0    50   ~ 0
LED_4_3V3
Text Label 7000 2950 0    50   ~ 0
LED_5_3V3
Text Label 7000 3050 0    50   ~ 0
LED_6_3V3
Text Label 7000 3150 0    50   ~ 0
LED_7_3V3
Wire Wire Line
	5650 2500 6150 2500
Wire Wire Line
	5650 2600 6150 2600
Wire Wire Line
	5650 2950 6150 2950
Wire Wire Line
	5650 3050 6150 3050
Wire Wire Line
	5650 3400 6150 3400
Wire Wire Line
	5650 3500 6150 3500
Wire Wire Line
	5650 3850 6150 3850
Wire Wire Line
	5650 3950 6150 3950
Text Label 6150 2500 0    50   ~ 0
LED_0
Text Label 6150 2950 0    50   ~ 0
LED_1
Text Label 6150 3400 0    50   ~ 0
LED_2
Text Label 6150 3850 0    50   ~ 0
LED_3
Wire Wire Line
	5650 4300 6150 4300
Wire Wire Line
	5650 4400 6150 4400
Wire Wire Line
	5650 4750 6150 4750
Wire Wire Line
	5650 4850 6150 4850
Wire Wire Line
	5650 5200 6150 5200
Wire Wire Line
	5650 5300 6150 5300
Wire Wire Line
	5650 5650 6150 5650
Wire Wire Line
	5650 5750 6150 5750
Text Label 6150 4300 0    50   ~ 0
LED_4
Text Label 6150 4750 0    50   ~ 0
LED_5
Text Label 6150 5200 0    50   ~ 0
LED_6
Text Label 6150 5650 0    50   ~ 0
LED_7
$Comp
L power:GNDREF #PWR04
U 1 1 62A0F94E
P 6150 2600
F 0 "#PWR04" H 6150 2350 50  0001 C CNN
F 1 "GNDREF" H 6155 2427 50  0000 C CNN
F 2 "" H 6150 2600 50  0001 C CNN
F 3 "" H 6150 2600 50  0001 C CNN
	1    6150 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR06
U 1 1 62A1106C
P 6150 3050
F 0 "#PWR06" H 6150 2800 50  0001 C CNN
F 1 "GNDREF" H 6155 2877 50  0000 C CNN
F 2 "" H 6150 3050 50  0001 C CNN
F 3 "" H 6150 3050 50  0001 C CNN
	1    6150 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR09
U 1 1 62A12770
P 6150 3500
F 0 "#PWR09" H 6150 3250 50  0001 C CNN
F 1 "GNDREF" H 6155 3327 50  0000 C CNN
F 2 "" H 6150 3500 50  0001 C CNN
F 3 "" H 6150 3500 50  0001 C CNN
	1    6150 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR010
U 1 1 62A1405A
P 6150 3950
F 0 "#PWR010" H 6150 3700 50  0001 C CNN
F 1 "GNDREF" H 6155 3777 50  0000 C CNN
F 2 "" H 6150 3950 50  0001 C CNN
F 3 "" H 6150 3950 50  0001 C CNN
	1    6150 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR012
U 1 1 62A15858
P 6150 4400
F 0 "#PWR012" H 6150 4150 50  0001 C CNN
F 1 "GNDREF" H 6155 4227 50  0000 C CNN
F 2 "" H 6150 4400 50  0001 C CNN
F 3 "" H 6150 4400 50  0001 C CNN
	1    6150 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR015
U 1 1 62A17144
P 6150 4850
F 0 "#PWR015" H 6150 4600 50  0001 C CNN
F 1 "GNDREF" H 6155 4677 50  0000 C CNN
F 2 "" H 6150 4850 50  0001 C CNN
F 3 "" H 6150 4850 50  0001 C CNN
	1    6150 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR017
U 1 1 62A18978
P 6150 5300
F 0 "#PWR017" H 6150 5050 50  0001 C CNN
F 1 "GNDREF" H 6155 5127 50  0000 C CNN
F 2 "" H 6150 5300 50  0001 C CNN
F 3 "" H 6150 5300 50  0001 C CNN
	1    6150 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR021
U 1 1 62A1A3E7
P 6150 5750
F 0 "#PWR021" H 6150 5500 50  0001 C CNN
F 1 "GNDREF" H 6155 5577 50  0000 C CNN
F 2 "" H 6150 5750 50  0001 C CNN
F 3 "" H 6150 5750 50  0001 C CNN
	1    6150 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 4150 7150 4150
Wire Wire Line
	7700 4250 7150 4250
Wire Wire Line
	7700 4350 7150 4350
Text Label 7150 4150 0    50   ~ 0
Equalizer_Out
Text Label 7150 4250 0    50   ~ 0
Reset_Equalizer
Text Label 7150 4350 0    50   ~ 0
Strobe
$Comp
L Connector:AudioJack4 J10
U 1 1 62A2BBFF
P 7750 5550
F 0 "J10" H 7707 5875 50  0000 C CNN
F 1 "AudioJack4" H 7707 5784 50  0000 C CNN
F 2 "Connector_Audio:Jack_3.5mm_CUI_SJ-3524-SMT_Horizontal" H 7750 5550 50  0001 C CNN
F 3 "~" H 7750 5550 50  0001 C CNN
	1    7750 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR020
U 1 1 62A2CAD1
P 8450 5600
F 0 "#PWR020" H 8450 5350 50  0001 C CNN
F 1 "GNDREF" H 8455 5427 50  0000 C CNN
F 2 "" H 8450 5600 50  0001 C CNN
F 3 "" H 8450 5600 50  0001 C CNN
	1    8450 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 5450 8450 5450
Wire Wire Line
	8450 5450 8450 5550
Wire Wire Line
	7950 5550 8450 5550
Connection ~ 8450 5550
Wire Wire Line
	8450 5550 8450 5600
Wire Wire Line
	7950 5750 8000 5750
Wire Wire Line
	8000 5750 8000 6050
Wire Wire Line
	7950 5650 8150 5650
Wire Wire Line
	8150 5650 8150 5900
Text Label 8150 5900 0    50   ~ 0
Left
Text Label 8000 6050 0    50   ~ 0
Right
$Comp
L Device:C C4
U 1 1 62A37FC8
P 4400 5450
F 0 "C4" V 4652 5450 50  0000 C CNN
F 1 "0.1u" V 4561 5450 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 4438 5300 50  0001 C CNN
F 3 "~" H 4400 5450 50  0001 C CNN
	1    4400 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 5450 4100 5450
Connection ~ 4100 5450
Wire Wire Line
	4100 5450 4100 5650
Wire Wire Line
	4550 5450 4800 5450
Wire Wire Line
	4800 5450 4800 5500
$Comp
L power:GNDREF #PWR019
U 1 1 62A3DE4A
P 4800 5500
F 0 "#PWR019" H 4800 5250 50  0001 C CNN
F 1 "GNDREF" H 4805 5327 50  0000 C CNN
F 2 "" H 4800 5500 50  0001 C CNN
F 3 "" H 4800 5500 50  0001 C CNN
	1    4800 5500
	1    0    0    -1  
$EndComp
$Comp
L MyLibrary:SN74HCT125 U1
U 1 1 62A4601A
P 2550 2650
F 0 "U1" H 2800 3681 50  0000 C CNN
F 1 "SN74HCT125" H 2800 3590 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2850 2900 50  0001 C CNN
F 3 "" H 2850 2900 50  0001 C CNN
	1    2550 2650
	1    0    0    -1  
$EndComp
$Comp
L MyLibrary:SN74HCT125 U3
U 1 1 62A47419
P 2550 4400
F 0 "U3" H 2800 5431 50  0000 C CNN
F 1 "SN74HCT125" H 2800 5340 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2850 4650 50  0001 C CNN
F 3 "" H 2850 4650 50  0001 C CNN
	1    2550 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 62A48616
P 2800 1500
F 0 "#PWR01" H 2800 1350 50  0001 C CNN
F 1 "+5V" H 2815 1673 50  0000 C CNN
F 2 "" H 2800 1500 50  0001 C CNN
F 3 "" H 2800 1500 50  0001 C CNN
	1    2800 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 62A4A466
P 2800 3300
F 0 "#PWR07" H 2800 3150 50  0001 C CNN
F 1 "+5V" H 2815 3473 50  0000 C CNN
F 2 "" H 2800 3300 50  0001 C CNN
F 3 "" H 2800 3300 50  0001 C CNN
	1    2800 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR05
U 1 1 62A4C7EF
P 2800 2900
F 0 "#PWR05" H 2800 2650 50  0001 C CNN
F 1 "GNDREF" H 2805 2727 50  0000 C CNN
F 2 "" H 2800 2900 50  0001 C CNN
F 3 "" H 2800 2900 50  0001 C CNN
	1    2800 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR013
U 1 1 62A4E739
P 2800 4700
F 0 "#PWR013" H 2800 4450 50  0001 C CNN
F 1 "GNDREF" H 2805 4527 50  0000 C CNN
F 2 "" H 2800 4700 50  0001 C CNN
F 3 "" H 2800 4700 50  0001 C CNN
	1    2800 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 4550 2800 4600
Wire Wire Line
	2800 3300 2800 3350
Wire Wire Line
	2800 2800 2800 2900
Wire Wire Line
	2800 1500 2800 1550
Wire Wire Line
	3150 1950 3500 1950
Wire Wire Line
	3150 2050 3500 2050
Wire Wire Line
	3150 2150 3500 2150
Wire Wire Line
	3150 2250 3500 2250
Wire Wire Line
	2450 1950 2000 1950
Wire Wire Line
	2450 2150 2000 2150
Wire Wire Line
	2450 2350 2000 2350
Wire Wire Line
	2450 2550 2000 2550
Text Label 2000 2550 0    50   ~ 0
LED_0_3V3
Wire Wire Line
	1800 2650 1800 2450
Wire Wire Line
	1800 2450 2450 2450
Wire Wire Line
	1800 2650 2450 2650
Wire Wire Line
	1800 2250 1800 2450
Wire Wire Line
	1800 2250 2450 2250
Connection ~ 1800 2450
Wire Wire Line
	1800 2050 1800 2250
Wire Wire Line
	1800 2050 2450 2050
Connection ~ 1800 2250
Wire Wire Line
	1800 2650 1800 3800
Wire Wire Line
	1800 3800 2450 3800
Connection ~ 1800 2650
Wire Wire Line
	1800 3800 1800 4000
Wire Wire Line
	1800 4000 2450 4000
Connection ~ 1800 3800
Wire Wire Line
	1800 4000 1800 4200
Wire Wire Line
	1800 4200 2450 4200
Connection ~ 1800 4000
Wire Wire Line
	1800 4200 1800 4400
Wire Wire Line
	1800 4400 2450 4400
Connection ~ 1800 4200
Wire Wire Line
	1800 4400 1800 4600
Wire Wire Line
	1800 4600 2800 4600
Connection ~ 1800 4400
Connection ~ 2800 4600
Wire Wire Line
	2800 4600 2800 4700
Text Label 2000 2350 0    50   ~ 0
LED_1_3V3
Text Label 2000 2150 0    50   ~ 0
LED_2_3V3
Text Label 2000 1950 0    50   ~ 0
LED_3_3V3
Wire Wire Line
	2450 3700 2000 3700
Wire Wire Line
	2450 3900 2000 3900
Wire Wire Line
	2450 4100 2000 4100
Wire Wire Line
	2450 4300 2000 4300
Wire Wire Line
	3150 3700 3500 3700
Wire Wire Line
	3150 3800 3500 3800
Wire Wire Line
	3150 3900 3500 3900
Wire Wire Line
	3150 4000 3500 4000
Text Label 2000 4300 0    50   ~ 0
LED_4_3V3
Text Label 2000 4100 0    50   ~ 0
LED_5_3V3
Text Label 2000 3900 0    50   ~ 0
LED_6_3V3
Text Label 2000 3700 0    50   ~ 0
LED_7_3V3
Text Label 3500 2250 0    50   ~ 0
LED_0
Text Label 3500 2150 0    50   ~ 0
LED_1
Text Label 3500 2050 0    50   ~ 0
LED_2
Text Label 3500 1950 0    50   ~ 0
LED_3
Text Label 3500 4000 0    50   ~ 0
LED_4
Text Label 3500 3900 0    50   ~ 0
LED_5
Text Label 3500 3800 0    50   ~ 0
LED_6
$Comp
L Device:C C2
U 1 1 62ACBB2F
P 3150 3350
F 0 "C2" V 3402 3350 50  0000 C CNN
F 1 "0.1u" V 3311 3350 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3188 3200 50  0001 C CNN
F 3 "~" H 3150 3350 50  0001 C CNN
	1    3150 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 3350 3550 3350
Wire Wire Line
	3550 3350 3550 3400
$Comp
L power:GNDREF #PWR08
U 1 1 62ACBB37
P 3550 3400
F 0 "#PWR08" H 3550 3150 50  0001 C CNN
F 1 "GNDREF" H 3555 3227 50  0000 C CNN
F 2 "" H 3550 3400 50  0001 C CNN
F 3 "" H 3550 3400 50  0001 C CNN
	1    3550 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 62AD0FC7
P 3150 1550
F 0 "C1" V 3402 1550 50  0000 C CNN
F 1 "0.1u" V 3311 1550 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3188 1400 50  0001 C CNN
F 3 "~" H 3150 1550 50  0001 C CNN
	1    3150 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 1550 3550 1550
Wire Wire Line
	3550 1550 3550 1600
$Comp
L power:GNDREF #PWR02
U 1 1 62AD0FCF
P 3550 1600
F 0 "#PWR02" H 3550 1350 50  0001 C CNN
F 1 "GNDREF" H 3555 1427 50  0000 C CNN
F 2 "" H 3550 1600 50  0001 C CNN
F 3 "" H 3550 1600 50  0001 C CNN
	1    3550 1600
	1    0    0    -1  
$EndComp
Text Label 3500 3700 0    50   ~ 0
LED_7
Wire Wire Line
	3000 3350 2800 3350
Connection ~ 2800 3350
Wire Wire Line
	2800 3350 2800 3550
Wire Wire Line
	3000 1550 2800 1550
Connection ~ 2800 1550
Wire Wire Line
	2800 1550 2800 1800
$Comp
L Device:CP1 C3
U 1 1 62AE14AF
P 10500 4400
F 0 "C3" H 10615 4446 50  0000 L CNN
F 1 "1000u" H 10615 4355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D12.5mm_P5.00mm" H 10500 4400 50  0001 C CNN
F 3 "~" H 10500 4400 50  0001 C CNN
	1    10500 4400
	1    0    0    -1  
$EndComp
Connection ~ 10500 4550
Wire Wire Line
	10500 4550 9900 4550
Wire Wire Line
	10100 4450 10300 4450
Wire Wire Line
	10300 4450 10300 4200
Wire Wire Line
	10300 4200 10500 4200
Wire Wire Line
	10500 4200 10500 4250
Connection ~ 10100 4450
$Comp
L Connector:Screw_Terminal_01x02 J12
U 1 1 62B53EBD
P 4200 1500
F 0 "J12" H 4118 1175 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 4118 1266 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 4200 1500 50  0001 C CNN
F 3 "~" H 4200 1500 50  0001 C CNN
	1    4200 1500
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J13
U 1 1 62B59B85
P 4200 2150
F 0 "J13" H 4118 1825 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 4118 1916 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 4200 2150 50  0001 C CNN
F 3 "~" H 4200 2150 50  0001 C CNN
	1    4200 2150
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR0101
U 1 1 62B5F709
P 4550 2300
F 0 "#PWR0101" H 4550 2050 50  0001 C CNN
F 1 "GNDREF" H 4555 2127 50  0000 C CNN
F 2 "" H 4550 2300 50  0001 C CNN
F 3 "" H 4550 2300 50  0001 C CNN
	1    4550 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2050 4550 2050
Wire Wire Line
	4550 2050 4550 2150
Wire Wire Line
	4400 2150 4550 2150
Connection ~ 4550 2150
Wire Wire Line
	4550 2150 4550 2300
$Comp
L power:+5V #PWR0102
U 1 1 62B71628
P 4800 1300
F 0 "#PWR0102" H 4800 1150 50  0001 C CNN
F 1 "+5V" H 4815 1473 50  0000 C CNN
F 2 "" H 4800 1300 50  0001 C CNN
F 3 "" H 4800 1300 50  0001 C CNN
	1    4800 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 1500 4800 1500
Wire Wire Line
	4800 1500 4800 1400
Wire Wire Line
	4400 1400 4800 1400
Connection ~ 4800 1400
Wire Wire Line
	4800 1400 4800 1300
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 62B9735C
P 4350 3600
F 0 "H2" H 4450 3649 50  0000 L CNN
F 1 "MountingHole" H 4450 3558 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 4350 3600 50  0001 C CNN
F 3 "~" H 4350 3600 50  0001 C CNN
	1    4350 3600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 62B9DD30
P 4350 4050
F 0 "H3" H 4450 4099 50  0000 L CNN
F 1 "MountingHole" H 4450 4008 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 4350 4050 50  0001 C CNN
F 3 "~" H 4350 4050 50  0001 C CNN
	1    4350 4050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 62BA4090
P 4350 4500
F 0 "H4" H 4450 4549 50  0000 L CNN
F 1 "MountingHole" H 4450 4458 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 4350 4500 50  0001 C CNN
F 3 "~" H 4350 4500 50  0001 C CNN
	1    4350 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0103
U 1 1 62BAA41A
P 4350 4850
F 0 "#PWR0103" H 4350 4600 50  0001 C CNN
F 1 "GNDREF" H 4355 4677 50  0000 C CNN
F 2 "" H 4350 4850 50  0001 C CNN
F 3 "" H 4350 4850 50  0001 C CNN
	1    4350 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 4600 4350 4700
Wire Wire Line
	4350 4150 4100 4150
Wire Wire Line
	4100 4150 4100 4700
Wire Wire Line
	4100 4700 4350 4700
Connection ~ 4350 4700
Wire Wire Line
	4350 4700 4350 4850
Wire Wire Line
	4100 4150 4100 3800
Wire Wire Line
	4100 3800 4350 3800
Wire Wire Line
	4350 3800 4350 3700
Connection ~ 4100 4150
$Comp
L Device:C C7
U 1 1 62BD5754
P 3450 6700
F 0 "C7" V 3702 6700 50  0000 C CNN
F 1 "30p" V 3611 6700 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3488 6550 50  0001 C CNN
F 3 "~" H 3450 6700 50  0001 C CNN
	1    3450 6700
	-1   0    0    1   
$EndComp
Wire Wire Line
	3450 6950 3450 6850
$Comp
L power:GNDREF #PWR0104
U 1 1 62BDC5A2
P 3450 6950
F 0 "#PWR0104" H 3450 6700 50  0001 C CNN
F 1 "GNDREF" H 3455 6777 50  0000 C CNN
F 2 "" H 3450 6950 50  0001 C CNN
F 3 "" H 3450 6950 50  0001 C CNN
	1    3450 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 6550 3450 6450
Connection ~ 3450 6450
Wire Wire Line
	3450 6450 3600 6450
$EndSCHEMATC
