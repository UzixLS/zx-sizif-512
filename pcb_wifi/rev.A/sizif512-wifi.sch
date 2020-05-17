EESchema Schematic File Version 4
LIBS:sizif512-wifi-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "WiFi module fo SIZIF-512"
Date "2020-04-25"
Rev "A"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x10 J1
U 1 1 5EA42390
P 3725 3875
F 0 "J1" H 3805 3867 50  0000 L CNN
F 1 "Conn_01x10" H 3805 3776 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x10_P2.54mm_Vertical" H 3725 3875 50  0001 C CNN
F 3 "~" H 3725 3875 50  0001 C CNN
	1    3725 3875
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5EA44B99
P 3925 3475
F 0 "#PWR0101" H 3925 3225 50  0001 C CNN
F 1 "GND" V 3930 3347 50  0001 R CNN
F 2 "" H 3925 3475 50  0001 C CNN
F 3 "" H 3925 3475 50  0001 C CNN
	1    3925 3475
	0    -1   1    0   
$EndComp
$Comp
L Regulator_Linear:AMS1117-3.3 U1
U 1 1 5EA457DB
P 6175 2875
F 0 "U1" H 6175 3117 50  0000 C CNN
F 1 "AMS1117-3.3" H 6175 3026 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 6175 3075 50  0001 C CNN
F 3 "http://www.diodes.com/datasheets/AP1117.pdf" H 6275 2625 50  0001 C CNN
	1    6175 2875
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EA46EAD
P 6175 3175
F 0 "#PWR0102" H 6175 2925 50  0001 C CNN
F 1 "GND" V 6180 3047 50  0001 R CNN
F 2 "" H 6175 3175 50  0001 C CNN
F 3 "" H 6175 3175 50  0001 C CNN
	1    6175 3175
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0103
U 1 1 5EA4E2E5
P 7100 2875
F 0 "#PWR0103" H 7100 2725 50  0001 C CNN
F 1 "+3.3V" H 7115 3048 50  0000 C CNN
F 2 "" H 7100 2875 50  0001 C CNN
F 3 "" H 7100 2875 50  0001 C CNN
	1    7100 2875
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5EA4E735
P 7100 3025
F 0 "C3" H 7215 3071 50  0000 L CNN
F 1 "100n" H 7215 2980 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7138 2875 50  0001 C CNN
F 3 "~" H 7100 3025 50  0001 C CNN
	1    7100 3025
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5EA5028B
P 6675 3025
F 0 "C2" H 6793 3071 50  0000 L CNN
F 1 "100u" H 6793 2980 50  0000 L CNN
F 2 "Capacitor_SMD:C_2010_5025Metric_Pad1.52x2.65mm_HandSolder" H 6713 2875 50  0001 C CNN
F 3 "~" H 6675 3025 50  0001 C CNN
	1    6675 3025
	1    0    0    -1  
$EndComp
Wire Wire Line
	6675 3175 6175 3175
Connection ~ 6175 3175
Wire Wire Line
	6475 2875 6675 2875
Connection ~ 6675 2875
Wire Wire Line
	6675 2875 7100 2875
Connection ~ 7100 2875
Wire Wire Line
	7100 3175 6675 3175
Connection ~ 6675 3175
$Comp
L power:+3.3V #PWR0104
U 1 1 5EA534B2
P 6200 3650
F 0 "#PWR0104" H 6200 3500 50  0001 C CNN
F 1 "+3.3V" H 6215 3823 50  0000 C CNN
F 2 "" H 6200 3650 50  0001 C CNN
F 3 "" H 6200 3650 50  0001 C CNN
	1    6200 3650
	1    0    0    -1  
$EndComp
NoConn ~ 3925 3575
NoConn ~ 3925 3675
NoConn ~ 3925 3975
NoConn ~ 3925 4075
Text GLabel 3925 3875 2    50   Output ~ 0
TX
Text GLabel 3925 3775 2    50   Output ~ 0
CTS
Text GLabel 3925 4275 2    50   Input ~ 0
RX
NoConn ~ 3925 4175
Text GLabel 7275 4550 2    50   Input ~ 0
CTS
$Comp
L Device:R R4
U 1 1 5EA5A557
P 7075 4550
F 0 "R4" V 7150 4550 50  0000 C CNN
F 1 "560" V 7075 4550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7005 4550 50  0001 C CNN
F 3 "~" H 7075 4550 50  0001 C CNN
	1    7075 4550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 5EA5B3D0
P 7075 4150
F 0 "R3" V 7150 4150 50  0000 C CNN
F 1 "560" V 7075 4150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7005 4150 50  0001 C CNN
F 3 "~" H 7075 4150 50  0001 C CNN
	1    7075 4150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5EA5B920
P 7075 3950
F 0 "R1" V 7150 3950 50  0000 C CNN
F 1 "560" V 7075 3950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7005 3950 50  0001 C CNN
F 3 "~" H 7075 3950 50  0001 C CNN
	1    7075 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6925 3950 6800 3950
Wire Wire Line
	6925 4150 6800 4150
Text GLabel 7325 4150 2    50   Input ~ 0
TX
Text GLabel 7325 3950 2    50   Output ~ 0
RX
Wire Wire Line
	7225 3950 7325 3950
