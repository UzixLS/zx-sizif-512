EESchema Schematic File Version 4
LIBS:sizif512-cache
EELAYER 30 0
EELAYER END
$Descr A2 23386 16535
encoding utf-8
Sheet 1 1
Title "ZX-SIZIF-512"
Date "2019-11-02"
Rev "A"
Comp "Uzix"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L sizif512-rescue:YM2149-my U13
U 1 1 5AB2C535
P 11850 9775
F 0 "U13" H 11450 11075 51  0000 C CNN
F 1 "AY-3-8310" H 12175 11075 51  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 11850 11375 39  0001 C CNN
F 3 "" H 11850 11375 39  0001 C CNN
	1    11850 9775
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5AB364EB
P 11850 10875
F 0 "#PWR0106" H 11850 10625 50  0001 C CNN
F 1 "GND" H 11855 10702 39  0001 C CNN
F 2 "" H 11850 10875 50  0001 C CNN
F 3 "" H 11850 10875 50  0001 C CNN
	1    11850 10875
	1    0    0    -1  
$EndComp
NoConn ~ 11250 10275
$Comp
L power:GND #PWR090
U 1 1 5ABCEA74
P 11250 9575
F 0 "#PWR090" H 11250 9325 50  0001 C CNN
F 1 "GND" H 11255 9402 39  0001 C CNN
F 2 "" H 11250 9575 50  0001 C CNN
F 3 "" H 11250 9575 50  0001 C CNN
	1    11250 9575
	0    1    1    0   
$EndComp
$Comp
L Connector:Barrel_Jack_Switch J2
U 1 1 5B555C2D
P 18200 2300
F 0 "J2" H 18200 2625 39  0000 C CNN
F 1 "DS-210" H 18200 2525 39  0001 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 18250 2260 50  0001 C CNN
F 3 "~" H 18250 2260 50  0001 C CNN
F 4 "DC IN (12V)" H 18200 2525 39  0000 C CNN "Desc"
	1    18200 2300
	1    0    0    -1  
$EndComp
$Comp
L Connector:DB9_Male_MountingHoles J7
U 1 1 5B60AE44
P 21800 7025
F 0 "J7" H 21979 7028 50  0000 L CNN
F 1 "DB9-M" H 21979 6937 50  0001 L CNN
F 2 "Connector_Dsub:DSUB-9_Male_Horizontal_P2.77x2.84mm_EdgePinOffset4.94mm_Housed_MountingHolesOffset7.48mm" H 21800 7025 50  0001 C CNN
F 3 "" H 21800 7025 50  0001 C CNN
F 4 "Joystick" H 22125 6925 50  0000 C CNN "Desc"
	1    21800 7025
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR057
U 1 1 5AE08D56
P 21800 7625
F 0 "#PWR057" H 21800 7375 50  0001 C CNN
F 1 "GND" H 21800 7475 39  0000 C CNN
F 2 "" H 21800 7625 50  0001 C CNN
F 3 "" H 21800 7625 50  0001 C CNN
	1    21800 7625
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR055
U 1 1 5B8C405E
P 21500 7125
F 0 "#PWR055" H 21500 6975 50  0001 C CNN
F 1 "+5V" V 21500 7300 39  0000 C CNN
F 2 "" H 21500 7125 50  0001 C CNN
F 3 "" H 21500 7125 50  0001 C CNN
	1    21500 7125
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR053
U 1 1 5BA137C5
P 21500 6925
F 0 "#PWR053" H 21500 6675 50  0001 C CNN
F 1 "GND" V 21505 6752 39  0000 C CNN
F 2 "" H 21500 6925 50  0001 C CNN
F 3 "" H 21500 6925 50  0001 C CNN
	1    21500 6925
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR039
U 1 1 5DE095FC
P 22300 4875
F 0 "#PWR039" H 22300 4625 50  0001 C CNN
F 1 "GND" H 22305 4702 39  0000 C CNN
F 2 "" H 22300 4875 50  0001 C CNN
F 3 "" H 22300 4875 50  0001 C CNN
	1    22300 4875
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 5DEAF43C
P 21425 4275
F 0 "R17" H 21225 4275 39  0000 L CNN
F 1 "10k" V 21425 4225 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 21355 4275 50  0001 C CNN
F 3 "~" H 21425 4275 50  0001 C CNN
	1    21425 4275
	1    0    0    1   
$EndComp
$Comp
L Device:R R18
U 1 1 5DEB077A
P 21575 4275
F 0 "R18" H 21625 4275 39  0000 L CNN
F 1 "10k" V 21575 4225 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 21505 4275 50  0001 C CNN
F 3 "~" H 21575 4275 50  0001 C CNN
	1    21575 4275
	1    0    0    1   
$EndComp
NoConn ~ 21700 4750
NoConn ~ 22200 4750
NoConn ~ 22200 4650
$Comp
L power:GND #PWR076
U 1 1 5D788196
P 21600 12300
F 0 "#PWR076" H 21600 12050 50  0001 C CNN
F 1 "GND" H 21605 12127 39  0001 C CNN
F 2 "" H 21600 12300 50  0001 C CNN
F 3 "" H 21600 12300 50  0001 C CNN
	1    21600 12300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR079
U 1 1 5D788520
P 21600 12400
F 0 "#PWR079" H 21600 12150 50  0001 C CNN
F 1 "GND" H 21605 12227 39  0001 C CNN
F 2 "" H 21600 12400 50  0001 C CNN
F 3 "" H 21600 12400 50  0001 C CNN
	1    21600 12400
	0    1    1    0   
$EndComp
NoConn ~ 21600 13200
NoConn ~ 21600 13300
NoConn ~ 21600 13400
NoConn ~ 21600 13500
NoConn ~ 22100 14500
$Comp
L power:+12V #PWR094
U 1 1 5D95DBB7
P 22100 13900
F 0 "#PWR094" H 22100 13750 50  0001 C CNN
F 1 "+12V" V 22100 14025 39  0000 L CNN
F 2 "" H 22100 13900 50  0001 C CNN
F 3 "" H 22100 13900 50  0001 C CNN
	1    22100 13900
	0    1    1    0   
$EndComp
$Comp
L power:-5V #PWR093
U 1 1 5D95E897
P 22100 13700
F 0 "#PWR093" H 22100 13800 50  0001 C CNN
F 1 "-5V" V 22100 13825 39  0000 L CNN
F 2 "" H 22100 13700 50  0001 C CNN
F 3 "" H 22100 13700 50  0001 C CNN
	1    22100 13700
	0    1    1    0   
$EndComp
NoConn ~ 22100 12100
Text Notes 10875 8150 0    79   ~ 0
SOUND
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J5
U 1 1 5DDDF159
P 21900 4650
F 0 "J5" H 21950 5067 50  0000 C CNN
F 1 "Conn_02x05" H 21950 4976 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 21900 4650 50  0001 C CNN
F 3 "~" H 21900 4650 50  0001 C CNN
F 4 "JTAG" H 21950 4975 50  0000 C CNN "Desc"
	1    21900 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR063
U 1 1 5D2BBF23
P 21525 9600
F 0 "#PWR063" H 21525 9450 50  0001 C CNN
F 1 "+5V" V 21525 9800 39  0000 C CNN
F 2 "" H 21525 9600 50  0001 C CNN
F 3 "" H 21525 9600 50  0001 C CNN
	1    21525 9600
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR064
U 1 1 5DBBA9C9
P 21825 9800
F 0 "#PWR064" H 21825 9550 50  0001 C CNN
F 1 "GND" H 21825 9650 39  0000 C CNN
F 2 "" H 21825 9800 50  0001 C CNN
F 3 "" H 21825 9800 50  0001 C CNN
	1    21825 9800
	1    0    0    -1  
$EndComp
NoConn ~ 12450 8975
NoConn ~ 12450 10625
NoConn ~ 12450 10525
NoConn ~ 12450 10425
NoConn ~ 12450 10325
NoConn ~ 12450 10225
NoConn ~ 12450 10125
NoConn ~ 12450 10025
NoConn ~ 12450 9925
$Comp
L power:GND #PWR052
U 1 1 65096088
P 20325 6675
F 0 "#PWR052" H 20325 6425 50  0001 C CNN
F 1 "GND" H 20330 6502 39  0001 C CNN
F 2 "" H 20325 6675 50  0001 C CNN
F 3 "" H 20325 6675 50  0001 C CNN
	1    20325 6675
	-1   0    0    -1  
$EndComp
Text GLabel 19700 6275 0    39   Output ~ 0
~MAGIC
$Comp
L Switch:SW_SPST SW1
U 1 1 651F58B7
P 18800 1950
F 0 "SW1" H 18800 2085 39  0000 C CNN
F 1 "SW_SPST" H 18800 2094 39  0001 C CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 18800 1950 50  0001 C CNN
F 3 "~" H 18800 1950 50  0001 C CNN
	1    18800 1950
	1    0    0    -1  
$EndComp
$Comp
L my:zx_edge J13
U 1 1 5D2DD686
P 21800 13100
F 0 "J13" H 21850 14617 50  0000 C CNN
F 1 "Conn_02x28_Row_Letter_First" H 21850 14526 50  0001 C CNN
F 2 "my:ZX_EDGE" H 21800 13100 50  0001 C CNN
F 3 "~" H 21800 13100 50  0001 C CNN
F 4 "EDGE_CONNECTOR" H 21850 14526 50  0000 C CNN "Desc"
	1    21800 13100
	1    0    0    -1  
$EndComp
Text GLabel 19525 5275 0    39   Output ~ 0
~RST
$Comp
L Switch:SW_Push SW2
U 1 1 5D11746F
P 20325 5475
F 0 "SW2" H 20150 5575 39  0000 L CNN
F 1 "SW_Push" H 20200 5400 39  0001 L CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 20325 5675 50  0001 C CNN
F 3 "" H 20325 5675 50  0001 C CNN
F 4 "RST" H 20325 5400 50  0000 C CNN "Desc"
	1    20325 5475
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR045
U 1 1 5D11747D
P 20325 5675
F 0 "#PWR045" H 20325 5425 50  0001 C CNN
F 1 "GND" H 20330 5502 39  0001 C CNN
F 2 "" H 20325 5675 50  0001 C CNN
F 3 "" H 20325 5675 50  0001 C CNN
	1    20325 5675
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 5D117475
P 20125 5275
F 0 "R21" V 20200 5225 39  0000 L CNN
F 1 "1k" V 20125 5250 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 20055 5275 50  0001 C CNN
F 3 "~" H 20125 5275 50  0001 C CNN
	1    20125 5275
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R19
U 1 1 5E0D999B
P 21350 5050
F 0 "R19" H 21400 5050 39  0000 L CNN
F 1 "10k" V 21350 5000 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 21280 5050 50  0001 C CNN
F 3 "~" H 21350 5050 50  0001 C CNN
	1    21350 5050
	-1   0    0    1   
$EndComp
$Comp
L Device:C C29
U 1 1 60DBD358
P 20675 2100
F 0 "C29" H 20600 2025 39  0000 C CNN
F 1 "100n" H 20575 2200 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 20713 1950 50  0001 C CNN
F 3 "~" H 20675 2100 50  0001 C CNN
	1    20675 2100
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D6
U 1 1 5B653724
P 20275 2100
F 0 "D6" V 20300 2025 39  0000 R CNN
F 1 "LED" V 20222 1983 50  0001 R CNN
F 2 "LED_THT:LED_D4.0mm" H 20275 2100 50  0001 C CNN
F 3 "~" H 20275 2100 50  0001 C CNN
	1    20275 2100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R13
U 1 1 5B6C9DCD
P 20275 2400
F 0 "R13" V 20200 2350 39  0000 L CNN
F 1 "1k" V 20275 2375 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 20205 2400 50  0001 C CNN
F 3 "~" H 20275 2400 50  0001 C CNN
	1    20275 2400
	1    0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5D45EDD9
P 19600 1950
F 0 "#FLG01" H 19600 2025 50  0001 C CNN
F 1 "PWR_FLAG" H 19600 2124 50  0001 C CNN
F 2 "" H 19600 1950 50  0001 C CNN
F 3 "~" H 19600 1950 50  0001 C CNN
	1    19600 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR070
U 1 1 5E2BDC4F
P 21600 10800
F 0 "#PWR070" H 21600 10550 50  0001 C CNN
F 1 "GND" V 21600 10625 39  0000 C CNN
F 2 "" H 21600 10800 50  0001 C CNN
F 3 "" H 21600 10800 50  0001 C CNN
	1    21600 10800
	0    1    1    0   
$EndComp
$Comp
L my:Mini-DIN-9 J10
U 1 1 5D225132
P 21825 9500
F 0 "J10" H 21825 9981 50  0000 C CNN
F 1 "Mini-DIN-9" H 21825 9890 50  0001 C CNN
F 2 "my:minidin-9" V 21815 9490 50  0001 C CNN
F 3 "http://service.powerdynamics.com/ec/Catalog17/Section%2011.pdf" V 21815 9490 50  0001 C CNN
F 4 "AV" H 21825 9890 50  0000 C CNN "Desc"
	1    21825 9500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J6
U 1 1 5D1962D4
P 21725 5925
F 0 "J6" H 21775 6342 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 21775 6251 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 21725 5925 50  0001 C CNN
F 3 "~" H 21725 5925 50  0001 C CNN
F 4 "Joystick_HDR" H 21775 6251 50  0000 C CNN "Desc"
	1    21725 5925
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR047
U 1 1 5D1A2EA5
P 21525 6025
F 0 "#PWR047" H 21525 5875 50  0001 C CNN
F 1 "+5V" V 21525 6200 39  0000 C CNN
F 2 "" H 21525 6025 50  0001 C CNN
F 3 "" H 21525 6025 50  0001 C CNN
	1    21525 6025
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR048
U 1 1 5D1A2EAB
P 22025 6025
F 0 "#PWR048" H 22025 5775 50  0001 C CNN
F 1 "GND" V 22025 5850 39  0000 C CNN
F 2 "" H 22025 6025 50  0001 C CNN
F 3 "" H 22025 6025 50  0001 C CNN
	1    22025 6025
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R20
U 1 1 5D346D2A
P 19675 5125
F 0 "R20" V 19750 5075 39  0000 L CNN
F 1 "100k" V 19675 5050 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 19605 5125 50  0001 C CNN
F 3 "~" H 19675 5125 50  0001 C CNN
	1    19675 5125
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR041
U 1 1 5D3ADC2D
P 19675 4975
F 0 "#PWR041" H 19675 4825 50  0001 C CNN
F 1 "+5V" H 19690 5140 39  0000 C CNN
F 2 "" H 19675 4975 50  0001 C CNN
F 3 "" H 19675 4975 50  0001 C CNN
	1    19675 4975
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 5D93D097
P 5500 3150
F 0 "R16" H 5375 3150 39  0000 C CNN
F 1 "1k" V 5500 3150 39  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5430 3150 50  0001 C CNN
F 3 "~" H 5500 3150 50  0001 C CNN
	1    5500 3150
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5A83ADBE
P 5500 1625
F 0 "R7" H 5400 1625 39  0000 C CNN
F 1 "1k" V 5500 1625 39  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5430 1625 50  0001 C CNN
F 3 "~" H 5500 1625 50  0001 C CNN
	1    5500 1625
	-1   0    0    -1  
$EndComp
Text Notes 4700 800  0    79   ~ 0
CLOCK GENERATOR
$Comp
L 74xx:74HC04 U1
U 5 1 5D9B7FD5
P 7350 1900
F 0 "U1" H 7350 2193 39  0000 C CNN
F 1 "74HCU04" H 7350 2118 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7350 1900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 7350 1900 50  0001 C CNN
	5    7350 1900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U1
U 4 1 5D9B4031
P 7350 1400
F 0 "U1" H 7350 1693 39  0000 C CNN
F 1 "74HCU04" H 7350 1618 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7350 1400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 7350 1400 50  0001 C CNN
	4    7350 1400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U1
U 3 1 5D9B1231
P 5200 2925
F 0 "U1" H 5200 3218 39  0000 C CNN
F 1 "74HCU04" H 5200 3143 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5200 2925 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5200 2925 50  0001 C CNN
	3    5200 2925
	1    0    0    -1  
$EndComp
$Comp
L Device:C C37
U 1 1 5D93D0BB
P 5500 3550
F 0 "C37" H 5400 3475 39  0000 C CNN
F 1 "6p" H 5375 3650 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5538 3400 50  0001 C CNN
F 3 "~" H 5500 3550 50  0001 C CNN
	1    5500 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:R R15
U 1 1 5D93D0A7
P 5200 2500
F 0 "R15" V 5275 2500 39  0000 C CNN
F 1 "1M" V 5200 2500 39  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5130 2500 50  0001 C CNN
F 3 "~" H 5200 2500 50  0001 C CNN
	1    5200 2500
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR030
U 1 1 5D93D08B
P 4900 3700
F 0 "#PWR030" H 4900 3450 50  0001 C CNN
F 1 "GND" H 4905 3527 39  0001 C CNN
F 2 "" H 4900 3700 50  0001 C CNN
F 3 "" H 4900 3700 50  0001 C CNN
	1    4900 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C36
U 1 1 5D93D085
P 4900 3550
F 0 "C36" H 4800 3475 39  0000 C CNN
F 1 "6p" H 4800 3650 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4938 3400 50  0001 C CNN
F 3 "~" H 4900 3550 50  0001 C CNN
	1    4900 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:C C28
U 1 1 5A83A7CC
P 5500 2025
F 0 "C28" H 5400 1950 39  0000 C CNN
F 1 "47p" H 5375 2125 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5538 1875 50  0001 C CNN
F 3 "~" H 5500 2025 50  0001 C CNN
	1    5500 2025
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC04 U1
U 2 1 5D4EEEE8
P 5800 2925
F 0 "U1" H 5800 3218 39  0000 C CNN
F 1 "74HCU04" H 5800 3143 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5800 2925 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5800 2925 50  0001 C CNN
	2    5800 2925
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5D340A72
P 5200 975
F 0 "R1" V 5275 975 39  0000 C CNN
F 1 "1M" V 5200 975 39  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5130 975 50  0001 C CNN
F 3 "~" H 5200 975 50  0001 C CNN
	1    5200 975 
	0    1    -1   0   
$EndComp
$Comp
L Device:Crystal Y2
U 1 1 5E767BDB
P 5200 3350
F 0 "Y2" H 5200 3575 39  0000 C CNN
F 1 "32MHz" H 5200 3500 39  0000 C CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 5200 3350 50  0001 C CNN
F 3 "~" H 5200 3350 50  0001 C CNN
	1    5200 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 61657146
P 4900 2175
F 0 "#PWR020" H 4900 1925 50  0001 C CNN
F 1 "GND" H 4905 2002 39  0001 C CNN
F 2 "" H 4900 2175 50  0001 C CNN
F 3 "" H 4900 2175 50  0001 C CNN
	1    4900 2175
	1    0    0    -1  
$EndComp
$Comp
L Device:C C27
U 1 1 616560FA
P 4900 2025
F 0 "C27" H 4800 1950 39  0000 C CNN
F 1 "33p" H 4800 2125 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4938 1875 50  0001 C CNN
F 3 "~" H 4900 2025 50  0001 C CNN
	1    4900 2025
	-1   0    0    1   
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5A83A544
P 5200 1825
F 0 "Y1" H 5200 2050 39  0000 C CNN
F 1 "14.318MHz" H 5200 1975 39  0000 C CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 5200 1825 50  0001 C CNN
F 3 "~" H 5200 1825 50  0001 C CNN
	1    5200 1825
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5E3596E9
P 19300 2550
F 0 "#PWR025" H 19300 2300 50  0001 C CNN
F 1 "GND" H 19305 2377 39  0001 C CNN
F 2 "" H 19300 2550 50  0001 C CNN
F 3 "" H 19300 2550 50  0001 C CNN
	1    19300 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR042
U 1 1 5E0D9B29
P 21350 5200
F 0 "#PWR042" H 21350 4950 50  0001 C CNN
F 1 "GND" H 21350 5050 39  0000 C CNN
F 2 "" H 21350 5200 50  0001 C CNN
F 3 "" H 21350 5200 50  0001 C CNN
	1    21350 5200
	1    0    0    -1  
$EndComp
Entry Wire Line
	10825 10075 10925 10175
Entry Wire Line
	10825 9975 10925 10075
Entry Wire Line
	10825 9725 10925 9825
Entry Wire Line
	10825 9625 10925 9725
Text Label 10925 9725 0    39   ~ 0
AY_BDIR
Text Label 10925 9825 0    39   ~ 0
AY_BC1
Text Label 10925 10075 0    39   ~ 0
~RSTCPU
Text Label 10925 10175 0    39   ~ 0
AY_CLK
Text Label 11025 8625 0    39   ~ 0
D0
Text Label 11025 8725 0    39   ~ 0
D1
Text Label 11025 8825 0    39   ~ 0
D2
Text Label 11025 8925 0    39   ~ 0
D3
Text Label 11025 9025 0    39   ~ 0
D4
Text Label 11025 9125 0    39   ~ 0
D5
Text Label 11025 9225 0    39   ~ 0
D6
Text Label 11025 9325 0    39   ~ 0
D7
Entry Wire Line
	14100 8400 14200 8500
Entry Wire Line
	6600 1400 6700 1500
Entry Wire Line
	6600 2925 6700 3025
Text Label 6600 2925 2    39   ~ 0
CLK32
Text Label 6600 1400 2    39   ~ 0
CLK14
Entry Wire Line
	6700 1300 6800 1400
Text Label 6800 1400 0    39   ~ 0
CLKCPU
NoConn ~ 7050 1900
Text Label 7875 1400 2    39   ~ 0
~CLKCPU
Entry Wire Line
	7875 1400 7975 1500
$Comp
L 74xx:74HC04 U1
U 1 1 5CF6F413
P 5800 1400
F 0 "U1" H 5800 1693 39  0000 C CNN
F 1 "74HCU04" H 5800 1618 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5800 1400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5800 1400 50  0001 C CNN
	1    5800 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR031
U 1 1 63A709C8
P 7325 3725
F 0 "#PWR031" H 7325 3475 50  0001 C CNN
F 1 "GND" H 7330 3552 39  0001 C CNN
F 2 "" H 7325 3725 50  0001 C CNN
F 3 "" H 7325 3725 50  0001 C CNN
	1    7325 3725
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U1
U 7 1 63A6C2BB
P 7325 3225
F 0 "U1" H 7075 3575 39  0000 L CNN
F 1 "74HCU04" H 7400 3575 39  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7325 3225 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 7325 3225 50  0001 C CNN
	7    7325 3225
	1    0    0    -1  
$EndComp
NoConn ~ 7650 1900
$Comp
L 74xx:74HC04 U1
U 6 1 5CFBEB43
P 5200 1400
F 0 "U1" H 5200 1693 39  0000 C CNN
F 1 "74HCU04" H 5200 1618 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5200 1400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5200 1400 50  0001 C CNN
	6    5200 1400
	1    0    0    -1  
$EndComp
Text Label 3200 3725 2    39   ~ 0
~BUSACK
Text Label 3200 3325 2    39   ~ 0
~IORQ
Text Label 3200 3225 2    39   ~ 0
~MREQ
Text Label 3200 3125 2    39   ~ 0
~WR
Text Label 3200 3025 2    39   ~ 0
~RD
Text Label 3200 2625 2    39   ~ 0
~HALT
Text Label 3200 2425 2    39   ~ 0
~RFSH
Text Label 3200 2325 2    39   ~ 0
~M1
Text Label 3200 2525 2    39   ~ 0
~WAIT
Text Label 3200 3625 2    39   ~ 0
~BUSRQ
Text Label 3200 2025 2    39   ~ 0
~INT
Text Label 3200 1925 2    39   ~ 0
~NMI
Text Label 3200 1325 2    39   ~ 0
~RSTCPU
Text Label 3200 1625 2    39   ~ 0
CLKCPU
Entry Wire Line
	3200 1325 3300 1425
Entry Wire Line
	3200 2025 3300 2125
Entry Wire Line
	3200 1925 3300 2025
Entry Wire Line
	3200 1625 3300 1725
Entry Wire Line
	3300 2425 3200 2325
Entry Wire Line
	3300 2525 3200 2425
Entry Wire Line
	3300 2625 3200 2525
Entry Wire Line
	3300 2725 3200 2625
Entry Wire Line
	3300 3125 3200 3025
Entry Wire Line
	3300 3225 3200 3125
Entry Wire Line
	3300 3325 3200 3225
Entry Wire Line
	3300 3425 3200 3325
Entry Wire Line
	3300 3725 3200 3625
Entry Wire Line
	3300 3825 3200 3725
Entry Wire Line
	3400 2900 3300 2800
Entry Wire Line
	3400 2700 3300 2600
Entry Wire Line
	3400 2800 3300 2700
Entry Wire Line
	3400 3200 3300 3100
Entry Wire Line
	3400 3100 3300 3000
Text Label 3400 3100 0    39   ~ 0
~WAIT
Text Label 3400 3200 0    39   ~ 0
~BUSRQ
Text Label 3400 2800 0    39   ~ 0
~NMI
Text Label 3400 2900 0    39   ~ 0
CLKCPU
Entry Wire Line
	3400 1375 3300 1275
Entry Wire Line
	3400 1475 3300 1375
Entry Wire Line
	3400 1575 3300 1475
Entry Wire Line
	3400 1675 3300 1575
Entry Wire Line
	3400 1775 3300 1675
Entry Wire Line
	3400 1875 3300 1775
Entry Wire Line
	3400 1975 3300 1875
Entry Wire Line
	3400 2075 3300 1975
Text Label 3400 2075 0    39   ~ 0
D7
Text Label 3400 1975 0    39   ~ 0
D6
Text Label 3400 1875 0    39   ~ 0
D5
Text Label 3400 1775 0    39   ~ 0
D4
Text Label 3400 1675 0    39   ~ 0
D3
Text Label 3400 1575 0    39   ~ 0
D2
Text Label 3400 1475 0    39   ~ 0
D1
Text Label 3400 1375 0    39   ~ 0
D0
Text Label 850  2825 0    39   ~ 0
A15
Text Label 850  2725 0    39   ~ 0
A14
Text Label 850  2625 0    39   ~ 0
A13
Text Label 850  2525 0    39   ~ 0
A12
Text Label 850  2425 0    39   ~ 0
A11
Text Label 850  2325 0    39   ~ 0
A10
Text Label 850  2225 0    39   ~ 0
A9
Text Label 850  2125 0    39   ~ 0
A8
Text Label 850  2025 0    39   ~ 0
A7
Text Label 850  1925 0    39   ~ 0
A6
Text Label 850  1825 0    39   ~ 0
A5
Text Label 850  1725 0    39   ~ 0
A4
Text Label 850  1625 0    39   ~ 0
A3
Text Label 850  1525 0    39   ~ 0
A2
Text Label 850  1425 0    39   ~ 0
A1
Text Label 850  1325 0    39   ~ 0
A0
Entry Wire Line
	850  3025 750  2925
Entry Wire Line
	850  3125 750  3025
Entry Wire Line
	850  3225 750  3125
Entry Wire Line
	850  3325 750  3225
Entry Wire Line
	850  3425 750  3325
Entry Wire Line
	850  3525 750  3425
Entry Wire Line
	850  3625 750  3525
Entry Wire Line
	850  3725 750  3625
Text Label 850  3725 0    39   ~ 0
D7
Text Label 850  3625 0    39   ~ 0
D6
Text Label 850  3525 0    39   ~ 0
D5
Text Label 850  3425 0    39   ~ 0
D4
Text Label 850  3325 0    39   ~ 0
D3
Text Label 850  3225 0    39   ~ 0
D2
Text Label 850  3125 0    39   ~ 0
D1
Text Label 850  3025 0    39   ~ 0
D0
Entry Wire Line
	750  2725 850  2825
Entry Wire Line
	750  2625 850  2725
Entry Wire Line
	750  2525 850  2625
Entry Wire Line
	750  2425 850  2525
Entry Wire Line
	750  2325 850  2425
Entry Wire Line
	750  2225 850  2325
Entry Wire Line
	750  2125 850  2225
Entry Wire Line
	750  2025 850  2125
Entry Wire Line
	750  1925 850  2025
Entry Wire Line
	750  1825 850  1925
Entry Wire Line
	750  1725 850  1825
Entry Wire Line
	750  1625 850  1725
Entry Wire Line
	750  1525 850  1625
Entry Wire Line
	750  1425 850  1525
Entry Wire Line
	750  1325 850  1425
Entry Wire Line
	750  1225 850  1325
Text Notes 775  800  0    79   ~ 0
CPU
$Comp
L CPU:Z80CPU U7
U 1 1 5A82BF7B
P 2025 2525
F 0 "U7" H 2525 3950 50  0000 C CNN
F 1 "Z84C0010PEC " H 1600 3950 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 2025 2925 50  0001 C CNN
F 3 "www.zilog.com/manage_directlink.php?filepath=docs/z80/um0080" H 2025 2925 50  0001 C CNN
	1    2025 2525
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Network08 RN3
U 1 1 612FF54F
P 3875 2900
F 0 "RN3" V 3350 2825 50  0000 L CNN
F 1 "10k" V 4300 2850 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4350 2900 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3875 2900 50  0001 C CNN
	1    3875 2900
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR023
U 1 1 611DB6CF
P 4075 2500
F 0 "#PWR023" H 4075 2350 50  0001 C CNN
F 1 "+5V" V 4075 2675 39  0000 C CNN
F 2 "" H 4075 2500 50  0001 C CNN
F 3 "" H 4075 2500 50  0001 C CNN
	1    4075 2500
	0    1    1    0   
$EndComp
$Comp
L Device:R_Network08 RN1
U 1 1 5D0DFEF8
P 3875 1775
F 0 "RN1" V 3350 1700 50  0000 L CNN
F 1 "10k" V 4300 1725 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4350 1775 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3875 1775 50  0001 C CNN
	1    3875 1775
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 5CFB165A
P 4075 1375
F 0 "#PWR013" H 4075 1225 50  0001 C CNN
F 1 "+5V" V 4075 1550 39  0000 C CNN
F 2 "" H 4075 1375 50  0001 C CNN
F 3 "" H 4075 1375 50  0001 C CNN
	1    4075 1375
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5A823585
P 2025 1025
F 0 "#PWR07" H 2025 875 50  0001 C CNN
F 1 "+5V" H 2025 1175 39  0000 C CNN
F 2 "" H 2025 1025 50  0001 C CNN
F 3 "" H 2025 1025 50  0001 C CNN
	1    2025 1025
	-1   0    0    -1  
$EndComp
Entry Bus Bus
	10825 8425 10925 8525
Entry Wire Line
	11025 9325 10925 9225
Entry Wire Line
	11025 9225 10925 9125
Entry Wire Line
	11025 9125 10925 9025
Entry Wire Line
	11025 9025 10925 8925
Entry Wire Line
	11025 8925 10925 8825
Entry Wire Line
	11025 8825 10925 8725
Entry Wire Line
	11025 8725 10925 8625
Entry Wire Line
	11025 8625 10925 8525
Text Notes 18675 1700 0    79   ~ 0
POWER
$Comp
L power:+5V #PWR06
U 1 1 5E4A4047
P 20050 925
F 0 "#PWR06" H 20050 775 50  0001 C CNN
F 1 "+5V" H 20050 1075 39  0000 C CNN
F 2 "" H 20050 925 50  0001 C CNN
F 3 "" H 20050 925 50  0001 C CNN
	1    20050 925 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 618DD943
P 20275 1075
F 0 "C15" H 20175 1000 39  0000 C CNN
F 1 "100n" H 20175 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 20313 925 50  0001 C CNN
F 3 "~" H 20275 1075 50  0001 C CNN
	1    20275 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C19
U 1 1 60F0AF21
P 21175 1075
F 0 "C19" H 21075 1000 39  0000 C CNN
F 1 "100n" H 21075 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 21213 925 50  0001 C CNN
F 3 "~" H 21175 1075 50  0001 C CNN
	1    21175 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C21
U 1 1 5E7112B3
P 21625 1075
F 0 "C21" H 21525 1000 39  0000 C CNN
F 1 "100n" H 21525 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 21663 925 50  0001 C CNN
F 3 "~" H 21625 1075 50  0001 C CNN
	1    21625 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C23
U 1 1 61ADDFF0
P 22075 1075
F 0 "C23" H 22150 1150 39  0000 C CNN
F 1 "100n" H 22175 1000 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 22113 925 50  0001 C CNN
F 3 "~" H 22075 1075 50  0001 C CNN
	1    22075 1075
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 5E61AF1E
P 20950 1075
F 0 "C18" H 20850 1000 39  0000 C CNN
F 1 "100n" H 20850 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 20988 925 50  0001 C CNN
F 3 "~" H 20950 1075 50  0001 C CNN
	1    20950 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C17
U 1 1 5E61AF0C
P 20725 1075
F 0 "C17" H 20625 1000 39  0000 C CNN
F 1 "100n" H 20625 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 20763 925 50  0001 C CNN
F 3 "~" H 20725 1075 50  0001 C CNN
	1    20725 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C16
U 1 1 5E4A404D
P 20500 1075
F 0 "C16" H 20400 1000 39  0000 C CNN
F 1 "100n" H 20400 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 20538 925 50  0001 C CNN
F 3 "~" H 20500 1075 50  0001 C CNN
	1    20500 1075
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5E4A4041
P 20050 1225
F 0 "#PWR012" H 20050 975 50  0001 C CNN
F 1 "GND" H 20055 1052 39  0001 C CNN
F 2 "" H 20050 1225 50  0001 C CNN
F 3 "" H 20050 1225 50  0001 C CNN
	1    20050 1225
	1    0    0    -1  
$EndComp
$Comp
L Device:C C22
U 1 1 61609903
P 21850 1075
F 0 "C22" H 21750 1000 39  0000 C CNN
F 1 "100n" H 21750 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 21888 925 50  0001 C CNN
F 3 "~" H 21850 1075 50  0001 C CNN
	1    21850 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C20
U 1 1 6150A2CF
P 21400 1075
F 0 "C20" H 21300 1000 39  0000 C CNN
F 1 "100n" H 21300 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 21438 925 50  0001 C CNN
F 3 "~" H 21400 1075 50  0001 C CNN
	1    21400 1075
	-1   0    0    1   
$EndComp
Entry Wire Line
	21100 9100 21200 9200
Entry Wire Line
	21100 9300 21200 9400
Entry Wire Line
	21100 9400 21200 9500
Entry Wire Line
	21100 9700 21200 9800
Text Label 21200 9200 0    39   ~ 0
SND_L
Text Label 21200 9400 0    39   ~ 0
SND_R
Text Label 21200 9500 0    39   ~ 0
SND_MONO
Text Label 21200 9800 0    39   ~ 0
VID_SYNC
Entry Wire Line
	22400 9400 22500 9500
Entry Wire Line
	22400 9500 22500 9600
Entry Wire Line
	22400 9600 22500 9700
Entry Wire Line
	22400 9800 22500 9900
Text Label 22400 9400 2    39   ~ 0
VID_R
Text Label 22400 9500 2    39   ~ 0
VID_G
Text Label 22400 9600 2    39   ~ 0
VID_B
Text Label 22400 9800 2    39   ~ 0
VID_COMP
Entry Wire Line
	21100 10350 21200 10450
Text Label 21200 10450 0    39   ~ 0
SND_L
Entry Wire Line
	21100 10800 21200 10900
Text Label 21200 10900 0    39   ~ 0
TAPE_IN
Entry Wire Line
	21100 6525 21200 6625
Entry Wire Line
	21100 6625 21200 6725
Entry Wire Line
	21100 6725 21200 6825
Entry Wire Line
	21100 6925 21200 7025
Entry Wire Line
	21100 7125 21200 7225
Entry Wire Line
	21100 7225 21200 7325
Entry Wire Line
	21100 7325 21200 7425
Text Label 21200 6625 0    39   ~ 0
~JOY_B3
Text Label 21200 6725 0    39   ~ 0
~JOY_B2
Text Label 21200 6825 0    39   ~ 0
~JOY_RIGHT
Text Label 21200 7025 0    39   ~ 0
~JOY_LEFT
Text Label 21200 7225 0    39   ~ 0
~JOY_DOWN
Text Label 21200 7325 0    39   ~ 0
~JOY_B1
Text Label 21200 7425 0    39   ~ 0
~JOY_UP
Entry Wire Line
	21100 5625 21200 5725
Text Label 21200 5725 0    39   ~ 0
~JOY_UP
Entry Wire Line
	21100 5725 21200 5825
Text Label 21200 5825 0    39   ~ 0
~JOY_LEFT
Entry Wire Line
	21100 5825 21200 5925
Text Label 21200 5925 0    39   ~ 0
~JOY_B3
Entry Wire Line
	21100 6025 21200 6125
Text Label 21200 6125 0    39   ~ 0
~JOY_B2
Entry Wire Line
	22500 5825 22400 5725
Text Label 22400 5725 2    39   ~ 0
~JOY_DOWN
Entry Wire Line
	22500 5925 22400 5825
Text Label 22400 5825 2    39   ~ 0
~JOY_RIGHT
Entry Wire Line
	22500 6025 22400 5925
Text Label 22400 5925 2    39   ~ 0
~JOY_B1
Entry Wire Line
	21100 4350 21200 4450
Entry Wire Line
	21100 4450 21200 4550
Entry Wire Line
	21100 4550 21200 4650
Entry Wire Line
	21100 4750 21200 4850
Text Label 21200 4450 0    39   ~ 0
TCK
Text Label 21200 4550 0    39   ~ 0
TDO
Text Label 21200 4650 0    39   ~ 0
TMS
Text Label 21200 4850 0    39   ~ 0
TDI
Entry Wire Line
	21100 11700 21200 11800
Entry Wire Line
	21100 11800 21200 11900
Entry Wire Line
	21100 12400 21200 12500
Entry Wire Line
	21100 12500 21200 12600
Entry Wire Line
	21100 12600 21200 12700
Entry Wire Line
	21100 12700 21200 12800
Entry Wire Line
	21100 13500 21200 13600
Entry Wire Line
	21100 13600 21200 13700
Entry Wire Line
	21100 13700 21200 13800
Entry Wire Line
	21100 13800 21200 13900
Entry Wire Line
	21100 13900 21200 14000
Entry Wire Line
	21100 14000 21200 14100
Entry Wire Line
	21100 14100 21200 14200
Entry Wire Line
	21100 14200 21200 14300
Entry Wire Line
	21100 14300 21200 14400
Entry Wire Line
	21100 14400 21200 14500
Entry Wire Line
	21100 12800 21200 12900
Entry Wire Line
	21100 12900 21200 13000
Entry Wire Line
	22400 11800 22500 11900
Entry Wire Line
	22400 11900 22500 12000
Entry Wire Line
	22400 12000 22500 12100
Entry Wire Line
	22400 12300 22500 12400
Entry Wire Line
	22400 12400 22500 12500
Entry Wire Line
	22400 12500 22500 12600
Entry Wire Line
	22400 12600 22500 12700
Entry Wire Line
	22400 12700 22500 12800
Entry Wire Line
	22400 12800 22500 12900
Entry Wire Line
	22400 12900 22500 13000
Entry Wire Line
	22400 13000 22500 13100
Entry Wire Line
	22400 13100 22500 13200
Entry Wire Line
	22400 13200 22500 13300
Entry Wire Line
	22400 13300 22500 13400
Entry Wire Line
	22400 13400 22500 13500
Entry Wire Line
	22400 14100 22500 14200
Entry Wire Line
	22400 14200 22500 14300
Entry Wire Line
	22400 14300 22500 14400
Entry Wire Line
	22400 14400 22500 14500
Entry Wire Line
	22400 13500 22500 13600
Entry Wire Line
	22400 13600 22500 13700
Text Label 21200 11800 0    39   ~ 0
A14
Text Label 21200 11900 0    39   ~ 0
A12
Text Label 21200 12600 0    39   ~ 0
A0
Text Label 21200 12700 0    39   ~ 0
A1
Text Label 21200 12800 0    39   ~ 0
A2
Text Label 21200 12900 0    39   ~ 0
A3
Text Label 21200 13000 0    39   ~ 0
~IORQGE
Text Label 21200 13600 0    39   ~ 0
~BUSRQ
Text Label 21200 13700 0    39   ~ 0
~RSTCPU
Text Label 21200 13800 0    39   ~ 0
A7
Text Label 21200 13900 0    39   ~ 0
A6
Text Label 21200 14000 0    39   ~ 0
A5
Text Label 21200 14100 0    39   ~ 0
A4
Text Label 21200 14200 0    39   ~ 0
~ROMCS
Text Label 21200 14300 0    39   ~ 0
~BUSACK
Text Label 21200 14400 0    39   ~ 0
A9
Text Label 21200 14500 0    39   ~ 0
A11
Text Label 22400 14400 2    39   ~ 0
A10
Text Label 22400 14300 2    39   ~ 0
A8
Text Label 22400 14200 2    39   ~ 0
~RFSH
Text Label 22400 14100 2    39   ~ 0
~M1
Text Label 22400 13600 2    39   ~ 0
~WR
Text Label 22400 13500 2    39   ~ 0
~RD
Text Label 22400 13400 2    39   ~ 0
~IORQ
Text Label 22400 13300 2    39   ~ 0
~MREQ
Text Label 22400 13200 2    39   ~ 0
~HALT
Text Label 22400 13100 2    39   ~ 0
~NMI
Text Label 22400 13000 2    39   ~ 0
~INT
Text Label 22400 12900 2    39   ~ 0
D4
Text Label 22400 12800 2    39   ~ 0
D3
Text Label 22400 12700 2    39   ~ 0
D5
Text Label 22400 12600 2    39   ~ 0
D6
Text Label 22400 12500 2    39   ~ 0
D2
Text Label 22400 12400 2    39   ~ 0
D1
Text Label 22400 12300 2    39   ~ 0
D0
Text Label 22400 12000 2    39   ~ 0
D7
Text Label 22400 11900 2    39   ~ 0
A13
Text Label 22400 11800 2    39   ~ 0
A15
Entry Wire Line
	22400 13800 22500 13900
Text Label 22400 13800 2    39   ~ 0
~WAIT
$Comp
L Device:C C34
U 1 1 8F936D62
P 20675 3125
F 0 "C34" H 20600 3050 39  0000 C CNN
F 1 "100n" H 20575 3225 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 20713 2975 50  0001 C CNN
F 3 "~" H 20675 3125 50  0001 C CNN
	1    20675 3125
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR028
U 1 1 90B2B0A0
P 22025 2875
F 0 "#PWR028" H 22025 2725 50  0001 C CNN
F 1 "+3.3V" H 22040 3040 39  0000 C CNN
F 2 "" H 22025 2875 50  0001 C CNN
F 3 "" H 22025 2875 50  0001 C CNN
	1    22025 2875
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR056
U 1 1 5A831FC4
P 5775 7625
F 0 "#PWR056" H 5775 7475 50  0001 C CNN
F 1 "+5V" H 5775 7775 39  0000 C CNN
F 2 "" H 5775 7625 50  0001 C CNN
F 3 "" H 5775 7625 50  0001 C CNN
	1    5775 7625
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR065
U 1 1 5A835143
P 5775 9825
F 0 "#PWR065" H 5775 9575 50  0001 C CNN
F 1 "GND" H 5780 9652 39  0001 C CNN
F 2 "" H 5775 9825 50  0001 C CNN
F 3 "" H 5775 9825 50  0001 C CNN
	1    5775 9825
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR059
U 1 1 604A57E2
P 6375 8825
F 0 "#PWR059" H 6375 8675 50  0001 C CNN
F 1 "+5V" H 6375 8975 39  0001 C CNN
F 2 "" H 6375 8825 50  0001 C CNN
F 3 "" H 6375 8825 50  0001 C CNN
	1    6375 8825
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR050
U 1 1 65F871EC
P 5425 6525
F 0 "#PWR050" H 5425 6275 50  0001 C CNN
F 1 "GND" H 5430 6352 39  0001 C CNN
F 2 "" H 5425 6525 50  0001 C CNN
F 3 "" H 5425 6525 50  0001 C CNN
	1    5425 6525
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR049
U 1 1 65FFD58E
P 5075 6525
F 0 "#PWR049" H 5075 6275 50  0001 C CNN
F 1 "GND" H 5080 6352 39  0001 C CNN
F 2 "" H 5075 6525 50  0001 C CNN
F 3 "" H 5075 6525 50  0001 C CNN
	1    5075 6525
	-1   0    0    -1  
$EndComp
Text Notes 5650 6725 1    39   Italic 0
connect to VCC for DIP28
Text Label 6650 7825 2    39   ~ 0
VD0
Text Label 6650 8525 2    39   ~ 0
VD1
Text Label 6650 7925 2    39   ~ 0
VD2
Text Label 6650 8425 2    39   ~ 0
VD3
Text Label 6650 8025 2    39   ~ 0
VD4
Text Label 6650 8325 2    39   ~ 0
VD5
Text Label 6650 8125 2    39   ~ 0
VD6
Text Label 6650 8225 2    39   ~ 0
VD7
Entry Wire Line
	6650 8525 6750 8625
Entry Wire Line
	6650 8425 6750 8525
Entry Wire Line
	6650 8325 6750 8425
Entry Wire Line
	6650 8225 6750 8325
Entry Wire Line
	6650 8125 6750 8225
Entry Wire Line
	6650 8025 6750 8125
Entry Wire Line
	6650 7925 6750 8025
Entry Wire Line
	6650 7825 6750 7925
Text Label 8150 5075 2    39   ~ 0
D0
Text Label 8150 5175 2    39   ~ 0
D1
Text Label 8150 5275 2    39   ~ 0
D2
Text Label 8150 5375 2    39   ~ 0
D3
Text Label 8150 5475 2    39   ~ 0
D4
Text Label 8150 5575 2    39   ~ 0
D5
Text Label 8150 5675 2    39   ~ 0
D6
Text Label 8150 5775 2    39   ~ 0
D7
Entry Wire Line
	8150 5775 8250 5875
Entry Wire Line
	8150 5675 8250 5775
Entry Wire Line
	8150 5575 8250 5675
Entry Wire Line
	8150 5475 8250 5575
Entry Wire Line
	8150 5375 8250 5475
Entry Wire Line
	8150 5275 8250 5375
Entry Wire Line
	8150 5175 8250 5275
Entry Wire Line
	8150 5075 8250 5175
Entry Wire Line
	7350 9125 7250 9025
Entry Wire Line
	7350 9225 7250 9125
Entry Wire Line
	7350 9325 7250 9225
Entry Wire Line
	7350 9425 7250 9325
Entry Wire Line
	7350 9525 7250 9425
Entry Wire Line
	7350 9625 7250 9525
Entry Wire Line
	7350 9725 7250 9625
Text Label 7350 9725 0    39   ~ 0
D6
Text Label 7350 9625 0    39   ~ 0
D5
Text Label 7350 9525 0    39   ~ 0
D4
Text Label 7350 9425 0    39   ~ 0
D3
Text Label 7350 9325 0    39   ~ 0
D2
Text Label 7350 9225 0    39   ~ 0
D1
Text Label 7350 9125 0    39   ~ 0
D0
Text Label 8150 9125 2    39   ~ 0
VD0
Text Label 8150 9225 2    39   ~ 0
VD1
Text Label 8150 9325 2    39   ~ 0
VD2
Text Label 8150 9425 2    39   ~ 0
VD3
Text Label 8150 9525 2    39   ~ 0
VD4
Text Label 8150 9625 2    39   ~ 0
VD5
Text Label 8150 9725 2    39   ~ 0
VD6
Entry Wire Line
	8150 9725 8250 9825
Entry Wire Line
	8150 9625 8250 9725
Entry Wire Line
	8150 9525 8250 9625
Entry Wire Line
	8150 9425 8250 9525
Entry Wire Line
	8150 9325 8250 9425
Entry Wire Line
	8150 9225 8250 9325
Entry Wire Line
	8150 9125 8250 9225
Entry Wire Line
	6650 8925 6750 9025
Entry Wire Line
	6650 9025 6750 9125
Text Label 6650 8925 2    39   ~ 0
~VRD
Text Label 6650 9025 2    39   ~ 0
~VWR
Entry Wire Line
	8150 6325 8250 6425
Text Label 8150 6325 2    39   ~ 0
~WR
Entry Wire Line
	8150 5975 8250 6075
Entry Wire Line
	8150 6075 8250 6175
Text Label 8150 6075 2    39   ~ 0
~ROMCS
Entry Wire Line
	8150 6175 8250 6275
Text Label 8150 6175 2    39   ~ 0
~RD
Text Label 8150 5975 2    39   ~ 0
~ROMCS0
Text Notes 4900 4625 0    79   ~ 0
MEMORY
Entry Wire Line
	5750 6575 5850 6675
Text Label 5850 6675 0    39   ~ 0
RA16
Entry Wire Line
	5750 4975 5850 5075
Entry Wire Line
	5750 5075 5850 5175
Entry Wire Line
	5750 5175 5850 5275
Entry Wire Line
	5750 5275 5850 5375
Entry Wire Line
	5750 5375 5850 5475
Entry Wire Line
	5750 5475 5850 5575
Entry Wire Line
	5750 5575 5850 5675
Entry Wire Line
	5750 5675 5850 5775
Entry Wire Line
	5750 5775 5850 5875
Entry Wire Line
	5750 5875 5850 5975
Entry Wire Line
	5750 5975 5850 6075
Entry Wire Line
	5750 6075 5850 6175
Entry Wire Line
	5750 6175 5850 6275
Entry Wire Line
	5750 6275 5850 6375
Entry Wire Line
	5750 6375 5850 6475
Entry Wire Line
	5750 6475 5850 6575
Text Label 5850 5075 0    39   ~ 0
A0
Text Label 5850 5175 0    39   ~ 0
A1
Text Label 5850 5275 0    39   ~ 0
A2
Text Label 5850 5375 0    39   ~ 0
A3
Text Label 5850 5475 0    39   ~ 0
A4
Text Label 5850 5575 0    39   ~ 0
A5
Text Label 5850 5675 0    39   ~ 0
A6
Text Label 5850 5775 0    39   ~ 0
A7
Text Label 5850 5875 0    39   ~ 0
A8
Text Label 5850 5975 0    39   ~ 0
A9
Text Label 5850 6075 0    39   ~ 0
A10
Text Label 5850 6175 0    39   ~ 0
A11
Text Label 5850 6275 0    39   ~ 0
A12
Text Label 5850 6375 0    39   ~ 0
A13
Text Label 5850 6475 0    39   ~ 0
RA14
$Comp
L Device:Jumper JP3
U 1 1 659F823A
P 7650 6325
F 0 "JP3" H 7650 6250 39  0000 C CNN
F 1 "Jumper" H 7650 6498 39  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7650 6325 50  0001 C CNN
F 3 "~" H 7650 6325 50  0001 C CNN
	1    7650 6325
	1    0    0    -1  
$EndComp
$Comp
L my:29C040 U9
U 1 1 5EE8E509
P 6650 5975
F 0 "U9" H 6275 7050 51  0000 C CNN
F 1 "SST39SF040" H 6950 7050 51  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_Socket" H 6650 6275 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/25022B.pdf" H 6650 6275 50  0001 C CNN
F 4 ">=64K EPROM/FLASH in DIP28 or DIP32" H 6650 4700 39  0000 C CNN "Desc"
	1    6650 5975
	1    0    0    -1  
$EndComp
$Comp
L Device:R R23
U 1 1 5E7B9EA3
P 7650 5975
F 0 "R23" V 7725 5925 39  0000 L CNN
F 1 "470" V 7650 5925 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7580 5975 50  0001 C CNN
F 3 "~" H 7650 5975 50  0001 C CNN
	1    7650 5975
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR038
U 1 1 5A827B63
P 6650 4875
F 0 "#PWR038" H 6650 4725 50  0001 C CNN
F 1 "+5V" H 6650 5025 39  0000 C CNN
F 2 "" H 6650 4875 50  0001 C CNN
F 3 "" H 6650 4875 50  0001 C CNN
	1    6650 4875
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR054
U 1 1 5A827A72
P 6650 7075
F 0 "#PWR054" H 6650 6825 50  0001 C CNN
F 1 "GND" H 6655 6902 39  0001 C CNN
F 2 "" H 6650 7075 50  0001 C CNN
F 3 "" H 6650 7075 50  0001 C CNN
	1    6650 7075
	1    0    0    -1  
$EndComp
Entry Wire Line
	4875 9325 4975 9425
Text Label 4975 9425 0    39   ~ 0
VA16
Entry Wire Line
	4875 7725 4975 7825
Entry Wire Line
	4875 7825 4975 7925
Entry Wire Line
	4875 7925 4975 8025
Entry Wire Line
	4875 8025 4975 8125
Entry Wire Line
	4875 8125 4975 8225
Entry Wire Line
	4875 8225 4975 8325
Entry Wire Line
	4875 8325 4975 8425
Entry Wire Line
	4875 8425 4975 8525
Entry Wire Line
	4875 8525 4975 8625
Entry Wire Line
	4875 8625 4975 8725
Entry Wire Line
	4875 8725 4975 8825
Entry Wire Line
	4875 8825 4975 8925
Entry Wire Line
	4875 8925 4975 9025
Entry Wire Line
	4875 9025 4975 9125
Entry Wire Line
	4875 9125 4975 9225
Entry Wire Line
	4875 9225 4975 9325
Text Label 4975 8225 0    39   ~ 0
VA10
Text Label 4975 8825 0    39   ~ 0
VA2
Text Label 4975 8925 0    39   ~ 0
VA3
Text Label 4975 8725 0    39   ~ 0
VA4
Text Label 4975 8625 0    39   ~ 0
VA5
Text Label 4975 9125 0    39   ~ 0
VA6
Text Label 4975 8125 0    39   ~ 0
VA9
Text Label 4975 8325 0    39   ~ 0
VA11
Text Label 4975 7925 0    39   ~ 0
VA15
Text Label 4975 7825 0    39   ~ 0
VA14
Text Label 4975 8525 0    39   ~ 0
VA13
Text Label 4975 8025 0    39   ~ 0
VA8
Text Label 4975 9325 0    39   ~ 0
VA7
Text Label 4975 8425 0    39   ~ 0
VA12
Entry Wire Line
	4875 9425 4975 9525
Text Label 4975 9625 0    39   ~ 0
VA17
Entry Wire Line
	4875 9525 4975 9625
Text Label 4975 9525 0    39   ~ 0
VA18
$Comp
L power:GND #PWR074
U 1 1 91723150
P 1850 12150
F 0 "#PWR074" H 1850 11900 50  0001 C CNN
F 1 "GND" H 1855 11977 39  0001 C CNN
F 2 "" H 1850 12150 50  0001 C CNN
F 3 "" H 1850 12150 50  0001 C CNN
	1    1850 12150
	1    0    0    -1  
$EndComp
Entry Wire Line
	725  5500 825  5600
Entry Wire Line
	725  5600 825  5700
Entry Wire Line
	725  5700 825  5800
Entry Wire Line
	725  6300 825  6400
Entry Wire Line
	725  6400 825  6500
Entry Wire Line
	725  6500 825  6600
Entry Wire Line
	725  6600 825  6700
Entry Wire Line
	725  6700 825  6800
Entry Wire Line
	725  6800 825  6900
Entry Wire Line
	725  6900 825  7000
Entry Wire Line
	725  7000 825  7100
Entry Wire Line
	725  7100 825  7200
Entry Wire Line
	725  7200 825  7300
Entry Wire Line
	725  7300 825  7400
Entry Wire Line
	725  7400 825  7500
Entry Wire Line
	825  9200 725  9100
Entry Wire Line
	825  9900 725  9800
Entry Wire Line
	825  9800 725  9700
Entry Wire Line
	825  9700 725  9600
Entry Wire Line
	825  9600 725  9500
Entry Wire Line
	825  9500 725  9400
Entry Wire Line
	825  9400 725  9300
Entry Wire Line
	825  9300 725  9200
Entry Wire Line
	725  5800 825  5900
Text Label 825  5900 0    39   ~ 0
CLK14
Text Label 825  5600 0    39   ~ 0
CLK32
Text Label 825  9200 0    39   ~ 0
VD6
Text Label 825  9000 0    39   ~ 0
VD4
Text Label 825  9100 0    39   ~ 0
VD7
Text Label 4475 10900 2    39   ~ 0
VD5
Text Label 4475 11100 2    39   ~ 0
VD1
Text Label 825  8900 0    39   ~ 0
VD2
Text Label 825  8500 0    39   ~ 0
VD0
Text Label 4475 11000 2    39   ~ 0
VD3
Text Notes 725  4625 0    79   ~ 0
CPLD
Entry Wire Line
	725  6100 825  6200
$Comp
L EPM3256ATC144:EPM3256ATC144 U10
U 1 1 9170CED9
P 2650 8600
F 0 "U10" H 2650 12481 50  0000 C CNN
F 1 "EPM3256ATC144-10" H 2650 12390 50  0000 C CNN
F 2 "Package_QFP:TQFP-144_20x20mm_P0.5mm" H 2650 8550 50  0001 C CNN
F 3 "DOCUMENTATION" H 2650 8550 50  0001 C CNN
	1    2650 8600
	1    0    0    -1  
$EndComp
Text Label 825  9800 0    39   ~ 0
A14
Text Label 825  10000 0    39   ~ 0
A15
Text Label 825  9700 0    39   ~ 0
A1
Text Label 825  9600 0    39   ~ 0
A0
Entry Wire Line
	725  8500 825  8600
Entry Wire Line
	725  9000 825  9100
Entry Wire Line
	725  8900 825  9000
Entry Wire Line
	725  8800 825  8900
Entry Wire Line
	725  8700 825  8800
Entry Wire Line
	725  8600 825  8700
Entry Wire Line
	725  8400 825  8500