Wire Wire Line
	7225 4150 7325 4150
$Comp
L power:+5V #PWR0105
U 1 1 5EA5ED12
P 5575 2875
F 0 "#PWR0105" H 5575 2725 50  0001 C CNN
F 1 "+5V" H 5590 3048 50  0000 C CNN
F 2 "" H 5575 2875 50  0001 C CNN
F 3 "" H 5575 2875 50  0001 C CNN
	1    5575 2875
	1    0    0    -1  
$EndComp
Connection ~ 5575 2875
Wire Wire Line
	5575 2875 5875 2875
$Comp
L Device:C C1
U 1 1 5EA5F424
P 5575 3025
F 0 "C1" H 5690 3071 50  0000 L CNN
F 1 "100n" H 5690 2980 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5613 2875 50  0001 C CNN
F 3 "~" H 5575 3025 50  0001 C CNN
	1    5575 3025
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 5EA5FA00
P 3925 4375
F 0 "#PWR0106" H 3925 4225 50  0001 C CNN
F 1 "+5V" V 3940 4503 50  0000 L CNN
F 2 "" H 3925 4375 50  0001 C CNN
F 3 "" H 3925 4375 50  0001 C CNN
	1    3925 4375
	0    1    1    0   
$EndComp
$Comp
L RF_Module:ESP-12E U2
U 1 1 5EA6B089
P 6200 4450
F 0 "U2" H 5725 5250 50  0000 C CNN
F 1 "ESP-12E" H 6625 5250 50  0000 C CNN
F 2 "ESP8266:ESP-12E_SMD" H 6200 4450 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 5850 4550 50  0001 C CNN
	1    6200 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5EA6CF70
P 5325 4050
F 0 "R2" V 5250 4050 50  0000 C CNN
F 1 "10k" V 5325 4050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5255 4050 50  0001 C CNN
F 3 "~" H 5325 4050 50  0001 C CNN
	1    5325 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	6175 3175 5575 3175
$Comp
L power:+3.3V #PWR0107
U 1 1 5EA6E36D
P 5175 4050
F 0 "#PWR0107" H 5175 3900 50  0001 C CNN
F 1 "+3.3V" V 5190 4178 50  0000 L CNN
F 2 "" H 5175 4050 50  0001 C CNN
F 3 "" H 5175 4050 50  0001 C CNN
	1    5175 4050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 5EA6EC02
P 7075 4750
F 0 "R5" V 7000 4750 50  0000 C CNN
F 1 "10k" V 7075 4750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7005 4750 50  0001 C CNN
F 3 "~" H 7075 4750 50  0001 C CNN
	1    7075 4750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5EA6F051
P 7225 4750
F 0 "#PWR0108" H 7225 4500 50  0001 C CNN
F 1 "GND" V 7230 4622 50  0001 R CNN
F 2 "" H 7225 4750 50  0001 C CNN
F 3 "" H 7225 4750 50  0001 C CNN
	1    7225 4750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5EA6F381
P 6200 5150
F 0 "#PWR0109" H 6200 4900 50  0001 C CNN
F 1 "GND" V 6205 5022 50  0001 R CNN
F 2 "" H 6200 5150 50  0001 C CNN
F 3 "" H 6200 5150 50  0001 C CNN
	1    6200 5150
	1    0    0    -1  
$EndComp
NoConn ~ 6800 4850
NoConn ~ 6800 4650
NoConn ~ 6800 4450
NoConn ~ 6800 4350
NoConn ~ 6800 4250
NoConn ~ 6800 4050
NoConn ~ 6800 3850
NoConn ~ 5600 4950
NoConn ~ 5600 4850
NoConn ~ 5600 4750
NoConn ~ 5600 4650
NoConn ~ 5600 4550
NoConn ~ 5600 4450
NoConn ~ 5600 4250
Wire Wire Line
	7275 4550 7225 4550
Wire Wire Line
	6925 4550 6800 4550
Wire Wire Line
	6925 4750 6800 4750
Wire Wire Line
	5475 4050 5600 4050
$Comp
L Device:R R6
U 1 1 5EA7D23F
P 5325 3850
F 0 "R6" V 5250 3850 50  0000 C CNN
F 1 "10k" V 5325 3850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5255 3850 50  0001 C CNN
F 3 "~" H 5325 3850 50  0001 C CNN
	1    5325 3850
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0110
U 1 1 5EA7D51A
P 5175 3850
F 0 "#PWR0110" H 5175 3700 50  0001 C CNN
F 1 "+3.3V" V 5190 3978 50  0000 L CNN
F 2 "" H 5175 3850 50  0001 C CNN
F 3 "" H 5175 3850 50  0001 C CNN
	1    5175 3850
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5EA48AE7
P 5550 3850
F 0 "TP1" H 5608 3968 50  0001 L CNN
F 1 "TestPoint" H 5608 3877 50  0001 L CNN
F 2 "Connector_Pin:Pin_D0.7mm_L6.5mm_W1.8mm_FlatFork" H 5750 3850 50  0001 C CNN
F 3 "~" H 5750 3850 50  0001 C CNN
	1    5550 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5475 3850 5550 3850
Connection ~ 5550 3850
Wire Wire Line
	5550 3850 5600 3850
$EndSCHEMATC