Entry Wire Line
	725  7600 825  7700
Entry Wire Line
	725  7500 825  7600
Entry Wire Line
	825  7800 725  7700
Entry Wire Line
	825  7900 725  7800
Entry Wire Line
	825  8000 725  7900
Entry Wire Line
	825  8100 725  8000
Entry Wire Line
	825  8200 725  8100
Entry Wire Line
	825  8300 725  8200
Entry Wire Line
	825  8400 725  8300
Entry Wire Line
	825  10500 725  10400
Entry Wire Line
	825  11200 725  11100
Entry Wire Line
	825  11100 725  11000
Entry Wire Line
	825  11000 725  10900
Entry Wire Line
	825  10900 725  10800
Entry Wire Line
	825  10800 725  10700
Entry Wire Line
	825  10700 725  10600
Entry Wire Line
	825  10600 725  10500
Entry Wire Line
	725  10300 825  10400
Entry Wire Line
	725  10200 825  10300
Entry Wire Line
	725  10000 825  10100
Entry Wire Line
	725  9900 825  10000
Entry Wire Line
	825  11400 725  11300
Entry Wire Line
	825  11300 725  11200
$Comp
L power:+5V #PWR026
U 1 1 63A70551
P 7325 2725
F 0 "#PWR026" H 7325 2575 50  0001 C CNN
F 1 "+5V" H 7325 2875 39  0000 C CNN
F 2 "" H 7325 2725 50  0001 C CNN
F 3 "" H 7325 2725 50  0001 C CNN
	1    7325 2725
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR077
U 1 1 5AB361CA
P 11850 8375
F 0 "#PWR077" H 11850 8225 50  0001 C CNN
F 1 "+5V" H 11850 8525 39  0000 C CNN
F 2 "" H 11850 8375 50  0001 C CNN
F 3 "" H 11850 8375 50  0001 C CNN
	1    11850 8375
	1    0    0    -1  
$EndComp
Entry Wire Line
	4475 11000 4575 11100
Entry Wire Line
	4475 11300 4575 11400
Entry Wire Line
	4475 11200 4575 11300
Entry Wire Line
	4475 11100 4575 11200
Entry Wire Line
	4475 11400 4575 11500
Entry Wire Line
	4575 9800 4475 9700
Entry Wire Line
	4575 9100 4475 9000
Entry Wire Line
	4575 9200 4475 9100
Entry Wire Line
	4575 9300 4475 9200
Entry Wire Line
	4575 9400 4475 9300
Entry Wire Line
	4575 9500 4475 9400
Entry Wire Line
	4575 9600 4475 9500
Entry Wire Line
	4575 9700 4475 9600
Entry Wire Line
	4475 10900 4575 11000
Entry Wire Line
	4475 10800 4575 10900
Entry Wire Line
	4475 10700 4575 10800
Entry Wire Line
	4475 10600 4575 10700
Entry Wire Line
	4475 10100 4575 10200
Entry Wire Line
	4475 10000 4575 10100
Entry Wire Line
	4475 9900 4575 10000
Text Label 825  7500 0    39   ~ 0
RA14
Entry Wire Line
	4575 9000 4475 8900
Entry Wire Line
	4575 8700 4475 8600
Entry Wire Line
	4575 8600 4475 8500
Entry Wire Line
	4575 8500 4475 8400
Entry Wire Line
	4575 8400 4475 8300
Entry Wire Line
	4575 8300 4475 8200
Text Label 825  7700 0    39   ~ 0
RA16
Entry Wire Line
	4575 8900 4475 8800
Entry Wire Line
	4575 8800 4475 8700
Text Label 825  7600 0    39   ~ 0
RA15
Text Label 825  7200 0    39   ~ 0
VA10
Text Label 825  6300 0    39   ~ 0
VA6
Text Label 825  6400 0    39   ~ 0
~VWR
Text Label 825  6500 0    39   ~ 0
VA18
Text Label 825  7400 0    39   ~ 0
VA8
Text Label 825  7300 0    39   ~ 0
VA9
Text Label 825  7100 0    39   ~ 0
VA11
Text Label 825  8300 0    39   ~ 0
VA15
Text Label 825  6600 0    39   ~ 0
VA7
Text Label 825  6900 0    39   ~ 0
VA13
Text Label 825  7800 0    39   ~ 0
VA17
Text Label 825  7900 0    39   ~ 0
VA16
Text Label 825  6100 0    39   ~ 0
VA4
Text Label 825  6200 0    39   ~ 0
VA5
Text Label 4475 11400 2    39   ~ 0
VA3
Text Label 4475 11200 2    39   ~ 0
VA2
Text Label 4475 11300 2    39   ~ 0
~VRD
Text Label 825  6800 0    39   ~ 0
VA1
Text Label 825  6700 0    39   ~ 0
VA0
Text Label 4475 5900 2    39   ~ 0
TMS
Text Label 4475 5800 2    39   ~ 0
TDO
Text Label 4475 5700 2    39   ~ 0
TDI
Text Label 4475 5600 2    39   ~ 0
TCK
Entry Wire Line
	4475 5600 4575 5700
Entry Wire Line
	4475 5700 4575 5800
Entry Wire Line
	4475 5800 4575 5900
Entry Wire Line
	4475 6900 4575 7000
Entry Wire Line
	4475 6800 4575 6900
Entry Wire Line
	4475 6700 4575 6800
Entry Wire Line
	4475 6600 4575 6700
Entry Wire Line
	4475 6500 4575 6600
Entry Wire Line
	4475 6400 4575 6500
Entry Wire Line
	4475 6300 4575 6400
Entry Wire Line
	4475 6200 4575 6300
Entry Wire Line
	4475 5900 4575 6000
Entry Wire Line
	4475 6100 4575 6200
Entry Wire Line
	4475 7800 4575 7900
Entry Wire Line
	4475 7700 4575 7800
Entry Wire Line
	4475 7600 4575 7700
Entry Wire Line
	4475 7500 4575 7600
Entry Wire Line
	4475 7400 4575 7500
Entry Wire Line
	4475 7300 4575 7400
Entry Wire Line
	4475 7200 4575 7300
Entry Wire Line
	4475 7100 4575 7200
Entry Wire Line
	4475 7000 4575 7100
Entry Wire Line
	4475 8100 4575 8200
Entry Wire Line
	4475 8000 4575 8100
Entry Wire Line
	4475 7900 4575 8000
Text Label 1450 10300 0    39   ~ 0
>
Text Label 1450 10200 0    39   ~ 0
<
Entry Wire Line
	725  6000 825  6100
Entry Wire Line
	725  6200 825  6300
NoConn ~ 22100 14000
Text Label 21200 12500 0    39   ~ 0
~CLKCPU
Text Label 825  5800 0    39   ~ 0
~RST
Text Label 825  5700 0    39   ~ 0
~MAGIC
Text Label 4475 10800 2    39   ~ 0
~RD
Text Label 4475 10700 2    39   ~ 0
~WR
Text Label 825  8200 0    39   ~ 0
~IORQ
Text Label 825  8100 0    39   ~ 0
~MREQ
Text Label 825  8600 0    39   ~ 0
~M1
Text Label 825  8000 0    39   ~ 0
~RFSH
Text Label 825  8700 0    39   ~ 0
~NMI
Text Label 825  8800 0    39   ~ 0
~INT
Text Label 825  9900 0    39   ~ 0
~RSTCPU
Text Label 4475 10600 2    39   ~ 0
CLKCPU
Entry Wire Line
	12800 4775 12900 4875
Entry Wire Line
	12800 4875 12900 4975
Entry Wire Line
	12800 4975 12900 5075
Entry Wire Line
	12800 5075 12900 5175
Entry Wire Line
	12800 5175 12900 5275
Entry Wire Line
	12800 5275 12900 5375
Entry Wire Line
	12800 5375 12900 5475
Entry Wire Line
	12800 5475 12900 5575
Entry Bus Bus
	12900 5575 13000 5675
Entry Bus Bus
	10625 4525 10725 4625
Entry Wire Line
	10725 4675 10825 4775
Entry Wire Line
	10725 4775 10825 4875
Entry Wire Line
	10725 4875 10825 4975
Entry Wire Line
	10725 4975 10825 5075
Text Label 12800 5475 2    39   ~ 0
D7
Text Label 12800 5375 2    39   ~ 0
D6
Text Label 12800 5275 2    39   ~ 0
D5
Text Label 12800 5175 2    39   ~ 0
D4
Text Label 12800 5075 2    39   ~ 0
D3
Text Label 12800 4975 2    39   ~ 0
D2
Text Label 12800 4875 2    39   ~ 0
D1
Text Label 12800 4775 2    39   ~ 0
D0
Text Label 10825 5075 0    39   ~ 0
~WR
Text Label 10825 4975 0    39   ~ 0
~RD
Text Label 10825 4875 0    39   ~ 0
A8
Text Label 10825 4775 0    39   ~ 0
A5
Text Label 12900 5625 2    39   ~ 0
FD_INTRQ
$Comp
L power:+5V #PWR069
U 1 1 651CAE2F
P 11175 6325
F 0 "#PWR069" H 11175 6175 50  0001 C CNN
F 1 "+5V" H 11190 6490 39  0001 C CNN
F 2 "" H 11175 6325 50  0001 C CNN
F 3 "" H 11175 6325 50  0001 C CNN
	1    11175 6325
	0    -1   -1   0   
$EndComp
NoConn ~ 12375 6825
Entry Wire Line
	12900 6725 13000 6825
Entry Wire Line
	12900 6625 13000 6725
Entry Wire Line
	12900 6525 13000 6625
Entry Wire Line
	12900 6425 13000 6525
Entry Wire Line
	12900 6175 13000 6275
Entry Wire Line
	12900 6075 13000 6175
Entry Wire Line
	12900 5975 13000 6075
Entry Wire Line
	12900 5875 13000 5975
Entry Wire Line
	12900 5725 13000 5825
Entry Wire Line
	12900 5625 13000 5725
Text Label 12900 5725 2    39   ~ 0
FD_DRQ
Entry Wire Line
	10625 6575 10725 6675
Entry Wire Line
	10625 6475 10725 6575
Entry Wire Line
	10625 6375 10725 6475
Entry Wire Line
	10625 6075 10725 6175
Entry Wire Line
	10625 5975 10725 6075
Entry Wire Line
	10625 5825 10725 5925
Entry Wire Line
	10625 5525 10725 5625
Entry Wire Line
	10625 5425 10725 5525
Entry Wire Line
	10625 5075 10725 5175
Entry Wire Line
	10625 5325 10725 5425
Text Label 10725 5775 0    39   ~ 0
FD_WF_DE
Entry Wire Line
	10625 5675 10725 5775
Entry Wire Line
	10625 5225 10725 5325
Text Label 10725 5325 0    39   ~ 0
FD_INDEX1
Text Label 14300 6725 0    39   ~ 0
FD_WF_DE
Entry Wire Line
	14200 6825 14300 6925
Text Label 14300 6325 0    39   ~ 0
FD_INDEX
Text Label 14300 7025 0    39   ~ 0
FD_RDAT
Text Label 14300 5800 0    39   ~ 0
FD_RDAT
Entry Wire Line
	14200 5700 14300 5800
Entry Wire Line
	14200 6725 14300 6825
Entry Wire Line
	14200 6625 14300 6725
Entry Wire Line
	14200 6925 14300 7025
Entry Wire Line
	14200 6325 14300 6425
Entry Wire Line
	14200 6225 14300 6325
Text Label 15800 4475 0    39   ~ 0
FD_INDEX
Text Label 15800 5125 0    39   ~ 0
FD_TR00
Text Label 15800 4800 0    39   ~ 0
FD_WPT
Entry Wire Line
	15700 5025 15800 5125
Entry Wire Line
	15700 4700 15800 4800
Entry Wire Line
	15700 4375 15800 4475
Entry Wire Line
	13000 6100 13100 6200
Entry Wire Line
	13000 5775 13100 5875
Entry Wire Line
	13000 5450 13100 5550
Entry Wire Line
	13000 5125 13100 5225
Entry Wire Line
	13000 4800 13100 4900
Entry Wire Line
	13000 4450 13100 4550
Text Label 14300 5700 0    39   ~ 0
FD_WPT
Entry Wire Line
	14200 5600 14300 5700
Text Label 14300 5600 0    39   ~ 0
FD_TR00
Entry Wire Line
	14200 5500 14300 5600
$Comp
L Device:R_Network08 RN4
U 1 1 619201BB
P 15075 6725
F 0 "RN4" V 14550 6650 50  0000 L CNN
F 1 "1.5k" V 15500 6650 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 15550 6725 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 15075 6725 50  0001 C CNN
	1    15075 6725
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR068
U 1 1 61922E47
P 15275 6325
F 0 "#PWR068" H 15275 6175 50  0001 C CNN
F 1 "+5V" H 15290 6490 39  0001 C CNN
F 2 "" H 15275 6325 50  0001 C CNN
F 3 "" H 15275 6325 50  0001 C CNN
	1    15275 6325
	0    1    1    0   
$EndComp
NoConn ~ 14625 5000
NoConn ~ 14625 6000
NoConn ~ 14625 4400
$Comp
L power:+12V #PWR062
U 1 1 61123D97
P 11875 4525
F 0 "#PWR062" H 11875 4375 50  0001 C CNN
F 1 "+12V" H 11850 4675 39  0000 C CNN
F 2 "" H 11875 4525 50  0001 C CNN
F 3 "" H 11875 4525 50  0001 C CNN
	1    11875 4525
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR061
U 1 1 6108AEFB
P 11675 4525
F 0 "#PWR061" H 11675 4375 50  0001 C CNN
F 1 "+5V" H 11675 4675 39  0000 C CNN
F 2 "" H 11675 4525 50  0001 C CNN
F 3 "" H 11675 4525 50  0001 C CNN
	1    11675 4525
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR071
U 1 1 6103D95A
P 11775 7075
F 0 "#PWR071" H 11775 6825 50  0001 C CNN
F 1 "GND" H 11780 6902 39  0001 C CNN
F 2 "" H 11775 7075 50  0001 C CNN
F 3 "" H 11775 7075 50  0001 C CNN
	1    11775 7075
	1    0    0    -1  
$EndComp
NoConn ~ 14625 4600
NoConn ~ 14625 4500
$Comp
L sizif512-rescue:Conn_FDC-my J9
U 1 1 60DCC0B8
P 15075 5200
F 0 "J9" H 15075 6225 50  0000 C CNN
F 1 "Conn_02x17_Odd_Even" H 15075 6134 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x17_P2.54mm_Vertical" H 14825 5200 50  0001 C CNN
F 3 "~" H 14825 5200 50  0001 C CNN
F 4 "Conn_FDC" H 15075 6125 51  0000 C CNN "Desc"
	1    15075 5200
	-1   0    0    -1  
$EndComp
$Comp
L my:1818VG93 U12
U 1 1 60DAA59C
P 11775 5925
F 0 "U12" H 11350 7225 39  0000 C CNN
F 1 "MB8877A" H 12100 7225 39  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 11775 6075 39  0001 C CNN
F 3 "" H 11775 6075 39  0001 C CNN
	1    11775 5925
	1    0    0    -1  
$EndComp
Text Notes 10650 4050 0    79   ~ 0
BETA DISK INTERFACE
Text Label 12900 6075 2    39   ~ 0
FD_DIR
Text Label 12900 5975 2    39   ~ 0
FD_STEP
Text Label 12900 5875 2    39   ~ 0
FD_MOTOR
Text Label 10725 6675 0    39   ~ 0
FD_MOTOR
Text Label 10725 5525 0    39   ~ 0
FD_WPT0
Text Label 10725 5175 0    39   ~ 0
FD_CS
Text Label 10725 5425 0    39   ~ 0
FD_TR00_0
Text Label 10725 5925 0    39   ~ 0
FD_CLK
$Comp
L 74xx:74HC04 U3
U 1 1 614C5547
P 13700 5225
F 0 "U3" H 13700 5375 39  0000 C CNN
F 1 "74HC04" H 13700 5225 39  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 13700 5225 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 13700 5225 50  0001 C CNN
	1    13700 5225
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U3
U 2 1 6186236B
P 13700 4900
F 0 "U3" H 13700 5050 39  0000 C CNN
F 1 "74HC04" H 13675 4900 39  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 13700 4900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 13700 4900 50  0001 C CNN
	2    13700 4900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U3
U 3 1 61867695
P 13700 5550
F 0 "U3" H 13700 5700 39  0000 C CNN
F 1 "74HC04" H 13700 5750 39  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 13700 5550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 13700 5550 50  0001 C CNN
	3    13700 5550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U3
U 5 1 6186CE1D
P 13700 5875
F 0 "U3" H 13700 6025 39  0000 C CNN
F 1 "74HC04" H 13675 5875 39  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 13700 5875 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 13700 5875 50  0001 C CNN
	5    13700 5875
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U3
U 6 1 6186FC01
P 13700 4550
F 0 "U3" H 13700 4700 39  0000 C CNN
F 1 "74HC04" H 13700 4775 39  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 13700 4550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 13700 4550 50  0001 C CNN
	6    13700 4550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U3
U 4 1 6186A295
P 13700 6200
F 0 "U3" H 13700 6350 39  0000 C CNN
F 1 "74HC04" H 13675 6200 39  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 13700 6200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 13700 6200 50  0001 C CNN
	4    13700 6200
	1    0    0    -1  
$EndComp
Text Label 13100 4550 0    39   ~ 0
FD_MOTOR
Text Label 13100 4900 0    39   ~ 0
FD_DIR
Text Label 13100 5225 0    39   ~ 0
FD_STEP
Text Label 13100 5550 0    39   ~ 0
FD_WDAT
Text Label 13100 5875 0    39   ~ 0
FD_WSTB
Text Label 13100 6200 0    39   ~ 0
FD_SIDE
Text Label 14300 4800 0    39   ~ 0
FD_DISK0
Entry Wire Line
	14200 4700 14300 4800
Text Label 14300 4900 0    39   ~ 0
FD_DISK1
Entry Wire Line
	14200 4800 14300 4900
Text Label 10725 6575 0    39   ~ 0
FD_RST
Text Label 10725 6475 0    39   ~ 0
FD_HLT
Text Label 10725 5625 0    39   ~ 0
FD_DDEN
Text Label 10725 6075 0    39   ~ 0
FD_S
Text Label 10725 6175 0    39   ~ 0
FD_RAWR
Text Label 12900 6425 2    39   ~ 0
FD_TR43
Text Label 12900 6525 2    39   ~ 0
FD_SL
Text Label 12900 6625 2    39   ~ 0
FD_SR
Text Label 12900 6725 2    39   ~ 0
FD_WD
$Comp
L power:+5V #PWR072
U 1 1 632B7B4B
P 21600 12000
F 0 "#PWR072" H 21600 11850 50  0001 C CNN
F 1 "+5V" V 21600 12125 39  0000 L CNN
F 2 "" H 21600 12000 50  0001 C CNN
F 3 "" H 21600 12000 50  0001 C CNN
	1    21600 12000
	0    -1   -1   0   
$EndComp
$Comp
L power:+9V #PWR073
U 1 1 632BA68A
P 21600 12100
F 0 "#PWR073" H 21600 11950 50  0001 C CNN
F 1 "+9V" V 21600 12225 39  0000 L CNN
F 2 "" H 21600 12100 50  0001 C CNN
F 3 "" H 21600 12100 50  0001 C CNN
	1    21600 12100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R42
U 1 1 62053588
P 7700 9125
F 0 "R42" V 7650 8900 39  0000 L CNN
F 1 "1k" V 7700 9075 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 9125 50  0001 C CNN
F 3 "~" H 7700 9125 50  0001 C CNN
	1    7700 9125
	0    -1   1    0   
$EndComp
$Comp
L Device:R R43
U 1 1 62053582
P 7700 9225
F 0 "R43" V 7650 9000 39  0000 L CNN
F 1 "1k" V 7700 9175 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 9225 50  0001 C CNN
F 3 "~" H 7700 9225 50  0001 C CNN
	1    7700 9225
	0    -1   1    0   
$EndComp
$Comp
L Device:R R44
U 1 1 6205357C
P 7700 9325
F 0 "R44" V 7650 9100 39  0000 L CNN
F 1 "1k" V 7700 9275 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 9325 50  0001 C CNN
F 3 "~" H 7700 9325 50  0001 C CNN
	1    7700 9325
	0    -1   1    0   
$EndComp
$Comp
L Device:R R45
U 1 1 62053576
P 7700 9425
F 0 "R45" V 7650 9200 39  0000 L CNN
F 1 "1k" V 7700 9375 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 9425 50  0001 C CNN
F 3 "~" H 7700 9425 50  0001 C CNN
	1    7700 9425
	0    -1   1    0   
$EndComp
$Comp
L Device:R R46
U 1 1 62053570
P 7700 9525
F 0 "R46" V 7650 9300 39  0000 L CNN
F 1 "1k" V 7700 9475 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 9525 50  0001 C CNN
F 3 "~" H 7700 9525 50  0001 C CNN
	1    7700 9525
	0    -1   1    0   
$EndComp
$Comp
L Device:R R47
U 1 1 6205356A
P 7700 9625
F 0 "R47" V 7650 9400 39  0000 L CNN
F 1 "1k" V 7700 9575 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 9625 50  0001 C CNN
F 3 "~" H 7700 9625 50  0001 C CNN
	1    7700 9625
	0    -1   1    0   
$EndComp
$Comp
L Device:R R48
U 1 1 62053564
P 7700 9725
F 0 "R48" V 7650 9500 39  0000 L CNN
F 1 "1k" V 7700 9675 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 9725 50  0001 C CNN
F 3 "~" H 7700 9725 50  0001 C CNN
	1    7700 9725
	0    -1   1    0   
$EndComp
Entry Wire Line
	8150 8325 8250 8425
Entry Wire Line
	8150 7825 8250 7925
Entry Wire Line
	8150 7925 8250 8025
Entry Wire Line
	8150 8025 8250 8125
Entry Wire Line
	8150 8125 8250 8225
Entry Wire Line
	8150 8225 8250 8325
Text Label 8150 8325 2    39   ~ 0
VA7
Text Label 8150 8225 2    39   ~ 0
VA6
Text Label 8150 8125 2    39   ~ 0
VA5
Text Label 8150 8025 2    39   ~ 0
VA4
Text Label 8150 7925 2    39   ~ 0
VA3
Text Label 8150 7825 2    39   ~ 0
VA2
Entry Wire Line
	8150 8425 8250 8525
Entry Wire Line
	8150 8525 8250 8625
Entry Wire Line
	8150 8625 8250 8725
Entry Wire Line
	8150 8725 8250 8825
Entry Wire Line
	8150 8825 8250 8925
Text Label 8150 8925 2    39   ~ 0
VA13
Text Label 8150 8825 2    39   ~ 0
VA12
Text Label 8150 8725 2    39   ~ 0
VA11
Text Label 8150 8625 2    39   ~ 0
VA10
Text Label 8150 8525 2    39   ~ 0
VA9
Text Label 8150 8425 2    39   ~ 0
VA8
Text Label 7350 8925 0    39   ~ 0
A13
Text Label 7350 8825 0    39   ~ 0
A12
Text Label 7350 8725 0    39   ~ 0
A11
Text Label 7350 8625 0    39   ~ 0
A10
Entry Wire Line
	7250 7725 7350 7825
Entry Wire Line
	7250 7825 7350 7925
Entry Wire Line
	7250 7925 7350 8025
Entry Wire Line
	7250 8025 7350 8125
Entry Wire Line
	7250 8125 7350 8225
Entry Wire Line
	7250 8225 7350 8325
Entry Wire Line
	7250 8325 7350 8425
Entry Wire Line
	7250 8425 7350 8525
Entry Wire Line
	7250 8525 7350 8625
Entry Wire Line
	7250 8625 7350 8725
Entry Wire Line
	7250 8725 7350 8825
Entry Wire Line
	7250 8825 7350 8925
Text Label 7350 7825 0    39   ~ 0
A2
Text Label 7350 7925 0    39   ~ 0
A3
Text Label 7350 8025 0    39   ~ 0
A4
Text Label 7350 8125 0    39   ~ 0
A5
Text Label 7350 8225 0    39   ~ 0
A6
Text Label 7350 8325 0    39   ~ 0
A7
Text Label 7350 8425 0    39   ~ 0
A8
Text Label 7350 8525 0    39   ~ 0
A9
$Comp
L Device:R R30
U 1 1 62BF8D6C
P 7700 7825
F 0 "R30" V 7650 7600 39  0000 L CNN
F 1 "1k" V 7700 7775 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 7825 50  0001 C CNN
F 3 "~" H 7700 7825 50  0001 C CNN
	1    7700 7825
	0    -1   1    0   
$EndComp
$Comp
L Device:R R31
U 1 1 62BF8D66
P 7700 7925
F 0 "R31" V 7650 7700 39  0000 L CNN
F 1 "1k" V 7700 7875 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 7925 50  0001 C CNN
F 3 "~" H 7700 7925 50  0001 C CNN
	1    7700 7925
	0    -1   1    0   
$EndComp
$Comp
L Device:R R32
U 1 1 62BF8D60
P 7700 8025
F 0 "R32" V 7650 7800 39  0000 L CNN
F 1 "1k" V 7700 7975 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 8025 50  0001 C CNN
F 3 "~" H 7700 8025 50  0001 C CNN
	1    7700 8025
	0    -1   1    0   
$EndComp
$Comp
L Device:R R33
U 1 1 62BF8D5A
P 7700 8125
F 0 "R33" V 7650 7900 39  0000 L CNN
F 1 "1k" V 7700 8075 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 8125 50  0001 C CNN
F 3 "~" H 7700 8125 50  0001 C CNN
	1    7700 8125
	0    -1   1    0   
$EndComp
$Comp
L Device:R R34
U 1 1 62BF8D54
P 7700 8225
F 0 "R34" V 7650 8000 39  0000 L CNN
F 1 "1k" V 7700 8175 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 8225 50  0001 C CNN
F 3 "~" H 7700 8225 50  0001 C CNN
	1    7700 8225
	0    -1   1    0   
$EndComp
$Comp
L Device:R R35
U 1 1 62BF8D4E
P 7700 8325
F 0 "R35" V 7650 8100 39  0000 L CNN
F 1 "1k" V 7700 8275 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 8325 50  0001 C CNN
F 3 "~" H 7700 8325 50  0001 C CNN
	1    7700 8325
	0    -1   1    0   
$EndComp
$Comp
L Device:R R36
U 1 1 62BF8D48
P 7700 8425
F 0 "R36" V 7650 8200 39  0000 L CNN
F 1 "1k" V 7700 8375 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 8425 50  0001 C CNN
F 3 "~" H 7700 8425 50  0001 C CNN
	1    7700 8425
	0    -1   1    0   
$EndComp
$Comp
L Device:R R37
U 1 1 62BF8D42
P 7700 8525
F 0 "R37" V 7650 8300 39  0000 L CNN
F 1 "1k" V 7700 8475 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 8525 50  0001 C CNN
F 3 "~" H 7700 8525 50  0001 C CNN
	1    7700 8525
	0    -1   1    0   
$EndComp
$Comp
L Device:R R38
U 1 1 62BF8D3C
P 7700 8625
F 0 "R38" V 7650 8400 39  0000 L CNN
F 1 "1k" V 7700 8575 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 8625 50  0001 C CNN
F 3 "~" H 7700 8625 50  0001 C CNN
	1    7700 8625
	0    -1   1    0   
$EndComp
$Comp
L Device:R R39
U 1 1 62BF8D36
P 7700 8725
F 0 "R39" V 7650 8500 39  0000 L CNN
F 1 "1k" V 7700 8675 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 8725 50  0001 C CNN
F 3 "~" H 7700 8725 50  0001 C CNN
	1    7700 8725
	0    -1   1    0   
$EndComp
$Comp
L Device:R R40
U 1 1 62BF8D30
P 7700 8825
F 0 "R40" V 7650 8600 39  0000 L CNN
F 1 "1k" V 7700 8775 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 8825 50  0001 C CNN
F 3 "~" H 7700 8825 50  0001 C CNN
	1    7700 8825
	0    -1   1    0   
$EndComp
$Comp
L Device:R R41
U 1 1 62BF8D2A
P 7700 8925
F 0 "R41" V 7650 8700 39  0000 L CNN
F 1 "1k" V 7700 8875 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 8925 50  0001 C CNN
F 3 "~" H 7700 8925 50  0001 C CNN
	1    7700 8925
	0    -1   1    0   
$EndComp
Text Label 7350 9825 0    39   ~ 0
D7
Text Label 8150 9825 2    39   ~ 0
VD7
Entry Wire Line
	8150 9825 8250 9925
$Comp
L Device:R R49
U 1 1 6205355E
P 7700 9825
F 0 "R49" V 7650 9600 39  0000 L CNN
F 1 "1k" V 7700 9775 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 9825 50  0001 C CNN
F 3 "~" H 7700 9825 50  0001 C CNN
	1    7700 9825
	0    -1   1    0   
$EndComp
Entry Wire Line
	7350 9825 7250 9725
Text Label 5850 6575 0    39   ~ 0
RA15
Text Label 825  9400 0    39   ~ 0
AY_BDIR
Text Label 825  10100 0    39   ~ 0
AY_CLK
Text Label 825  9300 0    39   ~ 0
AY_BC1
Text Label 825  10700 0    39   ~ 0
SND_DAC
Text Label 4475 10200 2    39   ~ 0
~ROMCS0
Text Label 825  10300 0    39   ~ 0
~IORQGE
Text Label 4475 9600 2    39   ~ 0
KD0
Text Label 4475 9500 2    39   ~ 0
KD1
Entry Wire Line
	8150 8925 8250 9025
Wire Wire Line
	18500 2300 18500 2400
Wire Wire Line
	19100 1950 19000 1950
Wire Wire Line
	18500 1950 18500 2200
Wire Wire Line
	18500 2550 18500 2400
Connection ~ 18500 2400
Wire Wire Line
	22200 4450 22300 4450
Wire Wire Line
	22200 4850 22300 4850
Wire Wire Line
	22300 4450 22300 4850
Connection ~ 22300 4850
Wire Wire Line
	22300 4850 22300 4875
Wire Wire Line
	21575 4125 21425 4125
Wire Wire Line
	21700 4650 21575 4650
Wire Wire Line
	21575 4650 21575 4425
Wire Wire Line
	21700 4850 21425 4850
Wire Wire Line
	21425 4850 21425 4425
Connection ~ 21425 4850
Connection ~ 21575 4650
Wire Wire Line
	21350 4900 21350 4450
Connection ~ 21350 4450
Wire Wire Line
	21350 4450 21700 4450
Wire Wire Line
	18600 1950 18500 1950
Wire Wire Line
	20275 5275 20325 5275
Connection ~ 20675 1950
Wire Wire Line
	19525 5275 19675 5275
Connection ~ 19675 5275
Wire Wire Line
	5500 2925 5500 3000
Connection ~ 5500 2925
Wire Wire Line
	4900 2925 4900 3350
Connection ~ 4900 2925
Wire Wire Line
	5500 2500 5500 2925
Wire Wire Line
	4900 2500 4900 2925
Wire Wire Line
	5500 2500 5350 2500
Wire Wire Line
	5050 2500 4900 2500
Connection ~ 5500 3350
Wire Wire Line
	5500 3350 5500 3400
Wire Wire Line
	5500 3350 5500 3300
Wire Wire Line
	5350 3350 5500 3350
Wire Wire Line
	4900 3350 4900 3400
Connection ~ 4900 3350
Wire Wire Line
	5050 3350 4900 3350
Connection ~ 4900 3700
Wire Wire Line
	4900 3700 5500 3700
Wire Wire Line
	5500 975  5500 1400
Wire Wire Line
	5500 975  5350 975 
Wire Wire Line
	4900 975  4900 1400
Wire Wire Line
	5050 975  4900 975 
Connection ~ 4900 1400
Wire Wire Line
	5500 1400 5500 1475
Connection ~ 5500 1400
Connection ~ 5500 1825
Wire Wire Line
	5500 1825 5500 1875
Wire Wire Line
	5500 1825 5500 1775
Wire Wire Line
	5350 1825 5500 1825
Wire Wire Line
	4900 1825 4900 1875
Connection ~ 4900 1825
Wire Wire Line
	5050 1825 4900 1825
Wire Wire Line
	4900 1400 4900 1825
Connection ~ 4900 2175
Wire Wire Line
	4900 2175 5500 2175
Wire Wire Line
	11250 9725 10925 9725
Wire Wire Line
	10925 9825 11250 9825
Wire Wire Line
	11250 10075 10925 10075
Wire Wire Line
	10925 10175 11250 10175
Connection ~ 6700 825 
Wire Bus Line
	4700 825  4700 3900
Wire Bus Line
	4700 825  6700 825 
Wire Wire Line
	6800 1400 7050 1400
Wire Wire Line
	7875 1400 7650 1400
Wire Bus Line
	6700 825  7975 825 
Wire Wire Line
	2725 1325 3200 1325
Wire Wire Line
	3200 1625 2725 1625
Wire Wire Line
	2725 1925 3200 1925
Wire Wire Line
	3200 2025 2725 2025
Wire Wire Line
	2725 2325 3200 2325
Wire Wire Line
	3200 2425 2725 2425
Wire Wire Line
	2725 2525 3200 2525
Wire Wire Line
	3200 2625 2725 2625
Wire Wire Line
	3200 3025 2725 3025
Wire Wire Line
	2725 3125 3200 3125
Wire Wire Line
	3200 3225 2725 3225
Wire Wire Line
	2725 3325 3200 3325
Wire Wire Line
	2725 3625 3200 3625
Wire Wire Line
	3200 3725 2725 3725
Wire Wire Line
	3400 2900 3675 2900
Wire Wire Line
	3675 2700 3400 2700
Wire Wire Line
	3400 2800 3675 2800
Wire Wire Line
	3400 3200 3675 3200
Wire Wire Line
	3400 3100 3675 3100
Wire Wire Line
	3400 1375 3675 1375
Wire Wire Line
	3400 1475 3675 1475
Wire Wire Line
	3675 1575 3400 1575
Wire Wire Line
	3400 1675 3675 1675
Wire Wire Line
	3675 1775 3400 1775
Wire Wire Line
	3400 1875 3675 1875
Wire Wire Line
	3400 1975 3675 1975
Wire Wire Line
	3675 2075 3400 2075
Wire Wire Line
	1325 2825 850  2825
Wire Wire Line
	850  2725 1325 2725
Wire Wire Line
	1325 2625 850  2625
Wire Wire Line
	850  2525 1325 2525
Wire Wire Line
	1325 2425 850  2425
Wire Wire Line
	850  2325 1325 2325
Wire Wire Line
	1325 2225 850  2225
Wire Wire Line
	850  2125 1325 2125
Wire Wire Line
	850  2025 1325 2025
Wire Wire Line
	850  1925 1325 1925
Wire Wire Line
	1325 1825 850  1825
Wire Wire Line
	850  1725 1325 1725
Wire Wire Line
	1325 1625 850  1625
Wire Wire Line
	850  1525 1325 1525
Wire Wire Line
	1325 1425 850  1425
Wire Wire Line
	850  1325 1325 1325
Wire Wire Line
	850  3025 1325 3025
Wire Wire Line
	850  3125 1325 3125
Wire Wire Line
	1325 3225 850  3225
Wire Wire Line
	850  3325 1325 3325
Wire Wire Line
	1325 3425 850  3425
Wire Wire Line
	850  3525 1325 3525
Wire Wire Line
	850  3625 1325 3625
Wire Wire Line
	1325 3725 850  3725
Wire Bus Line
	750  825  3300 825 
Connection ~ 3300 825 
Wire Wire Line
	11250 9325 11025 9325
Wire Wire Line
	11025 9225 11250 9225
Wire Wire Line
	11025 9125 11250 9125
Wire Wire Line
	11250 9025 11025 9025
Wire Wire Line
	11025 8925 11250 8925
Wire Wire Line
	11250 8825 11025 8825
Wire Wire Line
	11025 8725 11250 8725
Wire Wire Line
	11025 8625 11250 8625
Wire Bus Line
	3300 825  4400 825 
Wire Bus Line
	4400 825  4400 4175
Wire Wire Line
	21850 925  22075 925 
Connection ~ 21850 925 
Wire Wire Line
	21625 925  21850 925 
Connection ~ 21625 925 
Wire Wire Line
	21400 925  21625 925 
Connection ~ 21400 925 
Wire Wire Line
	21175 925  21400 925 
Connection ~ 21175 925 
Wire Wire Line
	20950 925  21175 925 
Connection ~ 20950 925 
Wire Wire Line
	20725 925  20950 925 
Connection ~ 20725 925 
Wire Wire Line
	20500 925  20725 925 
Connection ~ 20500 925 
Wire Wire Line
	20275 925  20500 925 
Connection ~ 20275 925 
Wire Wire Line
	21850 1225 22075 1225
Connection ~ 21850 1225
Wire Wire Line
	21625 1225 21850 1225
Connection ~ 21625 1225
Wire Wire Line
	21400 1225 21625 1225
Connection ~ 21400 1225
Wire Wire Line
	21175 1225 21400 1225
Connection ~ 21175 1225
Wire Wire Line
	20950 1225 21175 1225
Connection ~ 20950 1225
Wire Wire Line
	20725 1225 20950 1225
Connection ~ 20725 1225
Wire Wire Line
	20500 1225 20725 1225
Connection ~ 20500 1225
Wire Wire Line
	20275 1225 20500 1225
Connection ~ 20275 1225
Wire Bus Line
	21100 3700 22500 3700
Wire Wire Line
	21200 9800 21750 9800
Wire Wire Line
	21200 9500 21525 9500
Wire Wire Line
	21525 9400 21200 9400
Wire Wire Line
	21200 9200 21825 9200
Wire Wire Line
	22125 9600 22400 9600
Wire Wire Line
	22400 9500 22125 9500
Wire Wire Line
	22125 9400 22400 9400
Wire Wire Line
	21600 10450 21200 10450
Wire Wire Line
	21200 10900 21600 10900
Wire Wire Line
	21200 7325 21500 7325
Wire Wire Line
	21500 7425 21200 7425
Wire Wire Line
	21200 7225 21500 7225
Wire Wire Line
	21500 7025 21200 7025
Wire Wire Line
	21200 6825 21500 6825
Wire Wire Line
	21500 6725 21200 6725
Wire Wire Line
	21200 6625 21500 6625
Wire Wire Line
	21200 5725 21525 5725
Wire Wire Line
	21200 5825 21525 5825
Wire Wire Line
	21200 5925 21525 5925
Wire Wire Line
	21200 6125 21525 6125
Wire Wire Line
	22025 5725 22400 5725
Wire Wire Line
	22025 5825 22400 5825
Wire Wire Line
	22025 5925 22400 5925
Wire Wire Line
	21200 4850 21425 4850
Wire Wire Line
	21200 4650 21575 4650
Wire Wire Line
	21200 4550 21700 4550
Wire Wire Line
	21200 4450 21350 4450
Wire Wire Line
	21200 11800 21600 11800
Wire Wire Line
	21200 11900 21600 11900
Wire Wire Line
	21200 12500 21600 12500
Wire Wire Line
	21200 12600 21600 12600
Wire Wire Line
	21200 12700 21600 12700
Wire Wire Line
	21200 12800 21600 12800
Wire Wire Line
	21200 13600 21600 13600
Wire Wire Line
	21200 13700 21600 13700
Wire Wire Line
	21200 13800 21600 13800
Wire Wire Line
	21200 13900 21600 13900
Wire Wire Line
	21200 14000 21600 14000
Wire Wire Line
	21200 14100 21600 14100
Wire Wire Line
	21200 14200 21600 14200
Wire Wire Line
	21200 14300 21600 14300
Wire Wire Line
	21200 14400 21600 14400
Wire Wire Line
	21200 14500 21600 14500
Wire Wire Line
	21200 12900 21600 12900
Wire Wire Line
	21200 13000 21600 13000
Wire Wire Line
	22400 11800 22100 11800
Wire Wire Line
	22400 11900 22100 11900
Wire Wire Line
	22400 12000 22100 12000
Wire Wire Line
	22400 12300 22100 12300
Wire Wire Line
	22400 12400 22100 12400
Wire Wire Line
	22400 12500 22100 12500
Wire Wire Line
	22400 12600 22100 12600
Wire Wire Line
	22400 12700 22100 12700
Wire Wire Line
	22400 12800 22100 12800
Wire Wire Line
	22400 12900 22100 12900
Wire Wire Line
	22400 13000 22100 13000
Wire Wire Line
	22400 13100 22100 13100
Wire Wire Line
	22400 13200 22100 13200
Wire Wire Line
	22400 13300 22100 13300
Wire Wire Line
	22400 13400 22100 13400
Wire Wire Line
	22400 14100 22100 14100
Wire Wire Line
	22400 14200 22100 14200
Wire Wire Line
	22400 14300 22100 14300
Wire Wire Line
	22400 14400 22100 14400
Wire Wire Line
	22400 13500 22100 13500
Wire Wire Line
	22400 13600 22100 13600
Wire Wire Line
	22400 13800 22100 13800
Wire Wire Line
	21025 2975 20675 2975
Connection ~ 20675 2975
Connection ~ 19900 1950
Wire Wire Line
	22025 2875 22025 2975
Wire Wire Line
	6050 6775 5575 6775
Wire Wire Line
	5225 6875 6050 6875
Connection ~ 4875 7325
Wire Wire Line
	6650 8525 6375 8525
Wire Wire Line
	6650 8425 6375 8425
Wire Wire Line
	6375 8325 6650 8325
Wire Wire Line
	6650 8225 6375 8225
Wire Wire Line
	6375 8125 6650 8125
Wire Wire Line
	6650 8025 6375 8025
Wire Wire Line
	6650 7925 6375 7925
Wire Wire Line
	6375 7825 6650 7825
Wire Wire Line
	6650 8925 6375 8925
Wire Wire Line
	6650 9025 6375 9025
Wire Wire Line
	7300 6275 7250 6275
Wire Wire Line
	7300 6325 7300 6275
Wire Wire Line
	7350 6325 7300 6325
Wire Wire Line
	8150 6175 7250 6175
Wire Wire Line
	7300 6075 8150 6075
Wire Wire Line
	7950 6325 8150 6325
Wire Wire Line
	7250 5075 8150 5075
Wire Wire Line
	8150 5175 7250 5175
Wire Wire Line
	8150 5275 7250 5275
Wire Wire Line
	7250 5375 8150 5375
Wire Wire Line
	8150 5475 7250 5475
Wire Wire Line
	7250 5575 8150 5575
Wire Wire Line
	8150 5675 7250 5675
Wire Wire Line
	8150 5775 7250 5775
Wire Bus Line
	8250 4650 5750 4650
Wire Wire Line
	6050 6475 5850 6475
Wire Wire Line
	6050 6575 5850 6575
Wire Wire Line
	5850 6675 6050 6675
Wire Wire Line
	5850 5075 6050 5075
Wire Wire Line
	6050 5175 5850 5175
Wire Wire Line
	5850 5275 6050 5275
Wire Wire Line
	6050 5375 5850 5375
Wire Wire Line
	5850 5475 6050 5475
Wire Wire Line
	6050 5575 5850 5575
Wire Wire Line
	5850 5675 6050 5675
Wire Wire Line
	5850 5775 6050 5775
Wire Wire Line
	5850 5875 6050 5875
Wire Wire Line
	6050 5975 5850 5975
Wire Wire Line
	5850 6075 6050 6075
Wire Wire Line
	6050 6175 5850 6175
Wire Wire Line
	5850 6275 6050 6275
Wire Wire Line
	6050 6375 5850 6375
Wire Wire Line
	7800 5975 8150 5975
Wire Wire Line
	7300 6075 7300 5975
Wire Wire Line
	7300 5975 7500 5975
Connection ~ 7300 6075
Wire Wire Line
	7300 6075 7250 6075
Wire Bus Line
	5750 4650 4875 4650
Wire Bus Line
	4875 4650 4875 7325
Connection ~ 5750 4650
Wire Bus Line
	4875 7325 6750 7325
Connection ~ 6750 7325
Wire Bus Line
	6750 7325 7250 7325
Connection ~ 7250 7325
Wire Bus Line
	7250 7325 8250 7325
Wire Wire Line
	5175 9225 4975 9225
Wire Wire Line
	5175 9325 4975 9325
Wire Wire Line
	4975 9425 5175 9425
Wire Wire Line
	4975 7825 5175 7825
Wire Wire Line
	5175 7925 4975 7925
Wire Wire Line
	4975 8025 5175 8025
Wire Wire Line
	5175 8125 4975 8125
Wire Wire Line
	4975 8225 5175 8225
Wire Wire Line
	5175 8325 4975 8325
Wire Wire Line
	4975 8425 5175 8425
Wire Wire Line
	4975 8525 5175 8525
Wire Wire Line
	4975 8625 5175 8625
Wire Wire Line
	5175 8725 4975 8725
Wire Wire Line
	4975 8825 5175 8825
Wire Wire Line
	5175 8925 4975 8925
Wire Wire Line
	4975 9025 5175 9025
Wire Wire Line
	5175 9125 4975 9125
Wire Wire Line
	4975 9525 5175 9525
Wire Wire Line
	4975 9625 5175 9625
Wire Wire Line
	1450 5600 825  5600
Wire Wire Line
	1450 5700 825  5700
Wire Wire Line
	1450 5800 825  5800
Wire Wire Line
	1450 6800 825  6800
Wire Wire Line
	1450 7500 825  7500
Wire Wire Line
	1450 8200 825  8200
Wire Wire Line
	1450 8100 825  8100
Wire Wire Line
	1450 8600 825  8600
Wire Wire Line
	1450 8000 825  8000
Wire Wire Line
	1450 8700 825  8700
Wire Wire Line
	1450 8800 825  8800
Wire Wire Line
	1450 9900 825  9900
Wire Wire Line
	3850 10600 4475 10600
Wire Wire Line
	1450 8500 825  8500
Wire Wire Line
	1450 8900 825  8900
Wire Wire Line
	1450 9000 825  9000
Wire Wire Line
	1450 9200 825  9200
Wire Wire Line
	1450 9100 825  9100
Wire Wire Line
	1450 5900 825  5900
Connection ~ 2950 4900
Connection ~ 3150 12150
Wire Wire Line
	3050 12150 3150 12150
Connection ~ 3050 12150
Wire Wire Line
	2950 12150 3050 12150
Connection ~ 2950 12150
Wire Wire Line
	2850 4900 2950 4900
Connection ~ 2850 4900
Wire Wire Line
	2750 4900 2850 4900
Connection ~ 2750 4900
Wire Wire Line
	2850 12150 2950 12150
Connection ~ 2850 12150
Wire Wire Line
	2750 12150 2850 12150
Connection ~ 2750 12150
Wire Wire Line
	2150 4900 2250 4900
Connection ~ 2250 4900
Connection ~ 1850 12150
Wire Wire Line
	1850 12150 1950 12150
Connection ~ 1950 12150
Wire Wire Line
	2650 4900 2750 4900
Connection ~ 2650 4900
Wire Wire Line
	2650 12150 2750 12150
Connection ~ 2650 12150
Connection ~ 2250 12150
Wire Wire Line
	2550 12150 2650 12150
Connection ~ 2550 12150
Wire Wire Line
	2550 4900 2650 4900
Connection ~ 2550 4900
Wire Wire Line
	2450 12150 2550 12150
Connection ~ 2450 12150
Wire Wire Line
	2450 4900 2550 4900
Connection ~ 2450 4900
Wire Wire Line
	2350 12150 2450 12150
Wire Wire Line
	2250 12150 2350 12150
Connection ~ 2350 12150
Wire Wire Line
	2150 12150 2250 12150
Connection ~ 2150 12150
Wire Wire Line
	2050 12150 2150 12150
Wire Wire Line
	1950 12150 2050 12150
Connection ~ 2050 12150
Wire Wire Line
	2350 4900 2450 4900
Wire Wire Line
	2250 4900 2350 4900
Connection ~ 2350 4900
Wire Wire Line
	3050 4900 3150 4900
Wire Wire Line
	2950 4900 3050 4900
Connection ~ 3050 4900
Wire Wire Line
	3150 12150 3250 12150
Connection ~ 3250 12150
Wire Wire Line
	3350 12150 3450 12150
Wire Wire Line
	3250 12150 3350 12150
Connection ~ 3350 12150
Wire Wire Line
	1450 7700 825  7700
Wire Wire Line
	1450 7600 825  7600
Wire Wire Line
	3850 5600 4475 5600
Wire Wire Line
	3850 5700 4475 5700
Wire Wire Line
	3850 5800 4475 5800
Wire Wire Line
	3850 5900 4475 5900
Wire Wire Line
	1450 6600 825  6600
Wire Wire Line
	1450 6500 825  6500
Wire Wire Line
	3850 11400 4475 11400
Wire Wire Line
	1450 6100 825  6100
Wire Wire Line
	1450 6200 825  6200
Wire Wire Line
	1450 6300 825  6300
Wire Wire Line
	1450 7400 825  7400
Wire Wire Line
	1450 7200 825  7200
Wire Wire Line
	1450 7100 825  7100
Wire Wire Line
	1450 7000 825  7000
Wire Wire Line
	1450 6900 825  6900
Wire Wire Line
	1450 6700 825  6700
Wire Wire Line
	1450 8300 825  8300
Wire Wire Line
	1450 6400 825  6400
Wire Wire Line
	1450 7900 825  7900
Wire Wire Line
	1450 7800 825  7800
Wire Wire Line
	1450 7300 825  7300
Wire Bus Line
	725  4650 4575 4650
Wire Wire Line
	12375 4775 12800 4775
Wire Wire Line
	12800 4875 12375 4875
Wire Wire Line
	12800 4975 12375 4975
Wire Wire Line
	12375 5075 12800 5075
Wire Wire Line
	12800 5175 12375 5175
Wire Wire Line
	12375 5275 12800 5275
Wire Wire Line
	12800 5375 12375 5375
Wire Wire Line
	12800 5475 12375 5475
Wire Wire Line
	10825 4775 11175 4775
Wire Wire Line
	11175 4875 10825 4875
Wire Wire Line
	10825 4975 11175 4975
Wire Wire Line
	11175 5075 10825 5075
Connection ~ 13000 4075
Wire Wire Line
	12900 6725 12375 6725
Wire Wire Line
	12375 6625 12900 6625
Wire Wire Line
	12900 6525 12375 6525
Wire Wire Line
	12375 6425 12900 6425
Wire Wire Line
	12375 6175 12900 6175
Wire Wire Line
	12900 6075 12375 6075
Wire Wire Line
	12375 5975 12900 5975
Wire Wire Line
	12900 5875 12375 5875
Wire Wire Line
	12900 5725 12375 5725
Wire Wire Line
	12900 5625 12375 5625
Wire Wire Line
	11175 5925 10725 5925
Wire Wire Line
	11175 6075 10725 6075
Wire Wire Line
	11175 6175 10725 6175
Wire Wire Line
	10725 6575 11175 6575
Wire Wire Line
	11175 6475 10725 6475
Wire Wire Line
	11175 6675 10725 6675
Wire Wire Line
	11175 5625 10725 5625
Wire Wire Line
	11175 5525 10725 5525
Wire Wire Line
	11175 5425 10725 5425
Wire Wire Line
	11175 5175 10725 5175
Wire Wire Line
	11175 5775 10725 5775
Wire Wire Line
	11175 5325 10725 5325
Wire Bus Line
	10625 4075 13000 4075
Connection ~ 14200 4075
Wire Bus Line
	13000 4075 14200 4075
Wire Bus Line
	14200 4075 15700 4075
Connection ~ 15700 4075
Wire Wire Line
	14300 5800 14625 5800
Wire Wire Line
	14875 6725 14300 6725
Wire Wire Line
	14875 7025 14300 7025
Wire Wire Line
	14875 6425 14300 6425
Wire Wire Line
	14875 6325 14300 6325
Wire Wire Line
	14125 6200 14000 6200
Wire Wire Line
	14125 5900 14125 6200
Wire Wire Line
	14625 5900 14125 5900
Wire Wire Line
	14150 5100 14625 5100
Wire Wire Line
	14150 4550 14150 5100
Wire Wire Line
	14000 4550 14150 4550
Wire Wire Line
	14075 5200 14625 5200
Wire Wire Line
	14075 4900 14075 5200
Wire Wire Line
	14000 4900 14075 4900
Wire Wire Line
	14025 5300 14625 5300
Wire Wire Line
	14025 5225 14025 5300
Wire Wire Line
	14000 5225 14025 5225
Wire Wire Line
	14025 5550 14000 5550
Wire Wire Line
	14025 5400 14025 5550
Wire Wire Line
	14625 5400 14025 5400
Wire Wire Line
	14075 5875 14000 5875
Wire Wire Line
	14075 5500 14075 5875
Wire Wire Line
	14625 5700 14300 5700
Wire Wire Line
	14300 5600 14625 5600
Wire Wire Line
	15525 5900 15525 5800
Connection ~ 15525 5900
Wire Wire Line
	15525 5800 15525 5700
Connection ~ 15525 5800
Wire Wire Line
	15525 5700 15525 5600
Connection ~ 15525 5700
Wire Wire Line
	15525 5600 15525 5500
Connection ~ 15525 5600
Wire Wire Line
	15525 5500 15525 5400
Connection ~ 15525 5500
Wire Wire Line
	15525 5400 15525 5300
Connection ~ 15525 5400
Wire Wire Line
	15525 5300 15525 5200
Connection ~ 15525 5300
Wire Wire Line
	15525 5200 15525 5100
Connection ~ 15525 5200
Wire Wire Line
	15525 5100 15525 5000
Connection ~ 15525 5100
Wire Wire Line
	15525 5000 15525 4900
Connection ~ 15525 5000
Wire Wire Line
	15525 4900 15525 4800
Connection ~ 15525 4900
Wire Wire Line
	15525 4800 15525 4700
Connection ~ 15525 4800
Wire Wire Line
	15525 4700 15525 4600
Connection ~ 15525 4700
Wire Wire Line
	15525 4600 15525 4500
Connection ~ 15525 4600
Wire Wire Line
	15525 4500 15525 4400
Connection ~ 15525 4500
Wire Wire Line
	15525 6000 15525 5900
Wire Wire Line
	13400 5875 13100 5875
Wire Wire Line
	13400 5550 13100 5550
Wire Wire Line
	13400 5225 13100 5225
Wire Wire Line
	13400 4900 13100 4900
Wire Wire Line
	13400 4550 13100 4550
Wire Wire Line
	13400 6200 13100 6200
Wire Wire Line
	14300 4800 14625 4800
Wire Wire Line
	14300 4900 14625 4900
Wire Wire Line
	7850 9125 8150 9125
Wire Wire Line
	7850 9225 8150 9225
Wire Wire Line
	7850 9325 8150 9325
Wire Wire Line
	7850 9425 8150 9425
Wire Wire Line
	7850 9525 8150 9525
Wire Wire Line
	7850 9625 8150 9625
Wire Wire Line
	7850 9725 8150 9725
Wire Wire Line
	7350 9125 7550 9125
Wire Wire Line
	7350 9225 7550 9225
Wire Wire Line
	7350 9325 7550 9325
Wire Wire Line
	7350 9425 7550 9425
Wire Wire Line
	7350 9525 7550 9525
Wire Wire Line
	7350 9625 7550 9625
Wire Wire Line
	7350 9725 7550 9725
Wire Wire Line
	7850 7825 8150 7825
Wire Wire Line
	7850 7925 8150 7925
Wire Wire Line
	7850 8025 8150 8025
Wire Wire Line
	7850 8125 8150 8125
Wire Wire Line
	7850 8225 8150 8225
Wire Wire Line
	7850 8325 8150 8325
Wire Wire Line
	7850 8425 8150 8425
Wire Wire Line
	7850 8525 8150 8525
Wire Wire Line
	7850 8625 8150 8625
Wire Wire Line
	7850 8725 8150 8725
Wire Wire Line
	7850 8825 8150 8825
Wire Wire Line
	7850 8925 8150 8925
Wire Wire Line
	7350 8925 7550 8925
Wire Wire Line
	7350 8825 7550 8825
Wire Wire Line
	7350 8725 7550 8725
Wire Wire Line
	7350 8625 7550 8625
Wire Wire Line
	7350 8525 7550 8525
Wire Wire Line
	7350 8425 7550 8425
Wire Wire Line
	7350 8325 7550 8325
Wire Wire Line
	7350 8225 7550 8225
Wire Wire Line
	7350 8125 7550 8125
Wire Wire Line
	7350 8025 7550 8025
Wire Wire Line
	7350 7925 7550 7925
Wire Wire Line
	7350 7825 7550 7825
Wire Wire Line
	7850 9825 8150 9825
Wire Wire Line
	7350 9825 7550 9825
Wire Wire Line
	1450 10700 825  10700
Wire Wire Line
	1450 9400 825  9400
Wire Wire Line
	1450 9500 825  9500
Wire Wire Line
	1450 10100 825  10100
Wire Wire Line
	3850 10200 4475 10200
Wire Wire Line
	825  10300 1125 10300
Connection ~ 1125 10300
Wire Wire Line
	1125 10200 1125 10300
Connection ~ 14100 8175
Wire Bus Line
	10825 8175 13175 8175
Entry Wire Line
	4475 9800 4575 9900
$Comp
L power:GND #PWR081
U 1 1 648731BC
P 14850 8850
F 0 "#PWR081" H 14850 8600 50  0001 C CNN
F 1 "GND" H 14855 8677 39  0001 C CNN
F 2 "" H 14850 8850 50  0001 C CNN
F 3 "" H 14850 8850 50  0001 C CNN
	1    14850 8850
	1    0    0    -1  
$EndComp
Wire Wire Line
	14800 8500 14850 8500
Wire Wire Line
	14850 8550 14850 8500
Connection ~ 14850 8500
Wire Wire Line
	14200 8500 14500 8500
$Comp
L Device:R R52
U 1 1 5DFA5A0E
P 14650 8500
F 0 "R52" V 14725 8450 39  0000 L CNN
F 1 "270" V 14650 8450 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 14580 8500 50  0001 C CNN
F 3 "~" H 14650 8500 50  0001 C CNN
	1    14650 8500
	0    -1   -1   0   
$EndComp
Text Label 14200 8500 0    39   ~ 0
SND_DAC
Wire Wire Line
	12450 8625 14175 8625
$Comp
L Regulator_Linear:AMS1117-3.3 U8
U 1 1 6546187A
P 21325 2975
F 0 "U8" H 21325 3193 39  0000 C CNN
F 1 "AMS1117-3.3" H 21325 3118 39  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 21325 3175 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 21425 2725 50  0001 C CNN
	1    21325 2975
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 655A73F4
P 21325 3275
F 0 "#PWR029" H 21325 3025 50  0001 C CNN
F 1 "GND" H 21330 3102 39  0001 C CNN
F 2 "" H 21325 3275 50  0001 C CNN
F 3 "" H 21325 3275 50  0001 C CNN
	1    21325 3275
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 65C1E163
P 19300 2400
F 0 "R12" V 19225 2350 39  0000 L CNN
F 1 "10k" V 19300 2350 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 19230 2400 50  0001 C CNN
F 3 "~" H 19300 2400 50  0001 C CNN
	1    19300 2400
	1    0    0    1   
$EndComp
$Comp
L Device:D_Schottky D5
U 1 1 65C295B3
P 19600 2100
F 0 "D5" V 19575 2250 39  0000 R CNN
F 1 "BAT85" V 19555 2021 50  0001 R CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 19600 2100 50  0001 C CNN
F 3 "~" H 19600 2100 50  0001 C CNN
	1    19600 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	19600 2250 19300 2250
Wire Wire Line
	18500 2550 19300 2550
Wire Wire Line
	19600 1950 19500 1950
Connection ~ 19600 1950
Connection ~ 19300 2550
Wire Wire Line
	19900 2550 19300 2550
Wire Wire Line
	19900 2400 19900 2550
Wire Wire Line
	19900 2100 19900 1950
$Comp
L power:+12V #PWR018
U 1 1 6678483D
P 19900 1950
F 0 "#PWR018" H 19900 1800 50  0001 C CNN
F 1 "+12V" H 19875 2100 39  0000 C CNN
F 2 "" H 19900 1950 50  0001 C CNN
F 3 "" H 19900 1950 50  0001 C CNN
	1    19900 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	19900 1950 20275 1950
Wire Wire Line
	19600 1950 19900 1950
Connection ~ 20275 1950
Wire Wire Line
	19900 2550 20275 2550
Connection ~ 19900 2550
$Comp
L Device:Q_PMOS_GDS Q1
U 1 1 671E8243
P 19300 2050
F 0 "Q1" V 19619 2050 39  0000 C CNN
F 1 "IRF9540" V 19544 2050 39  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 19500 2150 50  0001 C CNN
F 3 "~" H 19300 2050 50  0001 C CNN
	1    19300 2050
	0    -1   -1   0   
$EndComp
Connection ~ 19300 2250
$Comp
L Connector_Generic:Conn_01x04 J4
U 1 1 6720E1D9
P 20200 4100
F 0 "J4" H 20280 4092 50  0000 L CNN
F 1 "Conn_01x04" H 20280 4001 50  0000 L CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-04A_1x04_P2.54mm_Vertical" H 20200 4100 50  0001 C CNN
F 3 "~" H 20200 4100 50  0001 C CNN
	1    20200 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR037
U 1 1 6721611A
P 20000 4300
F 0 "#PWR037" H 20000 4150 50  0001 C CNN
F 1 "+5V" V 20000 4475 39  0000 C CNN
F 2 "" H 20000 4300 50  0001 C CNN
F 3 "" H 20000 4300 50  0001 C CNN
	1    20000 4300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR034
U 1 1 672169BB
P 20000 4100
F 0 "#PWR034" H 20000 3850 50  0001 C CNN
F 1 "GND" H 20005 3927 39  0001 C CNN
F 2 "" H 20000 4100 50  0001 C CNN
F 3 "" H 20000 4100 50  0001 C CNN
	1    20000 4100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR036
U 1 1 67216F17
P 20000 4200
F 0 "#PWR036" H 20000 3950 50  0001 C CNN
F 1 "GND" H 20005 4027 39  0001 C CNN
F 2 "" H 20000 4200 50  0001 C CNN
F 3 "" H 20000 4200 50  0001 C CNN
	1    20000 4200
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR032
U 1 1 672172BA
P 20000 4000
F 0 "#PWR032" H 20000 3850 50  0001 C CNN
F 1 "+12V" V 20000 4200 39  0000 C CNN
F 2 "" H 20000 4000 50  0001 C CNN
F 3 "" H 20000 4000 50  0001 C CNN
	1    20000 4000
	0    -1   -1   0   
$EndComp
$Comp
L my:AS6C4008 U11
U 1 1 6056FD84
P 5775 8725
F 0 "U11" H 5400 9800 51  0000 C CNN
F 1 "AS6C4008-55PCN" H 6175 9800 51  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_Socket" H 5775 8825 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C4008.pdf" H 5775 8825 50  0001 C CNN
F 4 ">=128K <=70ns SRAM" H 5775 7450 39  0000 C CNN "Desc"
	1    5775 8725
	1    0    0    -1  
$EndComp
Wire Wire Line
	21900 9800 22400 9800
$Comp
L Switch:SW_Push SW3
U 1 1 6509608E
P 20325 6475
F 0 "SW3" H 20100 6575 39  0000 L CNN
F 1 "SW_Push" H 20200 6400 39  0001 L CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 20325 6675 50  0001 C CNN
F 3 "" H 20325 6675 50  0001 C CNN
F 4 "CONFIG" H 20325 6400 50  0000 C CNN "Desc"
	1    20325 6475
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 1400 6600 1400
Wire Wire Line
	6100 2925 6600 2925
Entry Wire Line
	15700 5350 15800 5450
Entry Wire Line
	15700 5675 15800 5775
Entry Wire Line
	15700 6000 15800 6100
Text Label 15800 5450 0    39   ~ 0
FD_DISK0_0
Text Label 15800 5775 0    39   ~ 0
FD_DISK1_0
Text Label 17075 6100 2    39   ~ 0
FD_RDAT_0
Wire Wire Line
	22250 4550 22250 4125
Wire Wire Line
	22250 4125 21575 4125
Wire Wire Line
	22200 4550 22250 4550
Connection ~ 21575 4125
Connection ~ 22025 2975
$Comp
L Device:C C1
U 1 1 5DF10FF0
P 17000 1075
F 0 "C1" H 16900 1000 39  0000 C CNN
F 1 "100n" H 16900 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 17038 925 50  0001 C CNN
F 3 "~" H 17000 1075 50  0001 C CNN
	1    17000 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C5
U 1 1 6171D459
P 17975 1075
F 0 "C5" H 17875 1000 39  0000 C CNN
F 1 "100n" H 17875 1175 39  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 18013 925 50  0001 C CNN
F 3 "~" H 17975 1075 50  0001 C CNN
	1    17975 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C3
U 1 1 5E4A403B
P 17525 1075
F 0 "C3" H 17425 1000 39  0000 C CNN
F 1 "100n" H 17425 1175 39  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 17563 925 50  0001 C CNN
F 3 "~" H 17525 1075 50  0001 C CNN
	1    17525 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C13
U 1 1 6128C12A
P 19775 1075
F 0 "C13" H 19675 1000 39  0000 C CNN
F 1 "100n" H 19675 1175 39  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 19813 925 50  0001 C CNN
F 3 "~" H 19775 1075 50  0001 C CNN
	1    19775 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C14
U 1 1 613086C6
P 20050 1075
F 0 "C14" H 19950 1000 39  0000 C CNN
F 1 "100n" H 19950 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 20088 925 50  0001 C CNN
F 3 "~" H 20050 1075 50  0001 C CNN
	1    20050 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C6
U 1 1 5E51C918
P 18200 1075
F 0 "C6" H 18100 1000 39  0000 C CNN
F 1 "100n" H 18100 1175 39  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 18238 925 50  0001 C CNN
F 3 "~" H 18200 1075 50  0001 C CNN
	1    18200 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C7
U 1 1 5E51C92A
P 18425 1075
F 0 "C7" H 18325 1000 39  0000 C CNN
F 1 "100n" H 18325 1175 39  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 18463 925 50  0001 C CNN
F 3 "~" H 18425 1075 50  0001 C CNN
	1    18425 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C8
U 1 1 5E5A20DB
P 18650 1075
F 0 "C8" H 18550 1000 39  0000 C CNN
F 1 "100n" H 18550 1175 39  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 18688 925 50  0001 C CNN
F 3 "~" H 18650 1075 50  0001 C CNN
	1    18650 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C9
U 1 1 5E5A20ED
P 18875 1075
F 0 "C9" H 18775 1000 39  0000 C CNN
F 1 "100n" H 18775 1175 39  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 18913 925 50  0001 C CNN
F 3 "~" H 18875 1075 50  0001 C CNN
	1    18875 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C10
U 1 1 617AC36B
P 19100 1075
F 0 "C10" H 19000 1000 39  0000 C CNN
F 1 "100n" H 19000 1175 39  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 19138 925 50  0001 C CNN
F 3 "~" H 19100 1075 50  0001 C CNN
	1    19100 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C4
U 1 1 6169FCEF
P 17750 1075
F 0 "C4" H 17650 1000 39  0000 C CNN
F 1 "100n" H 17650 1175 39  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 17788 925 50  0001 C CNN
F 3 "~" H 17750 1075 50  0001 C CNN
	1    17750 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C12
U 1 1 61114791
P 19550 1075
F 0 "C12" H 19450 1000 39  0000 C CNN
F 1 "100n" H 19450 1175 39  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 19588 925 50  0001 C CNN
F 3 "~" H 19550 1075 50  0001 C CNN
	1    19550 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C11
U 1 1 61096021
P 19325 1075
F 0 "C11" H 19225 1000 39  0000 C CNN
F 1 "100n" H 19225 1175 39  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 19363 925 50  0001 C CNN
F 3 "~" H 19325 1075 50  0001 C CNN
	1    19325 1075
	-1   0    0    1   
$EndComp
Connection ~ 20050 925 
Wire Wire Line
	20050 925  20275 925 
Connection ~ 20050 1225
Wire Wire Line
	20050 1225 20275 1225
$Comp
L power:GND #PWR058
U 1 1 5EA07C77
P 21550 8275
F 0 "#PWR058" H 21550 8025 50  0001 C CNN
F 1 "GND" V 21550 8100 39  0000 C CNN
F 2 "" H 21550 8275 50  0001 C CNN
F 3 "" H 21550 8275 50  0001 C CNN
	1    21550 8275
	0    1    1    0   
$EndComp
Entry Wire Line
	21100 8375 21200 8475
Entry Wire Line
	21100 8275 21200 8375
Entry Wire Line
	22500 8275 22400 8375
Entry Wire Line
	22500 8375 22400 8475
Text Label 21200 8475 0    39   ~ 0
Blue
Text Label 21200 8375 0    39   ~ 0
Red
Text Label 22400 8375 2    39   ~ 0
Green
Text Label 22400 8475 2    39   ~ 0
Bright
Wire Wire Line
	21200 8475 21550 8475
Wire Wire Line
	22400 8375 22050 8375
Wire Wire Line
	22400 8475 22050 8475
Wire Wire Line
	21200 8375 21550 8375
Entry Wire Line
	22500 8475 22400 8575
Text Label 22400 8575 2    39   ~ 0
Hsync
Wire Wire Line
	22400 8575 22050 8575
Entry Wire Line
	21100 8575 21200 8675
Text Label 21200 8675 0    39   ~ 0
Vsync
Wire Wire Line
	21200 8675 21550 8675
Entry Wire Line
	22500 8175 22400 8275
Text Label 22400 8275 2    39   ~ 0
Bright
Wire Wire Line
	22400 8275 22050 8275
Entry Wire Line
	21100 8475 21200 8575
Text Label 21200 8575 0    39   ~ 0
Bright
Wire Wire Line
	21200 8575 21550 8575
Text Label 4475 6200 2    39   ~ 0
Green
Text Label 4475 6300 2    39   ~ 0
Bright
Text Label 4475 6500 2    39   ~ 0
Csync
Text Label 4475 6400 2    39   ~ 0
Blue
Wire Wire Line
	3850 6500 4475 6500
Wire Wire Line
	3850 6300 4475 6300
Wire Wire Line
	4475 6200 3850 6200
Wire Wire Line
	3850 6100 4475 6100
Wire Wire Line
	3850 6400 4475 6400
Text Label 4475 6100 2    39   ~ 0
Red
Wire Wire Line
	14225 9025 15075 9025
Wire Wire Line
	3850 6700 4475 6700
Text Label 4475 6700 2    39   ~ 0
Vsync
Wire Wire Line
	3850 6800 4475 6800
$Comp
L Device:C C39
U 1 1 5FC1E15F
P 14850 8700
F 0 "C39" H 14925 8625 39  0000 C CNN
F 1 "47n" H 14950 8775 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 14888 8550 50  0001 C CNN
F 3 "~" H 14850 8700 50  0001 C CNN
	1    14850 8700
	1    0    0    1   
$EndComp
Wire Wire Line
	15075 8500 15075 9025
Wire Wire Line
	14850 8500 15075 8500
Wire Wire Line
	20275 1950 20675 1950
$Comp
L power:+5V #PWR027
U 1 1 5DFDD8BA
P 20675 2875
F 0 "#PWR027" H 20675 2725 50  0001 C CNN
F 1 "+5V" H 20675 3025 39  0000 C CNN
F 2 "" H 20675 2875 50  0001 C CNN
F 3 "" H 20675 2875 50  0001 C CNN
	1    20675 2875
	1    0    0    -1  
$EndComp
Wire Wire Line
	20675 2875 20675 2975
$Comp
L power:+3.3V #PWR035
U 1 1 5E62748E
P 21425 4125
F 0 "#PWR035" H 21425 3975 50  0001 C CNN
F 1 "+3.3V" H 21440 4290 39  0000 C CNN
F 2 "" H 21425 4125 50  0001 C CNN
F 3 "" H 21425 4125 50  0001 C CNN
	1    21425 4125
	1    0    0    -1  
$EndComp
Connection ~ 21425 4125
$Comp
L power:+3.3V #PWR040
U 1 1 5E78889E
P 2150 4900
F 0 "#PWR040" H 2150 4750 50  0001 C CNN
F 1 "+3.3V" H 2165 5065 39  0000 C CNN
F 2 "" H 2150 4900 50  0001 C CNN
F 3 "" H 2150 4900 50  0001 C CNN
	1    2150 4900
	1    0    0    -1  
$EndComp
Connection ~ 2150 4900
Wire Wire Line
	17525 1225 17750 1225
Connection ~ 17750 1225
Wire Wire Line
	17750 1225 17975 1225
Connection ~ 17975 1225
Wire Wire Line
	17975 1225 18200 1225
Connection ~ 18200 1225
Wire Wire Line
	18200 1225 18425 1225
Connection ~ 18425 1225
Wire Wire Line
	18425 1225 18650 1225
Connection ~ 18650 1225
Wire Wire Line
	18650 1225 18875 1225
Connection ~ 18875 1225
Wire Wire Line
	18875 1225 19100 1225
Connection ~ 19100 1225
Wire Wire Line
	19100 1225 19325 1225
Connection ~ 19325 1225
Wire Wire Line
	19325 1225 19550 1225
Connection ~ 19550 1225
Wire Wire Line
	19550 1225 19775 1225
Wire Wire Line
	17525 925  17750 925 
Connection ~ 17750 925 
Wire Wire Line
	17750 925  17975 925 
Connection ~ 17975 925 
Wire Wire Line
	17975 925  18200 925 
Connection ~ 18200 925 
Wire Wire Line
	18200 925  18425 925 
Connection ~ 18425 925 
Wire Wire Line
	18425 925  18650 925 
Connection ~ 18650 925 
Wire Wire Line
	18650 925  18875 925 
Connection ~ 18875 925 
Wire Wire Line
	18875 925  19100 925 
Connection ~ 19100 925 
Wire Wire Line
	19100 925  19325 925 
Connection ~ 19325 925 
Wire Wire Line
	19325 925  19550 925 
Connection ~ 19550 925 
Wire Wire Line
	19550 925  19775 925 
$Comp
L power:GND #PWR011
U 1 1 5F3425B2
P 17300 1225
F 0 "#PWR011" H 17300 975 50  0001 C CNN
F 1 "GND" H 17305 1052 39  0001 C CNN
F 2 "" H 17300 1225 50  0001 C CNN
F 3 "" H 17300 1225 50  0001 C CNN
	1    17300 1225
	1    0    0    -1  
$EndComp
Connection ~ 17525 1225
$Comp
L power:+3.3V #PWR05
U 1 1 5F343586
P 17300 925
F 0 "#PWR05" H 17300 775 50  0001 C CNN
F 1 "+3.3V" H 17315 1090 39  0000 C CNN
F 2 "" H 17300 925 50  0001 C CNN
F 3 "" H 17300 925 50  0001 C CNN
	1    17300 925 
	1    0    0    -1  
$EndComp
Connection ~ 17525 925 
$Comp
L power:+12V #PWR078
U 1 1 5EA799A6
P 16450 8375
F 0 "#PWR078" H 16450 8225 50  0001 C CNN
F 1 "+12V" H 16425 8525 39  0000 C CNN
F 2 "" H 16450 8375 50  0001 C CNN
F 3 "" H 16450 8375 50  0001 C CNN
	1    16450 8375
	1    0    0    -1  
$EndComp
NoConn ~ 15975 8600
Wire Wire Line
	16275 8600 16450 8600
$Comp
L Device:Speaker LS1
U 1 1 61103EE0
P 16650 8500
F 0 "LS1" H 16820 8450 39  0000 L CNN
F 1 "Speaker" H 16820 8413 39  0001 L CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 16650 8300 50  0001 C CNN
F 3 "~" H 16640 8450 50  0001 C CNN
	1    16650 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	16450 8500 16450 8375
Wire Bus Line
	14100 8175 17025 8175
Text Label 16925 9750 2    39   ~ 0
SND_MONO
Text Label 16925 10625 2    39   ~ 0
SND_R
Entry Wire Line
	16925 10625 17025 10725
$Comp
L Device:R_POT RV1
U 1 1 5E3A9CD2
P 16125 8600
F 0 "RV1" V 16050 8650 39  0000 R CNN
F 1 "47k" V 16125 8650 39  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Runtron_RM-063_Horizontal" H 16125 8600 50  0001 C CNN
F 3 "~" H 16125 8600 50  0001 C CNN
	1    16125 8600
	0    1    1    0   
$EndComp
Wire Wire Line
	14475 10175 14225 10175
$Comp
L Device:R R76
U 1 1 5DFA281C
P 14625 10175
F 0 "R76" V 14650 10275 39  0000 L CNN
F 1 "2k" V 14625 10150 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 14555 10175 50  0001 C CNN
F 3 "~" H 14625 10175 50  0001 C CNN
	1    14625 10175
	0    1    -1   0   
$EndComp
Wire Wire Line
	14475 10275 14175 10275
Wire Wire Line
	14900 10175 14900 10275
Wire Wire Line
	14775 10175 14900 10175
$Comp
L power:+5V #PWR0107
U 1 1 66CAD871
P 13325 14800
F 0 "#PWR0107" H 13325 14650 50  0001 C CNN
F 1 "+5V" H 13225 14875 39  0000 C CNN
F 2 "" H 13325 14800 50  0001 C CNN
F 3 "" H 13325 14800 50  0001 C CNN
	1    13325 14800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 66C3F104
P 13325 15500
F 0 "#PWR0109" H 13325 15250 50  0001 C CNN
F 1 "GND" H 13330 15327 39  0001 C CNN
F 2 "" H 13325 15500 50  0001 C CNN
F 3 "" H 13325 15500 50  0001 C CNN
	1    13325 15500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R91
U 1 1 66769286
P 12700 15050
F 0 "R91" V 12775 15000 39  0000 L CNN
F 1 "2.2k" V 12700 14975 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12630 15050 50  0001 C CNN
F 3 "~" H 12700 15050 50  0001 C CNN
	1    12700 15050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R92
U 1 1 6676928C
P 12700 15250
F 0 "R92" V 12775 15200 39  0000 L CNN
F 1 "8.2k" V 12700 15175 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12630 15250 50  0001 C CNN
F 3 "~" H 12700 15250 50  0001 C CNN
	1    12700 15250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R85
U 1 1 65D45F83
P 12700 14450
F 0 "R85" V 12625 14400 39  0000 L CNN
F 1 "8.2k" V 12700 14375 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12630 14450 50  0001 C CNN
F 3 "~" H 12700 14450 50  0001 C CNN
	1    12700 14450
	0    -1   1    0   
$EndComp
Wire Bus Line
	15750 11875 12075 11875
Wire Wire Line
	15075 14475 15650 14475
Wire Wire Line
	15075 12450 15650 12450
Wire Wire Line
	15075 12800 15650 12800
Wire Wire Line
	15075 13150 15650 13150
Wire Wire Line
	15225 13725 15650 13725
Wire Wire Line
	14400 13675 14400 13525
Wire Wire Line
	12175 13675 14400 13675
Wire Wire Line
	12175 15250 12550 15250
Wire Wire Line
	12175 15050 12550 15050
Wire Wire Line
	12175 14650 12550 14650
Wire Wire Line
	12175 14450 12550 14450
Wire Wire Line
	12175 14250 12550 14250
Wire Wire Line
	12175 14050 12550 14050
Wire Wire Line
	12175 13850 12550 13850
Wire Wire Line
	12175 13500 12900 13500
Wire Wire Line
	12175 12950 12550 12950
Wire Wire Line
	12175 12600 12550 12600
Wire Wire Line
	12175 12250 12550 12250
Wire Wire Line
	12850 14650 13575 14650
Wire Wire Line
	13575 14250 13700 14250
Connection ~ 13575 14250
Wire Wire Line
	13575 14650 13575 14250
Wire Wire Line
	13325 15150 13125 15150
Wire Wire Line
	13325 15150 13325 15200
Connection ~ 13325 15150
Wire Wire Line
	14200 14475 14550 14475
Wire Wire Line
	14200 14475 14200 14450
Wire Wire Line
	15075 14650 15075 14475
Wire Wire Line
	13900 14250 13700 14250
Wire Wire Line
	15075 14475 14850 14475
Connection ~ 15075 14475
Wire Wire Line
	13125 15050 13125 15150
Wire Wire Line
	12850 15050 13125 15050
Wire Wire Line
	15075 15150 15075 14950
Wire Wire Line
	14200 15150 14200 15100
Connection ~ 14200 15150
Wire Wire Line
	14200 15150 15075 15150
Wire Wire Line
	14200 15200 14200 15150
Wire Wire Line
	13900 14900 13700 14900
Wire Wire Line
	13700 15150 13325 15150
Connection ~ 13700 15150
Wire Wire Line
	13700 15200 13700 15150
Wire Wire Line
	13325 15100 13325 15150
Wire Wire Line
	13125 15150 13125 15250
Connection ~ 13125 15150
Wire Wire Line
	13700 14900 13700 15150
Wire Wire Line
	12850 15250 13125 15250
Wire Wire Line
	13700 14250 13700 14325
Connection ~ 13700 14250
Wire Wire Line
	13500 14250 13575 14250
Wire Wire Line
	13700 14175 13700 14250
Wire Wire Line
	13125 14050 13125 14250
Connection ~ 13125 14050
Wire Wire Line
	12850 14050 13125 14050
Wire Wire Line
	13125 14250 13125 14450
Connection ~ 13125 14250
Wire Wire Line
	12850 14250 13125 14250
Wire Wire Line
	12850 14450 13125 14450
Wire Wire Line
	13125 14250 13200 14250
Wire Wire Line
	13125 13850 13125 14050
Wire Wire Line
	12850 13850 13125 13850
Wire Wire Line
	14000 13150 14775 13150
Wire Wire Line
	14600 12450 14775 12450
Wire Wire Line
	14300 12800 14775 12800
Wire Wire Line
	13650 12250 14300 12250
Connection ~ 13650 12250
Wire Wire Line
	13650 13050 13650 12250
Wire Wire Line
	13500 12250 13650 12250
Connection ~ 13500 12250
Wire Wire Line
	13500 12250 13500 13050
Wire Wire Line
	13350 12600 13200 12600
Connection ~ 13350 12600
Wire Wire Line
	13350 13050 13350 12600
Wire Wire Line
	13200 12600 12850 12600
Connection ~ 13200 12600
Wire Wire Line
	13200 13050 13200 12600
Wire Wire Line
	13050 12950 13700 12950
Connection ~ 13050 12950
Wire Wire Line
	13050 13050 13050 12950
Wire Wire Line
	12900 12950 13050 12950
Connection ~ 12900 12950
Wire Wire Line
	12900 13050 12900 12950
Connection ~ 13200 13500
Wire Wire Line
	13500 13500 13500 13350
Wire Wire Line
	13200 13500 13500 13500
Connection ~ 12900 13500
Wire Wire Line
	13200 13500 13200 13350
Wire Wire Line
	12900 13500 13200 13500
Wire Wire Line
	12900 13350 12900 13500
Wire Wire Line
	12850 12250 13500 12250
Wire Wire Line
	14000 12600 13350 12600
Wire Wire Line
	12850 12950 12900 12950
Connection ~ 14700 13725
Wire Wire Line
	14700 13725 14925 13725
$Comp
L power:+5V #PWR075
U 1 1 5E676B0E
P 14600 12050
F 0 "#PWR075" H 14600 11900 50  0001 C CNN
F 1 "+5V" H 14500 12125 39  0000 C CNN
F 2 "" H 14600 12050 50  0001 C CNN
F 3 "" H 14600 12050 50  0001 C CNN
	1    14600 12050
	1    0    0    -1  
$EndComp
Text Label 15650 14475 2    39   ~ 0
VID_COMP
Text Label 15650 13725 2    39   ~ 0
VID_SYNC
Text Label 15650 13150 2    39   ~ 0
VID_G
Text Label 15650 12800 2    39   ~ 0
VID_R
Text Label 15650 12450 2    39   ~ 0
VID_B
Entry Wire Line
	15650 14475 15750 14575
Entry Wire Line
	15650 13725 15750 13825
Entry Wire Line
	15650 13150 15750 13250
Entry Wire Line
	15650 12800 15750 12900
Entry Wire Line
	15650 12450 15750 12550
Entry Wire Line
	12075 13575 12175 13675
Text Label 12175 13675 0    39   ~ 0
Csync
Text Label 12175 15250 0    39   ~ 0
CHROMA0
Text Label 12175 15050 0    39   ~ 0
CHROMA1
Text Label 12175 14650 0    39   ~ 0
Csync
Text Label 12175 14450 0    39   ~ 0
Bright
Text Label 12175 14250 0    39   ~ 0
Green
Text Label 12175 14050 0    39   ~ 0
Red
Text Label 12175 12600 0    39   ~ 0
Red
Text Label 12175 13850 0    39   ~ 0
Blue
Text Label 12175 13500 0    39   ~ 0
Bright
Text Label 12175 12950 0    39   ~ 0
Green
Text Label 12175 12250 0    39   ~ 0
Blue
Entry Wire Line
	12075 15150 12175 15250
Entry Wire Line
	12075 14950 12175 15050
Entry Wire Line
	12075 14550 12175 14650
Entry Wire Line
	12075 14350 12175 14450
Entry Wire Line
	12075 14150 12175 14250
Entry Wire Line
	12075 13950 12175 14050
Entry Wire Line
	12075 13750 12175 13850
Entry Wire Line
	12075 13400 12175 13500
Entry Wire Line
	12075 12850 12175 12950
Entry Wire Line
	12075 12500 12175 12600
Entry Wire Line
	12075 12150 12175 12250
$Comp
L Device:R R86
U 1 1 5F1E22D2
P 13700 14475
F 0 "R86" V 13775 14425 39  0000 L CNN
F 1 "20k" V 13700 14425 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 13630 14475 50  0001 C CNN
F 3 "~" H 13700 14475 50  0001 C CNN
	1    13700 14475
	1    0    0    1   
$EndComp
$Comp
L Device:R R75
U 1 1 6616ACC8
P 13700 14025
F 0 "R75" V 13625 13975 39  0000 L CNN
F 1 "20k" V 13700 13975 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 13630 14025 50  0001 C CNN
F 3 "~" H 13700 14025 50  0001 C CNN
	1    13700 14025
	-1   0    0    1   
$EndComp
$Comp
L Device:R R82
U 1 1 65E1C7FE
P 13350 14250
F 0 "R82" V 13425 14200 39  0000 L CNN
F 1 "10k" V 13350 14200 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 13280 14250 50  0001 C CNN
F 3 "~" H 13350 14250 50  0001 C CNN
	1    13350 14250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R70
U 1 1 5E5ECAB6
P 15075 13725
F 0 "R70" V 15150 13675 39  0000 L CNN
F 1 "270" V 15075 13675 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 15005 13725 50  0001 C CNN
F 3 "~" H 15075 13725 50  0001 C CNN
	1    15075 13725
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R57
U 1 1 647E092F
P 12700 12950
F 0 "R57" V 12625 12875 39  0000 L CNN
F 1 "3.6k" V 12700 12875 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12630 12950 50  0001 C CNN
F 3 "~" H 12700 12950 50  0001 C CNN
	1    12700 12950
	0    -1   1    0   
$EndComp
$Comp
L Device:R R51
U 1 1 647E1926
P 12700 12250
F 0 "R51" V 12625 12175 39  0000 L CNN
F 1 "3.6k" V 12700 12175 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12630 12250 50  0001 C CNN
F 3 "~" H 12700 12250 50  0001 C CNN
	1    12700 12250
	0    -1   1    0   
$EndComp
$Comp
L Device:R R87
U 1 1 5F3E5B7C
P 14700 14475
F 0 "R87" V 14775 14425 39  0000 L CNN
F 1 "68" V 14700 14425 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 14630 14475 50  0001 C CNN
F 3 "~" H 14700 14475 50  0001 C CNN
	1    14700 14475
	0    -1   -1   0   
$EndComp
$Comp
L Device:Q_NPN_BEC Q7
U 1 1 5EFE6ED2
P 14100 14250
F 0 "Q7" H 14300 14300 39  0000 L CNN
F 1 "BC547B" H 14300 14200 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 14300 14350 50  0001 C CNN
F 3 "~" H 14100 14250 50  0001 C CNN
	1    14100 14250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C43
U 1 1 6676926E
P 15075 14800
F 0 "C43" H 15225 14875 39  0000 R CNN
F 1 "470p" H 15250 14725 39  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 15113 14650 50  0001 C CNN
F 3 "~" H 15075 14800 50  0001 C CNN
	1    15075 14800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R93
U 1 1 66769292
P 13325 15350
F 0 "R93" V 13250 15300 39  0000 L CNN
F 1 "1.2k" V 13325 15275 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 13255 15350 50  0001 C CNN
F 3 "~" H 13325 15350 50  0001 C CNN
	1    13325 15350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R90
U 1 1 66769280
P 13325 14950
F 0 "R90" V 13400 14900 39  0000 L CNN
F 1 "1.2k" V 13325 14875 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 13255 14950 50  0001 C CNN
F 3 "~" H 13325 14950 50  0001 C CNN
	1    13325 14950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R94
U 1 1 66769274
P 14200 15350
F 0 "R94" V 14125 15300 39  0000 L CNN
F 1 "82" V 14200 15300 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 14130 15350 50  0001 C CNN
F 3 "~" H 14200 15350 50  0001 C CNN
	1    14200 15350
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BEC Q8
U 1 1 6676927A
P 14100 14900
F 0 "Q8" H 14300 14925 39  0000 L CNN
F 1 "BC547B" H 14291 14855 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 14300 15000 50  0001 C CNN
F 3 "~" H 14100 14900 50  0001 C CNN
	1    14100 14900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C44
U 1 1 6676929F
P 13700 15350
F 0 "C44" H 13850 15425 39  0000 R CNN
F 1 "100p" H 13875 15275 39  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 13738 15200 50  0001 C CNN
F 3 "~" H 13700 15350 50  0001 C CNN
	1    13700 15350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 667692A9
P 13700 15500
F 0 "#PWR0110" H 13700 15250 50  0001 C CNN
F 1 "GND" H 13705 15327 39  0001 C CNN
F 2 "" H 13700 15500 50  0001 C CNN
F 3 "" H 13700 15500 50  0001 C CNN
	1    13700 15500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 667692AF
P 14200 14700
F 0 "#PWR0105" H 14200 14550 50  0001 C CNN
F 1 "+5V" H 14100 14775 39  0000 C CNN
F 2 "" H 14200 14700 50  0001 C CNN
F 3 "" H 14200 14700 50  0001 C CNN
	1    14200 14700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR097
U 1 1 662B1C85
P 13700 13875
F 0 "#PWR097" H 13700 13725 50  0001 C CNN
F 1 "+5V" H 13600 13950 39  0000 C CNN
F 2 "" H 13700 13875 50  0001 C CNN
F 3 "" H 13700 13875 50  0001 C CNN
	1    13700 13875
	1    0    0    -1  
$EndComp
$Comp
L Device:R R54
U 1 1 647E16A1
P 12700 12600
F 0 "R54" V 12625 12525 39  0000 L CNN
F 1 "3.6k" V 12700 12525 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12630 12600 50  0001 C CNN
F 3 "~" H 12700 12600 50  0001 C CNN
	1    12700 12600
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR089
U 1 1 64EC9795
P 13650 13350
F 0 "#PWR089" H 13650 13100 50  0001 C CNN
F 1 "GND" H 13655 13177 39  0001 C CNN
F 2 "" H 13650 13350 50  0001 C CNN
F 3 "" H 13650 13350 50  0001 C CNN
	1    13650 13350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR088
U 1 1 64EC95B3
P 13350 13350
F 0 "#PWR088" H 13350 13100 50  0001 C CNN
F 1 "GND" H 13355 13177 39  0001 C CNN
F 2 "" H 13350 13350 50  0001 C CNN
F 3 "" H 13350 13350 50  0001 C CNN
	1    13350 13350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR087
U 1 1 64EC8796
P 13050 13350
F 0 "#PWR087" H 13050 13100 50  0001 C CNN
F 1 "GND" H 13055 13177 39  0001 C CNN
F 2 "" H 13050 13350 50  0001 C CNN
F 3 "" H 13050 13350 50  0001 C CNN
	1    13050 13350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R64
U 1 1 64DF7D40
P 13650 13200
F 0 "R64" V 13725 13125 39  0000 L CNN
F 1 "4.7k" V 13650 13125 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 13580 13200 50  0001 C CNN
F 3 "~" H 13650 13200 50  0001 C CNN
	1    13650 13200
	1    0    0    1   
$EndComp
$Comp
L Device:R R63
U 1 1 64DF7D3A
P 13500 13200
F 0 "R63" V 13575 13125 39  0000 L CNN
F 1 "12k" V 13500 13125 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 13430 13200 50  0001 C CNN
F 3 "~" H 13500 13200 50  0001 C CNN
	1    13500 13200
	1    0    0    1   
$EndComp
$Comp
L Device:R R62
U 1 1 64D92758
P 13350 13200
F 0 "R62" V 13425 13125 39  0000 L CNN
F 1 "4.7k" V 13350 13125 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 13280 13200 50  0001 C CNN
F 3 "~" H 13350 13200 50  0001 C CNN
	1    13350 13200
	1    0    0    1   
$EndComp
$Comp
L Device:R R61
U 1 1 64D92752
P 13200 13200
F 0 "R61" V 13275 13125 39  0000 L CNN
F 1 "12k" V 13200 13125 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 13130 13200 50  0001 C CNN
F 3 "~" H 13200 13200 50  0001 C CNN
	1    13200 13200
	1    0    0    1   
$EndComp
$Comp
L Device:R R60
U 1 1 64D29B0A
P 13050 13200
F 0 "R60" V 13125 13125 39  0000 L CNN
F 1 "4.7k" V 13050 13125 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12980 13200 50  0001 C CNN
F 3 "~" H 13050 13200 50  0001 C CNN
	1    13050 13200
	1    0    0    1   
$EndComp
$Comp
L Device:R R59
U 1 1 64D28E18
P 12900 13200
F 0 "R59" V 12975 13125 39  0000 L CNN
F 1 "12k" V 12900 13125 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12830 13200 50  0001 C CNN
F 3 "~" H 12900 13200 50  0001 C CNN
	1    12900 13200
	1    0    0    1   
$EndComp
$Comp
L Device:R R56
U 1 1 5E67809A
P 14925 12800
F 0 "R56" V 15000 12750 39  0000 L CNN
F 1 "68" V 14925 12775 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 14855 12800 50  0001 C CNN
F 3 "~" H 14925 12800 50  0001 C CNN
	1    14925 12800
	0    -1   -1   0   
$EndComp
Text Notes 12100 11850 0    79   ~ 0
ANALOG VIDEO OUTPUT
$Comp
L Device:D_Schottky D11
U 1 1 5F22C337
P 12700 14650
F 0 "D11" H 12700 14750 39  0000 C CNN
F 1 "BAT85" H 12700 14775 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 12700 14650 50  0001 C CNN
F 3 "~" H 12700 14650 50  0001 C CNN
	1    12700 14650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5F1E24F0
P 13700 14625
F 0 "#PWR0102" H 13700 14375 50  0001 C CNN
F 1 "GND" H 13705 14452 39  0001 C CNN
F 2 "" H 13700 14625 50  0001 C CNN
F 3 "" H 13700 14625 50  0001 C CNN
	1    13700 14625
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR099
U 1 1 5F0BF19A
P 14200 14050
F 0 "#PWR099" H 14200 13900 50  0001 C CNN
F 1 "+5V" H 14100 14125 39  0000 C CNN
F 2 "" H 14200 14050 50  0001 C CNN
F 3 "" H 14200 14050 50  0001 C CNN
	1    14200 14050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R73
U 1 1 5EFE7375
P 12700 13850
F 0 "R73" V 12625 13800 39  0000 L CNN
F 1 "10k" V 12700 13775 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12630 13850 50  0001 C CNN
F 3 "~" H 12700 13850 50  0001 C CNN
	1    12700 13850
	0    -1   1    0   
$EndComp
$Comp
L Device:R R77
U 1 1 5EFE736E
P 12700 14050
F 0 "R77" V 12625 14000 39  0000 L CNN
F 1 "4.7k" V 12700 13975 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12630 14050 50  0001 C CNN
F 3 "~" H 12700 14050 50  0001 C CNN
	1    12700 14050
	0    -1   1    0   
$EndComp
$Comp
L Device:R R81
U 1 1 5EFE7367
P 12700 14250
F 0 "R81" V 12625 14200 39  0000 L CNN
F 1 "2.4k" V 12700 14175 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12630 14250 50  0001 C CNN
F 3 "~" H 12700 14250 50  0001 C CNN
	1    12700 14250
	0    -1   1    0   
$EndComp
$Comp
L Device:R R53
U 1 1 5E67848D
P 14925 12450
F 0 "R53" V 15000 12400 39  0000 L CNN
F 1 "68" V 14925 12425 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 14855 12450 50  0001 C CNN
F 3 "~" H 14925 12450 50  0001 C CNN
	1    14925 12450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R58
U 1 1 5E677DB3
P 14925 13150
F 0 "R58" V 15000 13100 39  0000 L CNN
F 1 "68" V 14925 13125 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 14855 13150 50  0001 C CNN
F 3 "~" H 14925 13150 50  0001 C CNN
	1    14925 13150
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR082
U 1 1 5E677545
P 14000 12750
F 0 "#PWR082" H 14000 12600 50  0001 C CNN
F 1 "+5V" H 13900 12825 39  0000 C CNN
F 2 "" H 14000 12750 50  0001 C CNN
F 3 "" H 14000 12750 50  0001 C CNN
	1    14000 12750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR080
U 1 1 5E677143
P 14300 12400
F 0 "#PWR080" H 14300 12250 50  0001 C CNN
F 1 "+5V" H 14200 12475 39  0000 C CNN
F 2 "" H 14300 12400 50  0001 C CNN
F 3 "" H 14300 12400 50  0001 C CNN
	1    14300 12400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR098
U 1 1 5E5EC6F5
P 14700 14025
F 0 "#PWR098" H 14700 13775 50  0001 C CNN
F 1 "GND" H 14705 13852 39  0001 C CNN
F 2 "" H 14700 14025 50  0001 C CNN
F 3 "" H 14700 14025 50  0001 C CNN
	1    14700 14025
	1    0    0    -1  
$EndComp
$Comp
L Device:R R74
U 1 1 5E5E7504
P 14700 13875
F 0 "R74" V 14625 13800 39  0000 L CNN
F 1 "270" V 14700 13800 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 14630 13875 50  0001 C CNN
F 3 "~" H 14700 13875 50  0001 C CNN
	1    14700 13875
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR085
U 1 1 5E5A2BF7
P 14700 13325
F 0 "#PWR085" H 14700 13175 50  0001 C CNN
F 1 "+5V" H 14600 13400 39  0000 C CNN
F 2 "" H 14700 13325 50  0001 C CNN
F 3 "" H 14700 13325 50  0001 C CNN
	1    14700 13325
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BEC Q5
U 1 1 5E55E755
P 13900 12950
F 0 "Q5" H 14100 12975 39  0000 L CNN
F 1 "BC547B" H 14100 12900 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 14100 13050 50  0001 C CNN
F 3 "~" H 13900 12950 50  0001 C CNN
	1    13900 12950
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BEC Q3
U 1 1 5E55E5B5
P 14200 12600
F 0 "Q3" H 14400 12625 39  0000 L CNN
F 1 "BC547B" H 14391 12555 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 14400 12700 50  0001 C CNN
F 3 "~" H 14200 12600 50  0001 C CNN
	1    14200 12600
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BEC Q2
U 1 1 5E55DFB3
P 14500 12250
F 0 "Q2" H 14700 12275 39  0000 L CNN
F 1 "BC547B" H 14691 12205 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 14700 12350 50  0001 C CNN
F 3 "~" H 14500 12250 50  0001 C CNN
	1    14500 12250
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BEC Q6
U 1 1 5E55D7C7
P 14600 13525
F 0 "Q6" H 14800 13550 39  0000 L CNN
F 1 "BC547B" H 14791 13480 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 14800 13625 50  0001 C CNN
F 3 "~" H 14600 13525 50  0001 C CNN
	1    14600 13525
	1    0    0    -1  
$EndComp
Wire Wire Line
	15600 8800 15600 9075
Wire Wire Line
	15675 8800 15600 8800
Wire Wire Line
	16125 8800 16125 8875
Wire Wire Line
	16125 8750 16125 8800
Connection ~ 16125 8800
Wire Wire Line
	15975 8800 16125 8800
Wire Wire Line
	15600 9075 15825 9075
Connection ~ 15600 9075
$Comp
L power:GND #PWR091
U 1 1 5E71126C
P 16125 9575
F 0 "#PWR091" H 16125 9325 50  0001 C CNN
F 1 "GND" H 16130 9402 39  0001 C CNN
F 2 "" H 16125 9575 50  0001 C CNN
F 3 "" H 16125 9575 50  0001 C CNN
	1    16125 9575
	1    0    0    -1  
$EndComp
$Comp
L Device:R R65
U 1 1 5AADE568
P 16125 9425
F 0 "R65" V 16050 9350 39  0000 L CNN
F 1 "1" V 16125 9400 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 16055 9425 50  0001 C CNN
F 3 "~" H 16125 9425 50  0001 C CNN
	1    16125 9425
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BEC Q4
U 1 1 5F90F4B0
P 16025 9075
F 0 "Q4" H 16225 9100 39  0000 L CNN
F 1 "BC547C" H 16225 9025 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 16225 9175 50  0001 C CNN
F 3 "~" H 16025 9075 50  0001 C CNN
	1    16025 9075
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C32
U 1 1 5E3596EF
P 19900 2250
F 0 "C32" H 19950 2350 39  0000 L CNN
F 1 "470u" H 19925 2150 39  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P3.80mm" H 19938 2100 50  0001 C CNN
F 3 "~" H 19900 2250 50  0001 C CNN
	1    19900 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C35
U 1 1 907E426E
P 22025 3125
F 0 "C35" H 22075 3225 39  0000 L CNN
F 1 "100u" H 22050 3025 39  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 22063 2975 50  0001 C CNN
F 3 "~" H 22025 3125 50  0001 C CNN
	1    22025 3125
	1    0    0    -1  
$EndComp
$Comp
L Device:R R55
U 1 1 5AAF5D7A
P 15825 8800
F 0 "R55" V 15750 8750 39  0000 L CNN
F 1 "47k" V 15825 8750 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 15755 8800 50  0001 C CNN
F 3 "~" H 15825 8800 50  0001 C CNN
	1    15825 8800
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x10 J14
U 1 1 5F137689
P 12900 9425
F 0 "J14" H 12825 9925 39  0000 L CNN
F 1 "Conn_01x10" H 12980 9326 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 12900 9425 50  0001 C CNN
F 3 "~" H 12900 9425 50  0001 C CNN
F 4 "AY_IOA" H 12800 8800 39  0000 L CNN "Desc"
	1    12900 9425
	1    0    0    -1  
$EndComp
Wire Wire Line
	12450 9125 12700 9125
Wire Wire Line
	12700 9225 12450 9225
Wire Wire Line
	12450 9325 12700 9325
Wire Wire Line
	12700 9425 12450 9425
Wire Wire Line
	12450 9525 12700 9525
Wire Wire Line
	12700 9625 12450 9625
Wire Wire Line
	12450 9725 12700 9725
Wire Wire Line
	12700 9825 12450 9825
$Comp
L power:+5V #PWR086
U 1 1 5ABB2AE9
P 11250 9475
F 0 "#PWR086" H 11250 9325 50  0001 C CNN
F 1 "+5V" V 11250 9650 39  0000 C CNN
F 2 "" H 11250 9475 50  0001 C CNN
F 3 "" H 11250 9475 50  0001 C CNN
	1    11250 9475
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR096
U 1 1 5FAA76A3
P 12700 9925
F 0 "#PWR096" H 12700 9775 50  0001 C CNN
F 1 "+5V" V 12700 10100 39  0000 C CNN
F 2 "" H 12700 9925 50  0001 C CNN
F 3 "" H 12700 9925 50  0001 C CNN
	1    12700 9925
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR083
U 1 1 5FAA7A42
P 12700 9025
F 0 "#PWR083" H 12700 8775 50  0001 C CNN
F 1 "GND" H 12705 8852 39  0001 C CNN
F 2 "" H 12700 9025 50  0001 C CNN
F 3 "" H 12700 9025 50  0001 C CNN
	1    12700 9025
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR095
U 1 1 5FAA7E7C
P 11250 9925
F 0 "#PWR095" H 11250 9775 50  0001 C CNN
F 1 "+5V" V 11250 10100 39  0000 C CNN
F 2 "" H 11250 9925 50  0001 C CNN
F 3 "" H 11250 9925 50  0001 C CNN
	1    11250 9925
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C38
U 1 1 5FD74EC4
P 19900 5475
F 0 "C38" H 19800 5400 39  0000 C CNN
F 1 "100n" H 19800 5575 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 19938 5325 50  0001 C CNN
F 3 "~" H 19900 5475 50  0001 C CNN
	1    19900 5475
	-1   0    0    1   
$EndComp
$Comp
L Device:R R22
U 1 1 5FD76140
P 19675 5475
F 0 "R22" V 19750 5425 39  0000 L CNN
F 1 "100k" V 19675 5400 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 19605 5475 50  0001 C CNN
F 3 "~" H 19675 5475 50  0001 C CNN
	1    19675 5475
	-1   0    0    -1  
$EndComp
Wire Wire Line
	20325 5675 19900 5675
Connection ~ 20325 5675
Wire Wire Line
	19675 5275 19900 5275
Wire Wire Line
	19900 5675 19900 5625
Wire Wire Line
	19900 5675 19675 5675
Wire Wire Line
	19675 5675 19675 5625
Connection ~ 19900 5675
Wire Wire Line
	19675 5325 19675 5275
Wire Wire Line
	19900 5325 19900 5275
Connection ~ 19900 5275
Wire Wire Line
	19900 5275 19975 5275
Text Label 3400 2700 0    39   ~ 0
~INT
Wire Wire Line
	20675 3275 21325 3275
Wire Wire Line
	21325 3275 22025 3275
Connection ~ 21325 3275
$Comp
L power:GND #PWR022
U 1 1 5F2120B3
P 21325 2250
F 0 "#PWR022" H 21325 2000 50  0001 C CNN
F 1 "GND" H 21330 2077 39  0001 C CNN
F 2 "" H 21325 2250 50  0001 C CNN
F 3 "" H 21325 2250 50  0001 C CNN
	1    21325 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 5B6C7C72
P 22025 1800
F 0 "#PWR014" H 22025 1650 50  0001 C CNN
F 1 "+5V" H 22025 1950 39  0000 C CNN
F 2 "" H 22025 1800 50  0001 C CNN
F 3 "" H 22025 1800 50  0001 C CNN
	1    22025 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	22025 1800 22025 1950
Connection ~ 22025 1950
$Comp
L Device:CP C30
U 1 1 64688EBA
P 22025 2100
F 0 "C30" H 22075 2200 39  0000 L CNN
F 1 "470u" H 22050 2000 39  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P3.80mm" H 22063 1950 50  0001 C CNN
F 3 "~" H 22025 2100 50  0001 C CNN
	1    22025 2100
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U6
U 1 1 5E2CEEDB
P 21325 1950
F 0 "U6" H 21325 2168 39  0000 C CNN
F 1 "L7805" H 21325 2093 39  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 21350 1800 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 21325 1900 50  0001 C CNN
	1    21325 1950
	1    0    0    -1  
$EndComp
Connection ~ 21325 2250
Wire Wire Line
	21325 2250 22025 2250
Wire Wire Line
	20675 2250 21325 2250
Wire Wire Line
	20675 1950 21025 1950
$Comp
L Device:Jumper JP2
U 1 1 5EDDBD8E
P 5425 5925
F 0 "JP2" H 5425 5850 39  0000 C CNN
F 1 "Jumper" H 5425 6098 39  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5425 5925 50  0001 C CNN
F 3 "~" H 5425 5925 50  0001 C CNN
	1    5425 5925
	0    -1   1    0   
$EndComp
$Comp
L Device:Jumper JP1
U 1 1 5EDDC4C5
P 5075 5925
F 0 "JP1" H 5075 5850 39  0000 C CNN
F 1 "Jumper" H 5075 6098 39  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5075 5925 50  0001 C CNN
F 3 "~" H 5075 5925 50  0001 C CNN
	1    5075 5925
	0    -1   1    0   
$EndComp
$Comp
L Device:R R25
U 1 1 5EF12D51
P 5075 6375
F 0 "R25" V 5150 6325 39  0000 L CNN
F 1 "10k" V 5075 6325 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5005 6375 50  0001 C CNN
F 3 "~" H 5075 6375 50  0001 C CNN
	1    5075 6375
	-1   0    0    1   
$EndComp
Wire Wire Line
	5575 6225 5425 6225
Wire Wire Line
	5225 6225 5075 6225
Wire Wire Line
	5225 6225 5225 6875
Connection ~ 5075 6225
$Comp
L Device:R R27
U 1 1 5F88DEA6
P 7650 6575
F 0 "R27" V 7575 6525 39  0000 L CNN
F 1 "10k" V 7650 6525 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7580 6575 50  0001 C CNN
F 3 "~" H 7650 6575 50  0001 C CNN
	1    7650 6575
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR051
U 1 1 5F88EE36
P 7800 6575
F 0 "#PWR051" H 7800 6425 50  0001 C CNN
F 1 "+5V" V 7800 6750 39  0000 C CNN
F 2 "" H 7800 6575 50  0001 C CNN
F 3 "" H 7800 6575 50  0001 C CNN
	1    7800 6575
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 6325 7300 6575
Wire Wire Line
	7300 6575 7500 6575
Connection ~ 7300 6325
$Comp
L power:+5V #PWR043
U 1 1 5FB01130
P 5075 5625
F 0 "#PWR043" H 5075 5475 50  0001 C CNN
F 1 "+5V" H 5075 5775 39  0000 C CNN
F 2 "" H 5075 5625 50  0001 C CNN
F 3 "" H 5075 5625 50  0001 C CNN
	1    5075 5625
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR044
U 1 1 5FB0167E
P 5425 5625
F 0 "#PWR044" H 5425 5475 50  0001 C CNN
F 1 "+5V" H 5425 5775 39  0000 C CNN
F 2 "" H 5425 5625 50  0001 C CNN
F 3 "" H 5425 5625 50  0001 C CNN
	1    5425 5625
	1    0    0    -1  
$EndComp
Text Label 14300 6425 0    39   ~ 0
FD_TR00
$Comp
L Device:R R26
U 1 1 5EF18024
P 5425 6375
F 0 "R26" V 5500 6325 39  0000 L CNN
F 1 "10k" V 5425 6325 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5355 6375 50  0001 C CNN
F 3 "~" H 5425 6375 50  0001 C CNN
	1    5425 6375
	-1   0    0    1   
$EndComp
Connection ~ 5425 6225
Wire Wire Line
	5575 6225 5575 6775
$Comp
L power:+12V #PWR04
U 1 1 5DF4DF93
P 17000 925
F 0 "#PWR04" H 17000 775 50  0001 C CNN
F 1 "+12V" H 16975 1075 39  0000 C CNN
F 2 "" H 17000 925 50  0001 C CNN
F 3 "" H 17000 925 50  0001 C CNN
	1    17000 925 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 7725 7550 7725
Wire Wire Line
	7850 7725 8150 7725
$Comp
L Device:R R29
U 1 1 5F0614A9
P 7700 7725
F 0 "R29" V 7650 7500 39  0000 L CNN
F 1 "1k" V 7700 7675 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 7725 50  0001 C CNN
F 3 "~" H 7700 7725 50  0001 C CNN
	1    7700 7725
	0    -1   1    0   
$EndComp
Text Label 7350 7725 0    39   ~ 0
A1
Entry Wire Line
	7250 7625 7350 7725
Text Label 8150 7725 2    39   ~ 0
VA1
Entry Wire Line
	8150 7725 8250 7825
Wire Wire Line
	7350 7625 7550 7625
Wire Wire Line
	7850 7625 8150 7625
$Comp
L Device:R R28
U 1 1 5F192E53
P 7700 7625
F 0 "R28" V 7650 7400 39  0000 L CNN
F 1 "1k" V 7700 7575 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7630 7625 50  0001 C CNN
F 3 "~" H 7700 7625 50  0001 C CNN
	1    7700 7625
	0    -1   1    0   
$EndComp
Text Label 7350 7625 0    39   ~ 0
A0
Entry Wire Line
	7250 7525 7350 7625
Text Label 8150 7625 2    39   ~ 0
VA0
Entry Wire Line
	8150 7625 8250 7725
$Comp
L Device:C C24
U 1 1 5F37F257
P 22300 1075
F 0 "C24" H 22375 1150 39  0000 C CNN
F 1 "100n" H 22400 1000 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 22338 925 50  0001 C CNN
F 3 "~" H 22300 1075 50  0001 C CNN
	1    22300 1075
	1    0    0    -1  
$EndComp
Wire Wire Line
	22300 1225 22075 1225
Connection ~ 22075 1225
Wire Wire Line
	22075 925  22300 925 
Connection ~ 22075 925 
$Comp
L Device:R R24
U 1 1 5EBC9A23
P 19900 6125
F 0 "R24" V 19975 6050 39  0000 L CNN
F 1 "10k" V 19900 6075 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 19830 6125 50  0001 C CNN
F 3 "~" H 19900 6125 50  0001 C CNN
	1    19900 6125
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR046
U 1 1 5ED02967
P 19900 5975
F 0 "#PWR046" H 19900 5825 50  0001 C CNN
F 1 "+5V" H 19900 6125 39  0000 C CNN
F 2 "" H 19900 5975 50  0001 C CNN
F 3 "" H 19900 5975 50  0001 C CNN
	1    19900 5975
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 11200 825  11200
Wire Wire Line
	1450 11400 825  11400
Wire Wire Line
	1450 11300 825  11300
Text Label 825  11200 0    39   ~ 0
~JOY_RIGHT
Text Label 825  11400 0    39   ~ 0
~JOY_B2
Text Label 825  11300 0    39   ~ 0
~JOY_B3
Wire Wire Line
	3850 8200 4475 8200
Text Label 4475 7700 2    39   ~ 0
FD_INDEX0
Wire Wire Line
	3850 8900 4475 8900
Text Label 4475 8900 2    39   ~ 0
FD_INDEX1
Wire Wire Line
	3850 7400 4475 7400
Wire Wire Line
	3850 7500 4475 7500
Wire Wire Line
	3850 7300 4475 7300
Wire Wire Line
	3850 7800 4475 7800
Wire Wire Line
	3850 7200 4475 7200
Wire Wire Line
	3850 7600 4475 7600
Wire Wire Line
	4475 7700 3850 7700
Wire Wire Line
	4475 7100 3850 7100
Wire Wire Line
	3850 7000 4475 7000
Wire Wire Line
	3850 6900 4475 6900
Wire Wire Line
	3850 6600 4475 6600
Wire Wire Line
	3850 8700 4475 8700
Wire Wire Line
	3850 8800 4475 8800
Wire Wire Line
	3850 8600 4475 8600
Wire Wire Line
	3850 9600 4475 9600
Wire Wire Line
	3850 10100 4475 10100
Wire Wire Line
	4475 10000 3850 10000
Text Label 4475 6600 2    39   ~ 0
FD_CS
Text Label 4475 7800 2    39   ~ 0
FD_DISK0_0
Text Label 4475 7300 2    39   ~ 0
FD_DISK1_0
Text Label 4475 7100 2    39   ~ 0
FD_RST
Text Label 4475 7600 2    39   ~ 0
FD_HLT
Text Label 4475 7500 2    39   ~ 0
FD_SIDE
Text Label 4475 8800 2    39   ~ 0
FD_DDEN
Text Label 4475 6900 2    39   ~ 0
FD_SL
Text Label 4475 7000 2    39   ~ 0
FD_SR
Text Label 4475 8600 2    39   ~ 0
FD_INTRQ
Text Label 4475 8700 2    39   ~ 0
FD_DRQ
Text Label 4475 8200 2    39   ~ 0
FD_MOTOR
Text Label 4475 7200 2    39   ~ 0
FD_RDAT_0
Text Label 4475 7400 2    39   ~ 0
FD_WDAT
Text Label 4475 8000 2    39   ~ 0
FD_S
Wire Wire Line
	1450 9600 825  9600
Wire Wire Line
	1450 9700 825  9700
Wire Wire Line
	825  9800 1450 9800
Wire Wire Line
	825  10000 1450 10000
Text Label 4475 6800 2    39   ~ 0
Hsync
Text Label 4475 9700 2    39   ~ 0
CHROMA0
Text Label 4475 9800 2    39   ~ 0
CHROMA1
Wire Wire Line
	3850 9800 4475 9800
Wire Wire Line
	3850 9700 4475 9700
Text Label 4975 9025 0    39   ~ 0
VA1
Wire Wire Line
	15800 5775 16150 5775
Wire Wire Line
	15800 5450 16150 5450
Wire Wire Line
	15800 5125 16150 5125
Wire Wire Line
	15800 4800 16150 4800
Wire Wire Line
	15800 4475 16150 4475
$Comp
L 4xxx:4050 U4
U 6 1 5DF7FA9A
P 16450 6100
F 0 "U4" H 16450 6250 39  0000 C CNN
F 1 "74HC4050" H 16450 6326 39  0001 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 16450 6100 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 16450 6100 50  0001 C CNN
	6    16450 6100
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4050 U4
U 3 1 5DF78533
P 16450 4475
F 0 "U4" H 16450 4625 39  0000 C CNN
F 1 "74HC4050" H 16450 4693 39  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 16450 4475 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 16450 4475 50  0001 C CNN
	3    16450 4475
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4050 U4
U 2 1 5DF75D00
P 16450 5125
F 0 "U4" H 16450 5275 39  0000 C CNN
F 1 "74HC4050" H 16450 5351 39  0001 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 16450 5125 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 16450 5125 50  0001 C CNN
	2    16450 5125
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4050 U4
U 1 1 5DF73071
P 16450 5450
F 0 "U4" H 16450 5600 39  0000 C CNN
F 1 "74HC4050" H 16450 5668 39  0001 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 16450 5450 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 16450 5450 50  0001 C CNN
	1    16450 5450
	1    0    0    -1  
$EndComp
Text Label 15800 6100 0    39   ~ 0
FD_RDAT
Text Label 17075 5775 2    39   ~ 0
FD_DISK1
Text Label 17075 5450 2    39   ~ 0
FD_DISK0
Entry Wire Line
	17075 5450 17175 5550
Entry Wire Line
	17075 5775 17175 5875
Entry Wire Line
	17075 6100 17175 6200
Wire Wire Line
	16750 5450 17075 5450
Wire Wire Line
	16750 6100 17075 6100
Wire Wire Line
	17075 4800 16750 4800
Text Label 17075 5125 2    39   ~ 0
FD_TR00_0
Entry Wire Line
	17175 4900 17075 4800
Wire Wire Line
	17075 4475 16750 4475
Wire Bus Line
	15700 4075 17175 4075
Entry Wire Line
	17175 4575 17075 4475
Text Label 17075 4475 2    39   ~ 0
FD_INDEX0
Text Label 17075 4800 2    39   ~ 0
FD_WPT0
Wire Wire Line
	15800 6100 16150 6100
Entry Wire Line
	14200 4600 14300 4700
Wire Wire Line
	14300 4700 14625 4700
Text Label 14300 4700 0    39   ~ 0
FD_INDEX
Connection ~ 19900 6275
Wire Wire Line
	19900 6275 20325 6275
Wire Wire Line
	19700 6275 19900 6275
$Comp
L power:+5V #PWR060
U 1 1 61058EFE
P 22050 8825
F 0 "#PWR060" H 22050 8675 50  0001 C CNN
F 1 "+5V" V 22050 9000 39  0000 C CNN
F 2 "" H 22050 8825 50  0001 C CNN
F 3 "" H 22050 8825 50  0001 C CNN
	1    22050 8825
	0    -1   1    0   
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J8
U 1 1 5E77BD3E
P 21750 8475
F 0 "J8" H 21800 8892 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 21800 8801 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 21750 8475 50  0001 C CNN
F 3 "~" H 21750 8475 50  0001 C CNN
F 4 "EGA_HDR" H 21800 8801 50  0000 C CNN "Desc"
	1    21750 8475
	1    0    0    -1  
$EndComp
Wire Wire Line
	22050 8675 22350 8675
Wire Wire Line
	22350 8675 22350 8825
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 619558A7
P 22200 8825
F 0 "JP4" H 22200 8900 39  0000 C CNN
F 1 "SolderJumper_2_Open" H 22200 8939 39  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 22200 8825 50  0001 C CNN
F 3 "~" H 22200 8825 50  0001 C CNN
	1    22200 8825
	1    0    0    -1  
$EndComp
Wire Wire Line
	21600 11000 21200 11000
Text Label 21200 11000 0    39   ~ 0
TAPE_OUT
Entry Wire Line
	21100 10900 21200 11000
$Comp
L Connector:AudioJack3 J11
U 1 1 6047590C
P 21800 10350
F 0 "J11" H 21520 10375 50  0000 R CNN
F 1 "PJ-313" H 21520 10284 39  0001 R CNN
F 2 "my:PJ-313" H 21800 10350 50  0001 C CNN
F 3 "~" H 21800 10350 50  0001 C CNN
F 4 "MIC" H 21520 10284 50  0000 R CNN "Desc"
	1    21800 10350
	-1   0    0    -1  
$EndComp
Entry Wire Line
	21100 10250 21200 10350
Text Label 21200 10350 0    39   ~ 0
SND_R
Wire Wire Line
	21200 10350 21600 10350
$Comp
L power:GND #PWR067
U 1 1 5D12CA06
P 21600 10250
F 0 "#PWR067" H 21600 10000 50  0001 C CNN
F 1 "GND" V 21600 10075 39  0000 C CNN
F 2 "" H 21600 10250 50  0001 C CNN
F 3 "" H 21600 10250 50  0001 C CNN
	1    21600 10250
	0    1    1    0   
$EndComp
$Comp
L Connector:AudioJack3 J12
U 1 1 606FADA5
P 21800 10900
F 0 "J12" H 21520 10925 50  0000 R CNN
F 1 "PJ-313" H 21520 10834 39  0001 R CNN
F 2 "my:PJ-313" H 21800 10900 50  0001 C CNN
F 3 "~" H 21800 10900 50  0001 C CNN
F 4 "EAR" H 21520 10834 50  0000 R CNN "Desc"
	1    21800 10900
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R78
U 1 1 5DFA313A
P 14625 10275
F 0 "R78" V 14650 10050 39  0000 L CNN
F 1 "1k" V 14625 10225 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 14555 10275 50  0001 C CNN
F 3 "~" H 14625 10275 50  0001 C CNN
	1    14625 10275
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R83
U 1 1 5DFA3543
P 14625 10475
F 0 "R83" V 14650 10250 39  0000 L CNN
F 1 "2k" V 14625 10425 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 14555 10475 50  0001 C CNN
F 3 "~" H 14625 10475 50  0001 C CNN
	1    14625 10475
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R84
U 1 1 5DFA395B
P 14625 10575
F 0 "R84" V 14650 10350 39  0000 L CNN
F 1 "1k" V 14625 10525 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 14555 10575 50  0001 C CNN
F 3 "~" H 14625 10575 50  0001 C CNN
	1    14625 10575
	0    -1   -1   0   
$EndComp
Wire Wire Line
	14900 10575 14775 10575
Wire Wire Line
	14775 10475 14900 10475
Wire Wire Line
	14475 10575 14075 10575
Wire Wire Line
	14475 10475 14125 10475
$Comp
L Device:R R79
U 1 1 616E6721
P 14625 10375
F 0 "R79" V 14650 10150 39  0000 L CNN
F 1 "2k" V 14625 10325 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 14555 10375 50  0001 C CNN
F 3 "~" H 14625 10375 50  0001 C CNN
	1    14625 10375
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R88
U 1 1 616E6A21
P 14625 10675
F 0 "R88" V 14650 10775 39  0000 L CNN
F 1 "2k" V 14625 10650 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 14555 10675 50  0001 C CNN
F 3 "~" H 14625 10675 50  0001 C CNN
	1    14625 10675
	0    1    -1   0   
$EndComp
Wire Wire Line
	14775 10675 14900 10675
Wire Wire Line
	14900 10475 14900 10575
Connection ~ 14900 10575
Wire Wire Line
	14900 10575 14900 10675
Wire Wire Line
	14775 10275 14900 10275
Wire Wire Line
	14900 10275 14900 10375
Wire Wire Line
	14900 10375 14775 10375
Connection ~ 14900 10275
Wire Wire Line
	14475 10375 14125 10375
Wire Wire Line
	14125 10375 14125 10475
Wire Wire Line
	14225 10175 14225 10675
Wire Wire Line
	14225 10675 14475 10675
Connection ~ 14225 10175
$Comp
L Device:CP C42
U 1 1 61F7E0AE
P 15625 10625
F 0 "C42" V 15750 10675 39  0000 R CNN
F 1 "47u" V 15500 10675 39  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 15663 10475 50  0001 C CNN
F 3 "~" H 15625 10625 50  0001 C CNN
	1    15625 10625
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 61F7E0BC
P 16300 10775
F 0 "#PWR0103" H 16300 10525 50  0001 C CNN
F 1 "GND" H 16305 10602 39  0001 C CNN
F 2 "" H 16300 10775 50  0001 C CNN
F 3 "" H 16300 10775 50  0001 C CNN
	1    16300 10775
	0    -1   -1   0   
$EndComp
Wire Wire Line
	15775 10625 15925 10625
$Comp
L Device:R R89
U 1 1 61F7E0B5
P 16150 10775
F 0 "R89" V 16075 10700 39  0000 L CNN
F 1 "47k" V 16150 10725 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 16080 10775 50  0001 C CNN
F 3 "~" H 16150 10775 50  0001 C CNN
	1    16150 10775
	0    1    1    0   
$EndComp
Wire Wire Line
	16000 10775 15925 10775
Wire Wire Line
	15925 10775 15925 10625
Connection ~ 15925 10625
Wire Wire Line
	15925 10625 16925 10625
Wire Wire Line
	14900 10275 15125 10275
Wire Wire Line
	14900 10575 15125 10575
Wire Wire Line
	15125 10575 15125 10625
Wire Wire Line
	15125 10275 15125 10225
Wire Wire Line
	15925 10225 16925 10225
Connection ~ 15925 10225
Wire Wire Line
	15925 10375 15925 10225
Wire Wire Line
	16000 10375 15925 10375
Wire Wire Line
	15775 10225 15925 10225
$Comp
L power:GND #PWR0100
U 1 1 5FAD4AEB
P 16300 10375
F 0 "#PWR0100" H 16300 10125 50  0001 C CNN
F 1 "GND" H 16305 10202 39  0001 C CNN
F 2 "" H 16300 10375 50  0001 C CNN
F 3 "" H 16300 10375 50  0001 C CNN
	1    16300 10375
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R80
U 1 1 5FAD403F
P 16150 10375
F 0 "R80" V 16075 10300 39  0000 L CNN
F 1 "47k" V 16150 10325 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 16080 10375 50  0001 C CNN
F 3 "~" H 16150 10375 50  0001 C CNN
	1    16150 10375
	0    1    1    0   
$EndComp
$Comp
L Device:CP C41
U 1 1 5D1A1953
P 15625 10225
F 0 "C41" V 15750 10275 39  0000 R CNN
F 1 "47u" V 15500 10275 39  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 15663 10075 50  0001 C CNN
F 3 "~" H 15625 10225 50  0001 C CNN
	1    15625 10225
	0    -1   -1   0   
$EndComp
Text Label 16925 10225 2    39   ~ 0
SND_L
Entry Wire Line
	16925 10225 17025 10325
$Comp
L Device:R R72
U 1 1 635C2531
P 15375 9975
F 0 "R72" V 15300 9925 39  0000 L CNN
F 1 "2k" V 15375 9950 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 15305 9975 50  0001 C CNN
F 3 "~" H 15375 9975 50  0001 C CNN
	1    15375 9975
	1    0    0    -1  
$EndComp
$Comp
L Device:R R71
U 1 1 635C1F2F
P 15200 9975
F 0 "R71" V 15125 9925 39  0000 L CNN
F 1 "2k" V 15200 9950 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 15130 9975 50  0001 C CNN
F 3 "~" H 15200 9975 50  0001 C CNN
	1    15200 9975
	1    0    0    -1  
$EndComp
Connection ~ 15200 10225
Wire Wire Line
	15200 10225 15475 10225
Connection ~ 15375 10625
Wire Wire Line
	15375 10625 15475 10625
Wire Wire Line
	15125 10625 15375 10625
Wire Wire Line
	15125 10225 15200 10225
Entry Wire Line
	16925 9750 17025 9850
Wire Wire Line
	15200 9825 15200 9750
Wire Wire Line
	15375 9825 15375 9750
Connection ~ 15375 9750
Wire Wire Line
	15375 9750 15475 9750
$Comp
L Device:CP C40
U 1 1 64380122
P 15625 9750
F 0 "C40" V 15750 9800 39  0000 R CNN
F 1 "47u" V 15500 9800 39  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 15663 9600 50  0001 C CNN
F 3 "~" H 15625 9750 50  0001 C CNN
	1    15625 9750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	15775 9750 16925 9750
Wire Wire Line
	15200 10125 15200 10225
Wire Wire Line
	15375 10125 15375 10625
Wire Wire Line
	15200 9750 15375 9750
Wire Wire Line
	15375 9750 15375 9075
Wire Wire Line
	15375 9075 15600 9075
Wire Wire Line
	14175 8625 14175 10275
Wire Wire Line
	14225 9025 14225 10175
Wire Wire Line
	13175 8825 13175 9525
Connection ~ 13350 8725
Wire Wire Line
	13350 8725 13750 8725
Wire Wire Line
	12450 8725 13350 8725
Wire Wire Line
	12450 8825 13175 8825
Wire Wire Line
	14125 10375 14125 10125
Connection ~ 14125 10375
Wire Wire Line
	13750 10125 14125 10125
Connection ~ 14125 10125
Wire Wire Line
	14125 10125 14125 9325
Wire Wire Line
	13750 9325 14125 9325
Wire Wire Line
	13350 9325 13350 9400
Wire Wire Line
	13350 9400 14075 9400
Wire Wire Line
	14075 10575 14075 10200
Wire Wire Line
	13350 10125 13350 10200
Wire Wire Line
	13350 10200 14075 10200
Connection ~ 14075 10200
Wire Wire Line
	14075 10200 14075 9400
Text Notes 8250 800  0    79   ~ 0
KEYBOARD & JOYSTICK
$Comp
L power:+5V #PWR021
U 1 1 5B52B6BD
P 9750 2200
F 0 "#PWR021" H 9750 2050 50  0001 C CNN
F 1 "+5V" H 9750 2350 39  0000 C CNN
F 2 "" H 9750 2200 50  0001 C CNN
F 3 "" H 9750 2200 50  0001 C CNN
	1    9750 2200
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J3
U 1 1 5FB9292E
P 10550 2400
F 0 "J3" H 10500 2800 39  0000 L CNN
F 1 "DS1020-08" H 10630 2301 50  0001 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 10550 2400 50  0001 C CNN
F 3 "~" H 10550 2400 50  0001 C CNN
F 4 "KB_A" H 10475 1900 39  0000 L CNN "Desc"
	1    10550 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08 RN2
U 1 1 602BB24C
P 9550 2600
F 0 "RN2" V 9050 2525 50  0000 L CNN
F 1 "10k" V 9950 2525 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 10025 2600 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9550 2600 50  0001 C CNN
	1    9550 2600
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 60F8B1A6
P 9775 1225
F 0 "#PWR09" H 9775 1075 50  0001 C CNN
F 1 "+5V" H 9775 1375 39  0000 C CNN
F 2 "" H 9775 1225 50  0001 C CNN
F 3 "" H 9775 1225 50  0001 C CNN
	1    9775 1225
	1    0    0    -1  
$EndComp
Text Notes 11150 800  0    79   ~ 0
TAPE INTERFACE
$Comp
L Comparator:LM311 U5
U 1 1 6377C702
P 12550 1550
F 0 "U5" H 12725 1700 39  0000 L CNN
F 1 "LM311" H 12725 1425 39  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 12550 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm311.pdf" H 12550 1550 50  0001 C CNN
	1    12550 1550
	1    0    0    -1  
$EndComp
NoConn ~ 12550 1250
NoConn ~ 12650 1250
$Comp
L Device:R R2
U 1 1 6384ECF8
P 12175 1300
F 0 "R2" V 12100 1250 39  0000 L CNN
F 1 "10k" V 12175 1250 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12105 1300 50  0001 C CNN
F 3 "~" H 12175 1300 50  0001 C CNN
	1    12175 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 639F8A80
P 12175 1975
F 0 "#PWR019" H 12175 1725 50  0001 C CNN
F 1 "GND" H 12180 1802 39  0001 C CNN
F 2 "" H 12175 1975 50  0001 C CNN
F 3 "" H 12175 1975 50  0001 C CNN
	1    12175 1975
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 63AD119E
P 12175 1150
F 0 "#PWR08" H 12175 1000 50  0001 C CNN
F 1 "+5V" H 12175 1300 39  0000 C CNN
F 2 "" H 12175 1150 50  0001 C CNN
F 3 "" H 12175 1150 50  0001 C CNN
	1    12175 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C26
U 1 1 6384F009
P 11675 1650
F 0 "C26" V 11525 1650 39  0000 C CNN
F 1 "100n" V 11825 1650 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 11713 1500 50  0001 C CNN
F 3 "~" H 11675 1650 50  0001 C CNN
	1    11675 1650
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 5AACF93D
P 11875 2250
F 0 "R11" V 11800 2200 39  0000 L CNN
F 1 "33k" V 11875 2200 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 11805 2250 50  0001 C CNN
F 3 "~" H 11875 2250 50  0001 C CNN
	1    11875 2250
	0    -1   1    0   
$EndComp
$Comp
L Device:C C33
U 1 1 5AAD00AE
P 12450 2400
F 0 "C33" H 12600 2500 39  0000 R CNN
F 1 "3.3n" H 12400 2500 39  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 12488 2250 50  0001 C CNN
F 3 "~" H 12450 2400 50  0001 C CNN
	1    12450 2400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5AAD0379
P 12450 2550
F 0 "#PWR024" H 12450 2300 50  0001 C CNN
F 1 "GND" H 12455 2377 39  0001 C CNN
F 2 "" H 12450 2550 50  0001 C CNN
F 3 "" H 12450 2550 50  0001 C CNN
	1    12450 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C31
U 1 1 61950CD9
P 12750 2250
F 0 "C31" V 12675 2375 39  0000 C CNN
F 1 "100n" V 12800 2400 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 12788 2100 50  0001 C CNN
F 3 "~" H 12750 2250 50  0001 C CNN
	1    12750 2250
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 6384F3F3
P 11975 1450
F 0 "R5" V 12050 1425 39  0000 L CNN
F 1 "100k" V 11975 1375 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 11905 1450 50  0001 C CNN
F 3 "~" H 11975 1450 50  0001 C CNN
	1    11975 1450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R10
U 1 1 6384F787
P 12175 1825
F 0 "R10" V 12250 1775 39  0000 L CNN
F 1 "10k" V 12175 1775 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12105 1825 50  0001 C CNN
F 3 "~" H 12175 1825 50  0001 C CNN
	1    12175 1825
	-1   0    0    1   
$EndComp
Entry Wire Line
	13400 1550 13500 1650
Entry Wire Line
	13400 2250 13500 2350
Entry Wire Line
	11125 2150 11225 2250
Entry Wire Line
	11125 1550 11225 1650
Text Label 11225 1650 0    39   ~ 0
TAPE_IN
Text Label 11225 2250 0    39   ~ 0
TAPE_OUT0
Text Label 13400 2250 2    39   ~ 0
TAPE_OUT
Text Label 13400 1550 2    39   ~ 0
TAPE_IN0
Entry Wire Line
	8850 1200 8950 1300
Entry Wire Line
	8850 1450 8950 1550
Entry Wire Line
	8850 1700 8950 1800
Entry Wire Line
	8850 1950 8950 2050
Entry Wire Line
	8850 2200 8950 2300
Entry Wire Line
	8850 2450 8950 2550
Entry Wire Line
	8850 2700 8950 2800
Entry Wire Line
	8850 2950 8950 3050
Text Label 8850 2700 2    39   ~ 0
KA14
Text Label 8850 2450 2    39   ~ 0
KA13
Text Label 8850 2200 2    39   ~ 0
KA12
Text Label 8850 1950 2    39   ~ 0
KA11
Text Label 8850 1700 2    39   ~ 0
KA10
Text Label 8850 1450 2    39   ~ 0
KA9
Text Label 8850 1200 2    39   ~ 0
KA8
Entry Wire Line
	10050 2000 10150 2100
Entry Wire Line
	10050 2100 10150 2200
Entry Wire Line
	10050 2200 10150 2300
Entry Wire Line
	10050 2300 10150 2400
Entry Wire Line
	10050 2400 10150 2500
Entry Wire Line
	10050 2500 10150 2600
Entry Wire Line
	10050 2600 10150 2700
Entry Wire Line
	10050 2700 10150 2800
Text Label 10150 2100 0    39   ~ 0
KA11
Text Label 10150 2200 0    39   ~ 0
KA10
Text Label 10150 2300 0    39   ~ 0
KA9
Text Label 10150 2400 0    39   ~ 0
KA12
Text Label 10150 2500 0    39   ~ 0
KA13
Text Label 10150 2600 0    39   ~ 0
KA8
Text Label 10150 2700 0    39   ~ 0
KA14
Text Label 10150 2800 0    39   ~ 0
KA15
Text Label 8350 1200 0    39   ~ 0
A8
Text Label 8350 1450 0    39   ~ 0
A9
Text Label 8350 1700 0    39   ~ 0
A10
Text Label 8350 1950 0    39   ~ 0
A11
Text Label 8350 2200 0    39   ~ 0
A12
Text Label 8350 2450 0    39   ~ 0
A13
Text Label 8350 2700 0    39   ~ 0
A14
Text Label 8350 2950 0    39   ~ 0
A15
Entry Wire Line
	8250 2850 8350 2950
Entry Wire Line
	8250 2600 8350 2700
Entry Wire Line
	8250 2350 8350 2450
Entry Wire Line
	8250 2100 8350 2200
Entry Wire Line
	8250 1850 8350 1950
Entry Wire Line
	8250 1600 8350 1700
Entry Wire Line
	8250 1350 8350 1450
Entry Wire Line
	8250 1100 8350 1200
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 5FD04AD5
P 10550 1425
F 0 "J1" H 10525 1725 39  0000 L CNN
F 1 "DS1020-05" H 10630 1376 50  0001 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x05_P2.54mm_Vertical" H 10550 1425 50  0001 C CNN
F 3 "~" H 10550 1425 50  0001 C CNN
F 4 "KB_D" H 10475 1125 39  0000 L CNN "Desc"
	1    10550 1425
	1    0    0    -1  
$EndComp
Entry Wire Line
	8950 1225 9050 1325
Entry Wire Line
	8950 1325 9050 1425
Entry Wire Line
	8950 1425 9050 1525
Entry Wire Line
	8950 1525 9050 1625
Entry Wire Line
	8950 1625 9050 1725
Text Label 9050 1325 0    39   ~ 0
KD4
Text Label 9050 1425 0    39   ~ 0
KD3
Text Label 9050 1525 0    39   ~ 0
KD2
Text Label 9050 1625 0    39   ~ 0
KD1
Text Label 9050 1725 0    39   ~ 0
KD0
Entry Wire Line
	8950 2100 9050 2200
Entry Wire Line
	8950 2200 9050 2300
Entry Wire Line
	8950 2300 9050 2400
Entry Wire Line
	8950 2400 9050 2500
Entry Wire Line
	8950 2500 9050 2600
Entry Wire Line
	8950 2600 9050 2700
Entry Wire Line
	8950 2700 9050 2800
Text Label 9050 2300 0    39   ~ 0
~JOY_B3
Text Label 9050 2200 0    39   ~ 0
~JOY_B2
Text Label 9050 2400 0    39   ~ 0
~JOY_RIGHT
Text Label 9050 2500 0    39   ~ 0
~JOY_LEFT
Text Label 9050 2600 0    39   ~ 0
~JOY_DOWN
Text Label 9050 2800 0    39   ~ 0
~JOY_UP
Entry Wire Line
	10150 1525 10050 1425
Entry Wire Line
	10150 1425 10050 1325
Text Label 10150 1625 0    39   ~ 0
KD4
Text Label 10150 1525 0    39   ~ 0
KD3
Text Label 10150 1425 0    39   ~ 0
KD2
Text Label 10150 1325 0    39   ~ 0
KD1
Text Label 10150 1225 0    39   ~ 0
KD0
Entry Wire Line
	10150 1325 10050 1225
Entry Wire Line
	10050 1125 10150 1225
Entry Wire Line
	10150 1625 10050 1525
Wire Wire Line
	11825 1650 11825 1450
Wire Wire Line
	12175 1975 12450 1975
Wire Wire Line
	12450 1975 12550 1975
Wire Wire Line
	12175 1150 12450 1150
Connection ~ 12175 1150
Wire Wire Line
	12450 1250 12450 1150
Wire Wire Line
	11825 1650 12250 1650
Connection ~ 11825 1650
Wire Wire Line
	12125 1450 12175 1450
Connection ~ 12175 1450
Wire Wire Line
	12175 1450 12250 1450
Wire Wire Line
	12175 1675 12175 1450
Connection ~ 12450 1975
Wire Wire Line
	12450 1850 12450 1975
Wire Wire Line
	12550 1850 12550 1975
Connection ~ 12450 2250
Wire Wire Line
	12450 2250 12600 2250
Wire Wire Line
	12025 2250 12200 2250
Connection ~ 12175 1975
Wire Bus Line
	11125 825  13500 825 
Wire Wire Line
	11225 1650 11525 1650
Wire Wire Line
	11225 2250 11725 2250
Wire Wire Line
	12900 2250 13400 2250
Connection ~ 8950 825 
Wire Wire Line
	10350 2100 10150 2100
Wire Wire Line
	10150 2200 10350 2200
Wire Wire Line
	10350 2300 10150 2300
Wire Wire Line
	10150 2400 10350 2400
Wire Wire Line
	10150 2500 10350 2500
Wire Wire Line
	10150 2600 10350 2600
Wire Wire Line
	10150 2700 10350 2700
Wire Wire Line
	10150 2800 10350 2800
Wire Wire Line
	8450 2200 8350 2200
Wire Wire Line
	8350 1200 8450 1200
Wire Bus Line
	8250 825  8950 825 
Wire Wire Line
	9350 1725 9050 1725
Wire Wire Line
	9050 1625 9350 1625
Wire Wire Line
	9350 1525 9050 1525
Wire Wire Line
	9350 1425 9050 1425
Wire Wire Line
	9050 1325 9350 1325
Wire Wire Line
	9350 2200 9050 2200
Wire Wire Line
	9050 2300 9350 2300
Wire Wire Line
	9350 2400 9050 2400
Wire Wire Line
	9050 2500 9350 2500
Wire Wire Line
	9350 2600 9050 2600
Wire Wire Line
	9050 2700 9350 2700
Wire Wire Line
	9350 2800 9050 2800
Wire Bus Line
	8950 825  10050 825 
Connection ~ 10050 825 
Wire Bus Line
	10050 825  10875 825 
Wire Wire Line
	10350 1225 10150 1225
Wire Wire Line
	10150 1325 10350 1325
Wire Wire Line
	10350 1425 10150 1425
Wire Wire Line
	10150 1525 10350 1525
Wire Wire Line
	10350 1625 10150 1625
$Comp
L Device:R R14
U 1 1 5E1C1867
P 11875 2450
F 0 "R14" V 11800 2400 39  0000 L CNN
F 1 "100k" V 11875 2375 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 11805 2450 50  0001 C CNN
F 3 "~" H 11875 2450 50  0001 C CNN
	1    11875 2450
	0    -1   1    0   
$EndComp
Entry Wire Line
	11125 2350 11225 2450
Wire Wire Line
	11225 2450 11725 2450
Wire Wire Line
	12025 2450 12200 2450
Wire Wire Line
	12200 2450 12200 2250
Connection ~ 12200 2250
Wire Wire Line
	12200 2250 12450 2250
Text Label 11225 2450 0    39   ~ 0
BEEPER
Text Label 9050 2700 0    39   ~ 0
~JOY_B1
Wire Wire Line
	8750 1200 8850 1200
Wire Bus Line
	10875 825  10875 3125
Wire Wire Line
	8350 2950 8450 2950
Wire Wire Line
	8750 2950 8850 2950
Wire Wire Line
	8850 2700 8750 2700
Wire Wire Line
	8350 2700 8450 2700
Wire Wire Line
	8850 2450 8750 2450
Wire Wire Line
	8350 2450 8450 2450
Wire Wire Line
	8750 2200 8850 2200
Wire Wire Line
	8750 1950 8850 1950
Wire Wire Line
	8350 1950 8450 1950
Wire Wire Line
	8350 1700 8450 1700
Wire Wire Line
	8750 1700 8850 1700
Wire Wire Line
	8350 1450 8450 1450
Wire Wire Line
	8750 1450 8850 1450
$Comp
L Device:D_Schottky D1
U 1 1 64E82479
P 8600 1200
F 0 "D1" H 8600 1316 39  0000 C CNN
F 1 "BAT85" H 8600 1317 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8600 1200 50  0001 C CNN
F 3 "~" H 8600 1200 50  0001 C CNN
	1    8600 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D2
U 1 1 650F46F9
P 8600 1450
F 0 "D2" H 8600 1566 39  0000 C CNN
F 1 "BAT85" H 8600 1567 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8600 1450 50  0001 C CNN
F 3 "~" H 8600 1450 50  0001 C CNN
	1    8600 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D3
U 1 1 6522B61E
P 8600 1700
F 0 "D3" H 8600 1816 39  0000 C CNN
F 1 "BAT85" H 8600 1817 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8600 1700 50  0001 C CNN
F 3 "~" H 8600 1700 50  0001 C CNN
	1    8600 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D4
U 1 1 6522B624
P 8600 1950
F 0 "D4" H 8600 2066 39  0000 C CNN
F 1 "BAT85" H 8600 2067 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8600 1950 50  0001 C CNN
F 3 "~" H 8600 1950 50  0001 C CNN
	1    8600 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D7
U 1 1 65363E8B
P 8600 2200
F 0 "D7" H 8600 2316 39  0000 C CNN
F 1 "BAT85" H 8600 2317 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8600 2200 50  0001 C CNN
F 3 "~" H 8600 2200 50  0001 C CNN
	1    8600 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D8
U 1 1 65363E91
P 8600 2450
F 0 "D8" H 8600 2566 39  0000 C CNN
F 1 "BAT85" H 8600 2567 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8600 2450 50  0001 C CNN
F 3 "~" H 8600 2450 50  0001 C CNN
	1    8600 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D9
U 1 1 65363E97
P 8600 2700
F 0 "D9" H 8600 2816 39  0000 C CNN
F 1 "BAT85" H 8600 2817 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8600 2700 50  0001 C CNN
F 3 "~" H 8600 2700 50  0001 C CNN
	1    8600 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D10
U 1 1 65363E9D
P 8600 2950
F 0 "D10" H 8600 3066 39  0000 C CNN
F 1 "BAT85" H 8600 3067 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8600 2950 50  0001 C CNN
F 3 "~" H 8600 2950 50  0001 C CNN
	1    8600 2950
	1    0    0    -1  
$EndComp
Text Label 8850 2950 2    39   ~ 0
KA15
Wire Wire Line
	12850 1550 13400 1550
Text Label 9050 2900 0    39   ~ 0
TAPE_IN0
Entry Wire Line
	8950 2800 9050 2900
Wire Wire Line
	9050 2900 9350 2900
$Comp
L Device:R R3
U 1 1 5E09D2F0
P 9500 1325
F 0 "R3" V 9450 1450 39  0000 L CNN
F 1 "10k" V 9500 1275 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9430 1325 50  0001 C CNN
F 3 "~" H 9500 1325 50  0001 C CNN
	1    9500 1325
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5E0A08A6
P 9500 1425
F 0 "R4" V 9450 1550 39  0000 L CNN
F 1 "10k" V 9500 1375 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9430 1425 50  0001 C CNN
F 3 "~" H 9500 1425 50  0001 C CNN
	1    9500 1425
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5E0A0E31
P 9500 1525
F 0 "R6" V 9450 1650 39  0000 L CNN
F 1 "10k" V 9500 1475 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9430 1525 50  0001 C CNN
F 3 "~" H 9500 1525 50  0001 C CNN
	1    9500 1525
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5E0A10DA
P 9500 1625
F 0 "R8" V 9450 1750 39  0000 L CNN
F 1 "10k" V 9500 1575 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9430 1625 50  0001 C CNN
F 3 "~" H 9500 1625 50  0001 C CNN
	1    9500 1625
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5E0A13C2
P 9500 1725
F 0 "R9" V 9450 1850 39  0000 L CNN
F 1 "10k" V 9500 1675 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9430 1725 50  0001 C CNN
F 3 "~" H 9500 1725 50  0001 C CNN
	1    9500 1725
	0    1    1    0   
$EndComp
Wire Wire Line
	9650 1325 9775 1325
Wire Wire Line
	9775 1325 9775 1225
Wire Wire Line
	9775 1325 9775 1425
Wire Wire Line
	9775 1425 9650 1425
Connection ~ 9775 1325
Wire Wire Line
	9650 1525 9775 1525
Wire Wire Line
	9775 1525 9775 1425
Connection ~ 9775 1425
Wire Wire Line
	9650 1625 9775 1625
Wire Wire Line
	9775 1625 9775 1525
Connection ~ 9775 1525
Wire Wire Line
	9650 1725 9775 1725
Wire Wire Line
	9775 1725 9775 1625
Connection ~ 9775 1625
$Comp
L power:+5V #PWR02
U 1 1 61916B9C
P 14025 925
F 0 "#PWR02" H 14025 775 50  0001 C CNN
F 1 "+5V" H 14025 1075 39  0000 C CNN
F 2 "" H 14025 925 50  0001 C CNN
F 3 "" H 14025 925 50  0001 C CNN
	1    14025 925 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 618C9AB9
P 14025 1925
F 0 "#PWR016" H 14025 1675 50  0001 C CNN
F 1 "GND" H 14030 1752 39  0001 C CNN
F 2 "" H 14025 1925 50  0001 C CNN
F 3 "" H 14025 1925 50  0001 C CNN
	1    14025 1925
	-1   0    0    -1  
$EndComp
$Comp
L 4xxx:4050 U4
U 7 1 5DF82179
P 14825 1425
F 0 "U4" H 15055 1471 50  0000 L CNN
F 1 "74HC4050" H 15055 1380 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 14825 1425 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 14825 1425 50  0001 C CNN
	7    14825 1425
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5DF83ABE
P 14825 1925
F 0 "#PWR017" H 14825 1675 50  0001 C CNN
F 1 "GND" H 14830 1752 39  0001 C CNN
F 2 "" H 14825 1925 50  0001 C CNN
F 3 "" H 14825 1925 50  0001 C CNN
	1    14825 1925
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5DF83DB0
P 14825 925
F 0 "#PWR03" H 14825 775 50  0001 C CNN
F 1 "+5V" H 14825 1075 39  0000 C CNN
F 2 "" H 14825 925 50  0001 C CNN
F 3 "" H 14825 925 50  0001 C CNN
	1    14825 925 
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U3
U 7 1 61872BAF
P 14025 1425
F 0 "U3" H 14255 1471 50  0000 L CNN
F 1 "74HC04" H 14255 1380 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 14025 1425 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 14025 1425 50  0001 C CNN
	7    14025 1425
	1    0    0    -1  
$EndComp
Wire Wire Line
	15775 900  15675 900 
$Comp
L power:+5V #PWR01
U 1 1 6004FD39
P 15675 900
F 0 "#PWR01" H 15675 750 50  0001 C CNN
F 1 "+5V" H 15675 1050 39  0000 C CNN
F 2 "" H 15675 900 50  0001 C CNN
F 3 "" H 15675 900 50  0001 C CNN
	1    15675 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	15775 1900 15675 1900
$Comp
L power:GND #PWR015
U 1 1 5FF0C5D4
P 15675 1900
F 0 "#PWR015" H 15675 1650 50  0001 C CNN
F 1 "GND" H 15680 1727 39  0001 C CNN
F 2 "" H 15675 1900 50  0001 C CNN
F 3 "" H 15675 1900 50  0001 C CNN
	1    15675 1900
	1    0    0    -1  
$EndComp
Connection ~ 15675 900 
Connection ~ 15675 1900
$Comp
L my:MAX314CSE U2
U 5 1 64B248CF
P 15675 1400
F 0 "U2" H 15955 1446 50  0000 L CNN
F 1 "MAX314CSE/DG413DY" H 15955 1355 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 15675 1300 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX312-MAX314.pdf" H 15675 1400 50  0001 C CNN
	5    15675 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C25
U 1 1 6544E5F0
P 22525 1075
F 0 "C25" H 22425 1000 39  0000 C CNN
F 1 "100n" H 22425 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 22563 925 50  0001 C CNN
F 3 "~" H 22525 1075 50  0001 C CNN
	1    22525 1075
	-1   0    0    1   
$EndComp
Wire Wire Line
	22525 925  22300 925 
Connection ~ 22300 925 
Wire Wire Line
	22300 1225 22525 1225
Connection ~ 22300 1225
Connection ~ 13175 8175
Wire Bus Line
	13175 8175 14100 8175
Entry Wire Line
	13175 8400 13275 8500
Wire Wire Line
	13275 8500 13550 8500
Wire Wire Line
	13550 8500 13550 9025
Connection ~ 13550 9025
Wire Wire Line
	13550 9025 13550 9825
Text Label 13275 8500 0    39   ~ 0
AY_ABC
Wire Wire Line
	825  9300 1450 9300
Connection ~ 13550 9825
Connection ~ 13350 9525
Wire Wire Line
	13175 9525 13350 9525
Wire Wire Line
	13350 9525 13750 9525
$Comp
L my:MAX314CSE U2
U 4 1 649CC667
P 13750 9825
F 0 "U2" V 13550 9850 39  0000 L CNN
F 1 "MAX314CSE/DG413DY" V 13787 9955 39  0001 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 13750 9725 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX312-MAX314.pdf" H 13750 9825 50  0001 C CNN
	4    13750 9825
	0    1    1    0   
$EndComp
$Comp
L my:MAX314CSE U2
U 1 1 5F9E65DD
P 13350 9825
F 0 "U2" V 13150 9650 39  0000 L CNN
F 1 "MAX314CSE/DG413DY" V 13387 9954 39  0001 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 13350 9725 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX312-MAX314.pdf" H 13350 9825 50  0001 C CNN
	1    13350 9825
	0    -1   1    0   
$EndComp
$Comp
L my:MAX314CSE U2
U 3 1 5FC7A536
P 13350 9025
F 0 "U2" V 13150 8850 39  0000 L CNN
F 1 "MAX314CSE/DG413DY" H 13350 9201 39  0001 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 13350 8925 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX312-MAX314.pdf" H 13350 9025 50  0001 C CNN
	3    13350 9025
	0    -1   1    0   
$EndComp
$Comp
L my:MAX314CSE U2
U 2 1 5FC7DCE4
P 13750 9025
F 0 "U2" V 13950 9050 39  0000 L CNN
F 1 "MAX314CSE/DG413DY" H 13750 9201 39  0001 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 13750 8925 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX312-MAX314.pdf" H 13750 9025 50  0001 C CNN
	2    13750 9025
	0    1    -1   0   
$EndComp
$Comp
L my:Micro_SD_Card_Det J15
U 1 1 5DF95E3B
P 7100 14525
F 0 "J15" H 7050 15342 50  0000 C CNN
F 1 "MEM2055-00-190-01-A" H 7050 15251 50  0000 C CNN
F 2 "my:GCT-MEM2055-00-190-01-A" H 9150 15225 50  0001 C CNN
F 3 "https://www.hirose.com/product/en/download_file/key_name/DM3/category/Catalog/doc_file_id/49662/?file_category_id=4&item_id=195&is_series=1" H 7100 14625 50  0001 C CNN
	1    7100 14525
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5E519BC3
P 7900 15025
F 0 "#PWR0108" H 7900 14775 50  0001 C CNN
F 1 "GND" H 7905 14852 39  0001 C CNN
F 2 "" H 7900 15025 50  0001 C CNN
F 3 "" H 7900 15025 50  0001 C CNN
	1    7900 15025
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5E51A17F
P 6200 14625
F 0 "#PWR0104" H 6200 14375 50  0001 C CNN
F 1 "GND" H 6205 14452 39  0001 C CNN
F 2 "" H 6200 14625 50  0001 C CNN
F 3 "" H 6200 14625 50  0001 C CNN
	1    6200 14625
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0101
U 1 1 5E51A7CC
P 6200 14425
F 0 "#PWR0101" H 6200 14275 50  0001 C CNN
F 1 "+3.3V" V 6200 14625 39  0000 C CNN
F 2 "" H 6200 14425 50  0001 C CNN
F 3 "" H 6200 14425 50  0001 C CNN
	1    6200 14425
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR092
U 1 1 5EFA36A0
P 5625 13450
F 0 "#PWR092" H 5625 13300 50  0001 C CNN
F 1 "+3.3V" H 5625 13600 39  0000 C CNN
F 2 "" H 5625 13450 50  0001 C CNN
F 3 "" H 5625 13450 50  0001 C CNN
	1    5625 13450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5275 14225 6200 14225
Text Label 5275 15025 0    39   ~ 0
SD_CD
Entry Wire Line
	5175 14925 5275 15025
Text Label 5275 14225 0    39   ~ 0
SD_CS
Entry Wire Line
	5175 14125 5275 14225
Text Label 5275 14325 0    39   ~ 0
SD_MOSI
Entry Wire Line
	5175 14225 5275 14325
Text Label 5275 14725 0    39   ~ 0
SD_MISO
Entry Wire Line
	5175 14625 5275 14725
Text Label 5275 14525 0    39   ~ 0
SD_SCK
Wire Wire Line
	5275 14525 6200 14525
Entry Wire Line
	5175 14425 5275 14525
Wire Wire Line
	6150 13750 6150 14125
Wire Wire Line
	6150 14125 6200 14125
Wire Wire Line
	5275 14325 6200 14325
Wire Wire Line
	5975 13750 5975 14725
Wire Bus Line
	8100 13075 8100 15250
Wire Bus Line
	5175 13075 8100 13075
Text Notes 5200 13050 0    79   ~ 0
SD CARD
Text Label 4475 9000 2    39   ~ 0
SD_CD
Wire Wire Line
	4475 9000 3850 9000
Text Label 4475 9300 2    39   ~ 0
SD_CS
Text Label 4475 9400 2    39   ~ 0
SD_MOSI
Text Label 4475 9100 2    39   ~ 0
SD_MISO
Text Label 4475 9200 2    39   ~ 0
SD_SCK
Wire Wire Line
	4475 9400 3850 9400
Wire Wire Line
	4475 9200 3850 9200
Wire Wire Line
	4475 9100 3850 9100
Wire Wire Line
	4475 9300 3850 9300
$Comp
L Device:C C2
U 1 1 6292270F
P 17300 1075
F 0 "C2" H 17200 1000 39  0000 C CNN
F 1 "100n" H 17200 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 17338 925 50  0001 C CNN
F 3 "~" H 17300 1075 50  0001 C CNN
	1    17300 1075
	-1   0    0    1   
$EndComp
Wire Wire Line
	17300 925  17525 925 
Wire Wire Line
	17525 1225 17300 1225
Connection ~ 17300 1225
Connection ~ 17300 925 
$Comp
L Device:R R69
U 1 1 62F26938
P 6150 13600
F 0 "R69" V 6225 13550 39  0000 L CNN
F 1 "10k" V 6150 13550 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 6080 13600 50  0001 C CNN
F 3 "~" H 6150 13600 50  0001 C CNN
	1    6150 13600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R68
U 1 1 62F277A2
P 5975 13600
F 0 "R68" V 6050 13550 39  0000 L CNN
F 1 "10k" V 5975 13550 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5905 13600 50  0001 C CNN
F 3 "~" H 5975 13600 50  0001 C CNN
	1    5975 13600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 13450 5975 13450
Connection ~ 5800 13450
Connection ~ 5975 13450
$Comp
L Device:R R67
U 1 1 62F279F0
P 5800 13600
F 0 "R67" V 5875 13550 39  0000 L CNN
F 1 "10k" V 5800 13550 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5730 13600 50  0001 C CNN
F 3 "~" H 5800 13600 50  0001 C CNN
	1    5800 13600
	1    0    0    -1  
$EndComp
Wire Wire Line
	14875 6825 14300 6825
Wire Wire Line
	14875 6925 14300 6925
Text Label 14300 6825 0    39   ~ 0
FD_DRQ
Text Label 14300 6925 0    39   ~ 0
FD_INTRQ
$Comp
L Device:R R66
U 1 1 6426411B
P 5625 13600
F 0 "R66" V 5700 13550 39  0000 L CNN
F 1 "10k" V 5625 13550 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5555 13600 50  0001 C CNN
F 3 "~" H 5625 13600 50  0001 C CNN
	1    5625 13600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5625 13750 5625 15025
Wire Wire Line
	5800 13750 5800 14825
Connection ~ 5625 15025
Wire Wire Line
	5625 15025 6200 15025
Wire Wire Line
	5800 14825 6200 14825
Connection ~ 5975 14725
Wire Wire Line
	5975 14725 6200 14725
Wire Wire Line
	5275 14725 5975 14725
Wire Wire Line
	5275 15025 5625 15025
Wire Wire Line
	5975 13450 6150 13450
Wire Wire Line
	5800 13450 5625 13450
Connection ~ 5625 13450
Text Label 12900 6175 2    39   ~ 0
FD_WSTB
Entry Wire Line
	17075 5125 17175 5225
Wire Wire Line
	16750 5125 17075 5125
Wire Wire Line
	16750 5775 17075 5775
$Comp
L 4xxx:4050 U4
U 5 1 5DF7D029
P 16450 4800
F 0 "U4" H 16450 4950 39  0000 C CNN
F 1 "74HC4050" H 16450 5018 39  0001 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 16450 4800 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 16450 4800 50  0001 C CNN
	5    16450 4800
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4050 U4
U 4 1 5DF7AAD2
P 16450 5775
F 0 "U4" H 16450 5925 39  0000 C CNN
F 1 "74HC4050" H 16450 6001 39  0001 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 16450 5775 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 16450 5775 50  0001 C CNN
	4    16450 5775
	1    0    0    -1  
$EndComp
Wire Wire Line
	14875 6525 14300 6525
Entry Wire Line
	14200 6425 14300 6525
Text Label 14300 6525 0    39   ~ 0
FD_WPT
Wire Wire Line
	14875 6625 14300 6625
Entry Wire Line
	14200 6525 14300 6625
Text Label 14300 6625 0    39   ~ 0
FD_DISK1
Text Label 4475 8100 2    39   ~ 0
FD_RAWR
Text Label 4475 8400 2    39   ~ 0
FD_WD
Text Label 4475 8300 2    39   ~ 0
FD_TR43
Text Label 4475 8500 2    39   ~ 0
FD_WF_DE
Text Label 4475 7900 2    39   ~ 0
FD_CLK
Wire Wire Line
	3850 8400 4475 8400
Wire Wire Line
	3850 8500 4475 8500
Wire Wire Line
	3850 8300 4475 8300
Wire Wire Line
	3850 8100 4475 8100
Wire Wire Line
	3850 8000 4475 8000
Wire Wire Line
	3850 7900 4475 7900
Text Label 825  11000 0    39   ~ 0
~JOY_DOWN
Text Label 825  11100 0    39   ~ 0
~JOY_LEFT
Text Label 825  10800 0    39   ~ 0
~JOY_UP
Text Label 825  10900 0    39   ~ 0
~JOY_B1
Wire Wire Line
	1450 11000 825  11000
Wire Wire Line
	1450 11100 825  11100
Wire Wire Line
	1450 10800 825  10800
Wire Wire Line
	1450 10900 825  10900
Wire Wire Line
	1450 10600 825  10600
Wire Wire Line
	1450 10400 825  10400
Wire Wire Line
	1450 10500 825  10500
Text Label 825  10500 0    39   ~ 0
BEEPER
Text Label 825  10400 0    39   ~ 0
TAPE_IN0
Text Label 825  10600 0    39   ~ 0
TAPE_OUT0
Text Label 825  8400 0    39   ~ 0
VA14
Wire Wire Line
	1450 8400 825  8400
Wire Wire Line
	3850 10800 4475 10800
Wire Wire Line
	3850 10700 4475 10700
Wire Wire Line
	3850 11200 4475 11200
Wire Wire Line
	3850 11300 4475 11300
Wire Wire Line
	3850 10900 4475 10900
Wire Wire Line
	3850 11000 4475 11000
Wire Wire Line
	3850 11100 4475 11100
Text Label 825  9500 0    39   ~ 0
AY_ABC
Wire Wire Line
	4475 9500 3850 9500
Wire Wire Line
	3850 9900 4475 9900
Text Label 825  7000 0    39   ~ 0
VA12
Text Label 4475 10100 2    39   ~ 0
KD2
Text Label 4975 9225 0    39   ~ 0
VA0
Text Label 4475 9900 2    39   ~ 0
KD4
Text Label 4475 10000 2    39   ~ 0
KD3
Wire Wire Line
	21625 1950 22025 1950
Wire Wire Line
	21625 2975 22025 2975
NoConn ~ 3675 2500
NoConn ~ 3675 2600
NoConn ~ 3675 3000
NoConn ~ 3850 10300
NoConn ~ 3850 10400
Entry Wire Line
	4475 10200 4575 10300
NoConn ~ 3850 10500
NoConn ~ 12375 6275
NoConn ~ 22750 2650
$Comp
L power:GND #PWR0111
U 1 1 5FFAFB13
P 14200 15500
F 0 "#PWR0111" H 14200 15250 50  0001 C CNN
F 1 "GND" H 14205 15327 39  0001 C CNN
F 2 "" H 14200 15500 50  0001 C CNN
F 3 "" H 14200 15500 50  0001 C CNN
	1    14200 15500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5FFB0CC1
P 2025 4025
F 0 "#PWR0112" H 2025 3775 50  0001 C CNN
F 1 "GND" H 2030 3852 39  0001 C CNN
F 2 "" H 2025 4025 50  0001 C CNN
F 3 "" H 2025 4025 50  0001 C CNN
	1    2025 4025
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5FFB21FA
P 21600 13100
F 0 "#PWR0113" H 21600 12850 50  0001 C CNN
F 1 "GND" H 21605 12927 39  0001 C CNN
F 2 "" H 21600 13100 50  0001 C CNN
F 3 "" H 21600 13100 50  0001 C CNN
	1    21600 13100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5FFB337B
P 17000 1225
F 0 "#PWR0114" H 17000 975 50  0001 C CNN
F 1 "GND" H 17005 1052 39  0001 C CNN
F 2 "" H 17000 1225 50  0001 C CNN
F 3 "" H 17000 1225 50  0001 C CNN
	1    17000 1225
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5FFB440B
P 15525 6000
F 0 "#PWR0115" H 15525 5750 50  0001 C CNN
F 1 "GND" H 15530 5827 39  0001 C CNN
F 2 "" H 15525 6000 50  0001 C CNN
F 3 "" H 15525 6000 50  0001 C CNN
	1    15525 6000
	1    0    0    -1  
$EndComp
Connection ~ 15525 6000
$Comp
L power:GND #PWR0116
U 1 1 5E0BAE2A
P 22025 6125
F 0 "#PWR0116" H 22025 5875 50  0001 C CNN
F 1 "GND" V 22025 5950 39  0000 C CNN
F 2 "" H 22025 6125 50  0001 C CNN
F 3 "" H 22025 6125 50  0001 C CNN
	1    22025 6125
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R50
U 1 1 917232FA
P 1300 10200
F 0 "R50" V 1225 10150 39  0000 L CNN
F 1 "470" V 1300 10150 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 1230 10200 50  0001 C CNN
F 3 "~" H 1300 10200 50  0001 C CNN
	1    1300 10200
	0    -1   1    0   
$EndComp
Wire Wire Line
	1125 10300 1450 10300
Wire Wire Line
	1125 10200 1150 10200
$Comp
L my:logo LOGO1
U 1 1 5E51C621
P 17875 15425
F 0 "LOGO1" H 17875 15625 50  0001 C CNN
F 1 "graphic" H 17875 15175 50  0001 C CNN
F 2 "my:black-mage2" H 17875 15225 50  0001 C CNN
F 3 "~" H 17905 15225 50  0001 C CNN
	1    17875 15425
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5E19FA9B
P 18325 15275
F 0 "H2" H 18425 15275 50  0000 L CNN
F 1 "MountingHole" H 18425 15230 50  0001 L CNN
F 2 "MountingHole:MountingHole_5mm" H 18325 15275 50  0001 C CNN
F 3 "~" H 18325 15275 50  0001 C CNN
	1    18325 15275
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5E1A5D2A
P 18325 15100
F 0 "H1" H 18425 15100 50  0000 L CNN
F 1 "MountingHole" H 18425 15055 50  0001 L CNN
F 2 "MountingHole:MountingHole_5mm" H 18325 15100 50  0001 C CNN
F 3 "~" H 18325 15100 50  0001 C CNN
	1    18325 15100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5E30CA87
P 18325 15450
F 0 "H3" H 18425 15450 50  0000 L CNN
F 1 "MountingHole" H 18425 15405 50  0001 L CNN
F 2 "MountingHole:MountingHole_3mm" H 18425 15359 50  0001 L CNN
F 3 "~" H 18325 15450 50  0001 C CNN
	1    18325 15450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5E312288
P 18325 15625
F 0 "H5" H 18425 15625 50  0000 L CNN
F 1 "MountingHole" H 18425 15580 50  0001 L CNN
F 2 "MountingHole:MountingHole_3mm" H 18425 15534 50  0001 L CNN
F 3 "~" H 18325 15625 50  0001 C CNN
	1    18325 15625
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 5E3124C4
P 18325 15800
F 0 "H6" H 18425 15800 50  0000 L CNN
F 1 "MountingHole" H 18425 15755 50  0001 L CNN
F 2 "MountingHole:MountingHole_3mm" H 18425 15709 50  0001 L CNN
F 3 "~" H 18325 15800 50  0001 C CNN
	1    18325 15800
	1    0    0    -1  
$EndComp
Text Notes 13275 8400 0    39   ~ 0
0 - ACB\n1 - ABC
Wire Bus Line
	13175 8175 13175 8500
Wire Wire Line
	14075 5500 14625 5500
Wire Bus Line
	7975 825  7975 3900
Wire Bus Line
	14100 8175 14100 8500
Wire Bus Line
	13500 825  13500 2750
Wire Bus Line
	11125 825  11125 2750
Wire Bus Line
	17025 8175 17025 11050
Wire Bus Line
	10725 4625 10725 5075
Wire Bus Line
	6700 825  6700 3125
Wire Bus Line
	10825 8175 10825 11075
Wire Bus Line
	15700 4075 15700 6125
Wire Bus Line
	15750 11875 15750 15400
Wire Bus Line
	17175 4075 17175 7425
Wire Bus Line
	5175 13075 5175 15250
Wire Bus Line
	12900 4775 12900 5575
Wire Bus Line
	10925 8525 10925 9325
Wire Bus Line
	6750 7325 6750 9175
Wire Bus Line
	8250 4650 8250 6500
Wire Bus Line
	10625 4075 10625 7425
Wire Bus Line
	13000 4075 13000 7150
Wire Bus Line
	14200 4075 14200 6925
Wire Bus Line
	12075 11875 12075 15400
Wire Bus Line
	8250 825  8250 3125
Wire Bus Line
	10050 825  10050 2800
Wire Bus Line
	8950 825  8950 3125
Wire Bus Line
	4875 7325 4875 10000
Wire Bus Line
	5750 4650 5750 6675
Wire Bus Line
	3300 825  3300 3925
Wire Bus Line
	750  825  750  4175
Wire Bus Line
	7250 7325 7250 9825
Wire Bus Line
	8250 7325 8250 10025
Wire Bus Line
	22500 3700 22500 14650
Wire Bus Line
	21100 3700 21100 14600
Wire Bus Line
	725  4650 725  12450
Wire Bus Line
	4575 4650 4575 12450
$EndSCHEMATC
