EESchema Schematic File Version 4
LIBS:sizif512-cache
EELAYER 30 0
EELAYER END
$Descr A2 23386 16535
encoding utf-8
Sheet 1 1
Title "SIZIF-512"
Date "2020-02-07"
Rev ""
Comp "Eugene Lozovoy"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:DB9_Male_MountingHoles J10
U 1 1 5B60AE44
P 21800 7025
F 0 "J10" H 21979 7028 50  0000 L CNN
F 1 "DB9-M" H 21979 6937 50  0001 L CNN
F 2 "Connector_Dsub:DSUB-9_Male_Horizontal_P2.77x2.84mm_EdgePinOffset4.94mm_Housed_MountingHolesOffset7.48mm" H 21800 7025 50  0001 C CNN
F 3 "" H 21800 7025 50  0001 C CNN
F 4 "Joystick" H 22125 6925 50  0000 C CNN "Desc"
	1    21800 7025
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR069
U 1 1 5AE08D56
P 21800 7625
F 0 "#PWR069" H 21800 7375 50  0001 C CNN
F 1 "GND" H 21800 7475 39  0000 C CNN
F 2 "" H 21800 7625 50  0001 C CNN
F 3 "" H 21800 7625 50  0001 C CNN
	1    21800 7625
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR043
U 1 1 5DE095FC
P 22300 4875
F 0 "#PWR043" H 22300 4625 50  0001 C CNN
F 1 "GND" H 22305 4702 39  0000 C CNN
F 2 "" H 22300 4875 50  0001 C CNN
F 3 "" H 22300 4875 50  0001 C CNN
	1    22300 4875
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 5DEAF43C
P 21425 4275
F 0 "R16" H 21225 4275 39  0000 L CNN
F 1 "10k" V 21425 4225 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 21355 4275 50  0001 C CNN
F 3 "~" H 21425 4275 50  0001 C CNN
	1    21425 4275
	1    0    0    1   
$EndComp
$Comp
L Device:R R17
U 1 1 5DEB077A
P 21575 4275
F 0 "R17" H 21625 4275 39  0000 L CNN
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
L power:GND #PWR085
U 1 1 5D788196
P 21600 12475
F 0 "#PWR085" H 21600 12225 50  0001 C CNN
F 1 "GND" H 21605 12302 39  0001 C CNN
F 2 "" H 21600 12475 50  0001 C CNN
F 3 "" H 21600 12475 50  0001 C CNN
	1    21600 12475
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR086
U 1 1 5D788520
P 21600 12575
F 0 "#PWR086" H 21600 12325 50  0001 C CNN
F 1 "GND" H 21605 12402 39  0001 C CNN
F 2 "" H 21600 12575 50  0001 C CNN
F 3 "" H 21600 12575 50  0001 C CNN
	1    21600 12575
	0    1    1    0   
$EndComp
NoConn ~ 21600 13375
NoConn ~ 21600 13475
NoConn ~ 21600 13575
NoConn ~ 21600 13675
NoConn ~ 22100 14675
$Comp
L power:+12V #PWR0102
U 1 1 5D95DBB7
P 22100 14075
F 0 "#PWR0102" H 22100 13925 50  0001 C CNN
F 1 "+12V" V 22100 14200 39  0000 L CNN
F 2 "" H 22100 14075 50  0001 C CNN
F 3 "" H 22100 14075 50  0001 C CNN
	1    22100 14075
	0    1    1    0   
$EndComp
$Comp
L power:-5V #PWR098
U 1 1 5D95E897
P 22100 13875
F 0 "#PWR098" H 22100 13975 50  0001 C CNN
F 1 "-5V" V 22100 14000 39  0000 L CNN
F 2 "" H 22100 13875 50  0001 C CNN
F 3 "" H 22100 13875 50  0001 C CNN
	1    22100 13875
	0    1    1    0   
$EndComp
NoConn ~ 22100 12275
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J5
U 1 1 5DDDF159
P 21900 4650
F 0 "J5" H 21950 5067 50  0000 C CNN
F 1 "JTAG" H 21950 4976 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 21900 4650 50  0001 C CNN
F 3 "~" H 21900 4650 50  0001 C CNN
F 4 "JTAG" H 21950 4975 50  0000 C CNN "Desc"
	1    21900 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR076
U 1 1 5D2BBF23
P 21525 9475
F 0 "#PWR076" H 21525 9325 50  0001 C CNN
F 1 "+5V" V 21525 9675 39  0000 C CNN
F 2 "" H 21525 9475 50  0001 C CNN
F 3 "" H 21525 9475 50  0001 C CNN
	1    21525 9475
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR077
U 1 1 5DBBA9C9
P 21825 9675
F 0 "#PWR077" H 21825 9425 50  0001 C CNN
F 1 "GND" H 21825 9525 39  0000 C CNN
F 2 "" H 21825 9675 50  0001 C CNN
F 3 "" H 21825 9675 50  0001 C CNN
	1    21825 9675
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR063
U 1 1 65096088
P 20325 6675
F 0 "#PWR063" H 20325 6425 50  0001 C CNN
F 1 "GND" H 20330 6502 39  0001 C CNN
F 2 "" H 20325 6675 50  0001 C CNN
F 3 "" H 20325 6675 50  0001 C CNN
	1    20325 6675
	-1   0    0    -1  
$EndComp
Text GLabel 19700 6275 0    39   Output ~ 0
~MAGIC
$Comp
L my:zx_edge J16
U 1 1 5D2DD686
P 21800 13275
F 0 "J16" H 21850 14792 50  0000 C CNN
F 1 "Conn_02x28_Row_Letter_First" H 21850 14701 50  0001 C CNN
F 2 "my:ZX_EDGE" H 21800 13275 50  0001 C CNN
F 3 "~" H 21800 13275 50  0001 C CNN
F 4 "EDGE_CONNECTOR" H 21850 14701 50  0000 C CNN "Desc"
	1    21800 13275
	1    0    0    -1  
$EndComp
Text GLabel 19700 5275 0    39   Output ~ 0
~RST
$Comp
L Switch:SW_Push SW2
U 1 1 5D11746F
P 20325 5475
F 0 "SW2" H 20250 5400 39  0000 L CNN
F 1 "WF-2" H 20200 5400 39  0001 L CNN
F 2 "Button_Switch_THT:SW_Tactile_SPST_Angled_PTS645Vx83-2LFS" H 20325 5675 50  0001 C CNN
F 3 "" H 20325 5675 50  0001 C CNN
F 4 "RST" H 20325 5400 50  0001 C CNN "Desc"
	1    20325 5475
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR053
U 1 1 5D11747D
P 20325 5675
F 0 "#PWR053" H 20325 5425 50  0001 C CNN
F 1 "GND" H 20330 5502 39  0001 C CNN
F 2 "" H 20325 5675 50  0001 C CNN
F 3 "" H 20325 5675 50  0001 C CNN
	1    20325 5675
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 5E0D999B
P 21350 5050
F 0 "R20" H 21400 5050 39  0000 L CNN
F 1 "10k" V 21350 5000 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 21280 5050 50  0001 C CNN
F 3 "~" H 21350 5050 50  0001 C CNN
	1    21350 5050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR081
U 1 1 5E2BDC4F
P 21600 11300
F 0 "#PWR081" H 21600 11050 50  0001 C CNN
F 1 "GND" V 21600 11125 39  0000 C CNN
F 2 "" H 21600 11300 50  0001 C CNN
F 3 "" H 21600 11300 50  0001 C CNN
	1    21600 11300
	0    1    1    0   
$EndComp
$Comp
L my:Mini-DIN-9 J12
U 1 1 5D225132
P 21825 9375
F 0 "J12" H 21825 9856 50  0000 C CNN
F 1 "Mini-DIN-9" H 21825 9765 50  0001 C CNN
F 2 "my:minidin-9" V 21815 9365 50  0001 C CNN
F 3 "http://service.powerdynamics.com/ec/Catalog17/Section%2011.pdf" V 21815 9365 50  0001 C CNN
F 4 "AV" H 21825 9765 50  0000 C CNN "Desc"
	1    21825 9375
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J7
U 1 1 5D1962D4
P 21725 5925
F 0 "J7" H 21775 6342 50  0000 C CNN
F 1 "Conn_02x05_Top_Bottom" H 21775 6251 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 21725 5925 50  0001 C CNN
F 3 "~" H 21725 5925 50  0001 C CNN
F 4 "Joystick_HDR" H 21775 6251 50  0000 C CNN "Desc"
	1    21725 5925
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR057
U 1 1 5D1A2EAB
P 22025 5925
F 0 "#PWR057" H 22025 5675 50  0001 C CNN
F 1 "GND" V 22025 5750 39  0000 C CNN
F 2 "" H 22025 5925 50  0001 C CNN
F 3 "" H 22025 5925 50  0001 C CNN
	1    22025 5925
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R21
U 1 1 5D346D2A
P 19900 5125
F 0 "R21" V 19975 5075 39  0000 L CNN
F 1 "100k" V 19900 5050 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 19830 5125 50  0001 C CNN
F 3 "~" H 19900 5125 50  0001 C CNN
	1    19900 5125
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR046
U 1 1 5D3ADC2D
P 19900 4975
F 0 "#PWR046" H 19900 4825 50  0001 C CNN
F 1 "+5V" H 19915 5140 39  0000 C CNN
F 2 "" H 19900 4975 50  0001 C CNN
F 3 "" H 19900 4975 50  0001 C CNN
	1    19900 4975
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5D93D097
P 5500 3150
F 0 "R12" H 5375 3150 39  0000 C CNN
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
P 7350 1400
F 0 "U1" H 7350 1693 39  0000 C CNN
F 1 "74HCU04" H 7350 1618 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7350 1400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 7350 1400 50  0001 C CNN
	5    7350 1400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U1
U 4 1 5D9B4031
P 7350 1900
F 0 "U1" H 7350 2193 39  0000 C CNN
F 1 "74HCU04" H 7350 2118 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7350 1900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 7350 1900 50  0001 C CNN
	4    7350 1900
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
L Device:C C35
U 1 1 5D93D0BB
P 5500 3550
F 0 "C35" H 5400 3475 39  0000 C CNN
F 1 "47p" H 5375 3650 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5538 3400 50  0001 C CNN
F 3 "~" H 5500 3550 50  0001 C CNN
	1    5500 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:R R11
U 1 1 5D93D0A7
P 5200 2500
F 0 "R11" V 5275 2500 39  0000 C CNN
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
L Device:C C34
U 1 1 5D93D085
P 4900 3550
F 0 "C34" H 4800 3475 39  0000 C CNN
F 1 "33p" H 4800 3650 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4938 3400 50  0001 C CNN
F 3 "~" H 4900 3550 50  0001 C CNN
	1    4900 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:C C29
U 1 1 5A83A7CC
P 5500 2025
F 0 "C29" H 5400 1950 39  0000 C CNN
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
F 1 "14 MHz" H 5200 3500 39  0000 C CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 5200 3350 50  0001 C CNN
F 3 "~" H 5200 3350 50  0001 C CNN
	1    5200 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 61657146
P 4900 2175
F 0 "#PWR018" H 4900 1925 50  0001 C CNN
F 1 "GND" H 4905 2002 39  0001 C CNN
F 2 "" H 4900 2175 50  0001 C CNN
F 3 "" H 4900 2175 50  0001 C CNN
	1    4900 2175
	1    0    0    -1  
$EndComp
$Comp
L Device:C C28
U 1 1 616560FA
P 4900 2025
F 0 "C28" H 4800 1950 39  0000 C CNN
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
F 1 "17.734475 MHz" H 5200 1975 39  0000 C CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 5200 1825 50  0001 C CNN
F 3 "~" H 5200 1825 50  0001 C CNN
	1    5200 1825
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR047
U 1 1 5E0D9B29
P 21350 5200
F 0 "#PWR047" H 21350 4950 50  0001 C CNN
F 1 "GND" H 21350 5050 39  0000 C CNN
F 2 "" H 21350 5200 50  0001 C CNN
F 3 "" H 21350 5200 50  0001 C CNN
	1    21350 5200
	1    0    0    -1  
$EndComp
Entry Wire Line
	6600 1400 6700 1500
Entry Wire Line
	6600 2925 6700 3025
Text Label 6600 2925 2    39   ~ 0
CLK14
Text Label 6600 1400 2    39   ~ 0
CLK17
Entry Wire Line
	6700 1300 6800 1400
Text Label 6800 1400 0    39   ~ 0
CLKCPU0
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
L power:GND #PWR032
U 1 1 63A709C8
P 7325 3725
F 0 "#PWR032" H 7325 3475 50  0001 C CNN
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
	3400 1550 3300 1450
Entry Wire Line
	3400 1650 3300 1550
Entry Wire Line
	3400 2050 3300 1950
Entry Wire Line
	3400 1950 3300 1850
Text Label 3400 1950 0    39   ~ 0
~WAIT
Text Label 3400 2050 0    39   ~ 0
~BUSRQ
Text Label 3400 1650 0    39   ~ 0
~NMI
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
Text Notes 800  775  0    79   ~ 0
CPU
$Comp
L CPU:Z80CPU U4
U 1 1 5A82BF7B
P 2025 2525
F 0 "U4" H 2525 3950 50  0000 C CNN
F 1 "Z84C0010PEC " H 1600 3950 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 2025 2925 50  0001 C CNN
F 3 "www.zilog.com/manage_directlink.php?filepath=docs/z80/um0080" H 2025 2925 50  0001 C CNN
	1    2025 2525
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Network08 RN1
U 1 1 612FF54F
P 3875 1750
F 0 "RN1" V 3350 1675 50  0000 L CNN
F 1 "10k" V 4300 1700 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4350 1750 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3875 1750 50  0001 C CNN
	1    3875 1750
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 611DB6CF
P 4075 1350
F 0 "#PWR011" H 4075 1200 50  0001 C CNN
F 1 "+5V" V 4075 1525 39  0000 C CNN
F 2 "" H 4075 1350 50  0001 C CNN
F 3 "" H 4075 1350 50  0001 C CNN
	1    4075 1350
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5A823585
P 2025 1025
F 0 "#PWR06" H 2025 875 50  0001 C CNN
F 1 "+5V" H 2025 1175 39  0000 C CNN
F 2 "" H 2025 1025 50  0001 C CNN
F 3 "" H 2025 1025 50  0001 C CNN
	1    2025 1025
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5E4A4047
P 20050 925
F 0 "#PWR03" H 20050 775 50  0001 C CNN
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
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 20313 925 50  0001 C CNN
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
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 21213 925 50  0001 C CNN
F 3 "~" H 21175 1075 50  0001 C CNN
	1    21175 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C26
U 1 1 5E7112B3
P 19475 1900
F 0 "C26" H 19375 1825 39  0000 C CNN
F 1 "100n" H 19375 2000 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 19513 1750 50  0001 C CNN
F 3 "~" H 19475 1900 50  0001 C CNN
	1    19475 1900
	-1   0    0    1   
$EndComp
$Comp
L Device:C C18
U 1 1 5E61AF1E
P 20950 1075
F 0 "C18" H 20850 1000 39  0000 C CNN
F 1 "100n" H 20850 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 20988 925 50  0001 C CNN
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
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 20763 925 50  0001 C CNN
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
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 20538 925 50  0001 C CNN
F 3 "~" H 20500 1075 50  0001 C CNN
	1    20500 1075
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5E4A4041
P 20050 1225
F 0 "#PWR010" H 20050 975 50  0001 C CNN
F 1 "GND" H 20055 1052 39  0001 C CNN
F 2 "" H 20050 1225 50  0001 C CNN
F 3 "" H 20050 1225 50  0001 C CNN
	1    20050 1225
	1    0    0    -1  
$EndComp
$Comp
L Device:C C20
U 1 1 61609903
P 21400 1075
F 0 "C20" H 21300 1000 39  0000 C CNN
F 1 "100n" H 21300 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 21438 925 50  0001 C CNN
F 3 "~" H 21400 1075 50  0001 C CNN
	1    21400 1075
	-1   0    0    1   
$EndComp
$Comp
L Device:C C25
U 1 1 6150A2CF
P 19250 1900
F 0 "C25" H 19150 1825 39  0000 C CNN
F 1 "100n" H 19150 2000 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 19288 1750 50  0001 C CNN
F 3 "~" H 19250 1900 50  0001 C CNN
	1    19250 1900
	-1   0    0    1   
$EndComp
Entry Wire Line
	21100 8975 21200 9075
Entry Wire Line
	21100 9175 21200 9275
Entry Wire Line
	21100 9275 21200 9375
Entry Wire Line
	21100 9575 21200 9675
Text Label 21200 9075 0    39   ~ 0
SND_L
Text Label 21200 9275 0    39   ~ 0
SND_R
Text Label 21200 9375 0    39   ~ 0
SND_MONO
Text Label 21200 9675 0    39   ~ 0
VID_SYNC
Entry Wire Line
	22400 9275 22500 9375
Entry Wire Line
	22400 9375 22500 9475
Entry Wire Line
	22400 9475 22500 9575
Entry Wire Line
	22400 9675 22500 9775
Text Label 22400 9275 2    39   ~ 0
VID_R
Text Label 22400 9375 2    39   ~ 0
VID_G
Text Label 22400 9475 2    39   ~ 0
VID_B
Text Label 22400 9675 2    39   ~ 0
VID_COMP
Entry Wire Line
	21100 10850 21200 10950
Text Label 21200 10950 0    39   ~ 0
SND_L
Text Label 21200 11500 0    39   ~ 0
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
Entry Wire Line
	21100 5625 21200 5725
Text Label 21200 5725 0    39   ~ 0
~JOY_UP
Entry Wire Line
	21100 5725 21200 5825
Entry Wire Line
	21100 5825 21200 5925
Text Label 21200 6125 0    39   ~ 0
~JOY_B3
Entry Wire Line
	21100 6025 21200 6125
Text Label 22400 6025 2    39   ~ 0
~JOY_B2
Entry Wire Line
	22500 5825 22400 5725
Text Label 21200 6025 0    39   ~ 0
~JOY_RIGHT
Text Label 22400 5725 2    39   ~ 0
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
	21100 11875 21200 11975
Entry Wire Line
	21100 11975 21200 12075
Entry Wire Line
	21100 12575 21200 12675
Entry Wire Line
	21100 12675 21200 12775
Entry Wire Line
	21100 12775 21200 12875
Entry Wire Line
	21100 12875 21200 12975
Entry Wire Line
	21100 13675 21200 13775
Entry Wire Line
	21100 13775 21200 13875
Entry Wire Line
	21100 13875 21200 13975
Entry Wire Line
	21100 13975 21200 14075
Entry Wire Line
	21100 14075 21200 14175
Entry Wire Line
	21100 14175 21200 14275
Entry Wire Line
	21100 14275 21200 14375
Entry Wire Line
	21100 14375 21200 14475
Entry Wire Line
	21100 14475 21200 14575
Entry Wire Line
	21100 14575 21200 14675
Entry Wire Line
	21100 12975 21200 13075
Entry Wire Line
	21100 13075 21200 13175
Entry Wire Line
	22400 11975 22500 12075
Entry Wire Line
	22400 12075 22500 12175
Entry Wire Line
	22400 12175 22500 12275
Entry Wire Line
	22400 12475 22500 12575
Entry Wire Line
	22400 12575 22500 12675
Entry Wire Line
	22400 12675 22500 12775
Entry Wire Line
	22400 12775 22500 12875
Entry Wire Line
	22400 12875 22500 12975
Entry Wire Line
	22400 12975 22500 13075
Entry Wire Line
	22400 13075 22500 13175
Entry Wire Line
	22400 13175 22500 13275
Entry Wire Line
	22400 13275 22500 13375
Entry Wire Line
	22400 13375 22500 13475
Entry Wire Line
	22400 13475 22500 13575
Entry Wire Line
	22400 13575 22500 13675
Entry Wire Line
	22400 14275 22500 14375
Entry Wire Line
	22400 14375 22500 14475
Entry Wire Line
	22400 14475 22500 14575
Entry Wire Line
	22400 14575 22500 14675
Entry Wire Line
	22400 13675 22500 13775
Entry Wire Line
	22400 13775 22500 13875
Text Label 21200 11975 0    39   ~ 0
A14
Text Label 21200 12075 0    39   ~ 0
A12
Text Label 21200 12775 0    39   ~ 0
A0
Text Label 21200 12875 0    39   ~ 0
A1
Text Label 21200 12975 0    39   ~ 0
A2
Text Label 21200 13075 0    39   ~ 0
A3
Text Label 21200 13175 0    39   ~ 0
~IORQGE
Text Label 21200 13775 0    39   ~ 0
~BUSRQ
Text Label 21200 13875 0    39   ~ 0
~RSTCPU
Text Label 21200 13975 0    39   ~ 0
A7
Text Label 21200 14075 0    39   ~ 0
A6
Text Label 21200 14175 0    39   ~ 0
A5
Text Label 21200 14275 0    39   ~ 0
A4
Text Label 21200 14375 0    39   ~ 0
~ROMCS
Text Label 21200 14475 0    39   ~ 0
~BUSACK
Text Label 21200 14575 0    39   ~ 0
A9
Text Label 21200 14675 0    39   ~ 0
A11
Text Label 22400 14575 2    39   ~ 0
A10
Text Label 22400 14475 2    39   ~ 0
A8
Text Label 22400 14375 2    39   ~ 0
~RFSH
Text Label 22400 14275 2    39   ~ 0
~M1
Text Label 22400 13775 2    39   ~ 0
~WR
Text Label 22400 13675 2    39   ~ 0
~RD
Text Label 22400 13575 2    39   ~ 0
~IORQ
Text Label 22400 13475 2    39   ~ 0
~MREQ
Text Label 22400 13375 2    39   ~ 0
~HALT
Text Label 22400 13275 2    39   ~ 0
~NMI
Text Label 22400 13175 2    39   ~ 0
~INT
Text Label 22400 13075 2    39   ~ 0
D4
Text Label 22400 12975 2    39   ~ 0
D3
Text Label 22400 12875 2    39   ~ 0
D5
Text Label 22400 12775 2    39   ~ 0
D6
Text Label 22400 12675 2    39   ~ 0
D2
Text Label 22400 12575 2    39   ~ 0
D1
Text Label 22400 12475 2    39   ~ 0
D0
Text Label 22400 12175 2    39   ~ 0
D7
Text Label 22400 12075 2    39   ~ 0
A13
Text Label 22400 11975 2    39   ~ 0
A15
Entry Wire Line
	22400 13975 22500 14075
Text Label 22400 13975 2    39   ~ 0
~WAIT
$Comp
L power:+5V #PWR068
U 1 1 5A831FC4
P 5650 7625
F 0 "#PWR068" H 5650 7475 50  0001 C CNN
F 1 "+5V" H 5650 7775 39  0000 C CNN
F 2 "" H 5650 7625 50  0001 C CNN
F 3 "" H 5650 7625 50  0001 C CNN
	1    5650 7625
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR078
U 1 1 5A835143
P 5650 9825
F 0 "#PWR078" H 5650 9575 50  0001 C CNN
F 1 "GND" H 5655 9652 39  0001 C CNN
F 2 "" H 5650 9825 50  0001 C CNN
F 3 "" H 5650 9825 50  0001 C CNN
	1    5650 9825
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR061
U 1 1 65F871EC
P 5300 6525
F 0 "#PWR061" H 5300 6275 50  0001 C CNN
F 1 "GND" H 5305 6352 39  0001 C CNN
F 2 "" H 5300 6525 50  0001 C CNN
F 3 "" H 5300 6525 50  0001 C CNN
	1    5300 6525
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR060
U 1 1 65FFD58E
P 4950 6525
F 0 "#PWR060" H 4950 6275 50  0001 C CNN
F 1 "GND" H 4955 6352 39  0001 C CNN
F 2 "" H 4950 6525 50  0001 C CNN
F 3 "" H 4950 6525 50  0001 C CNN
	1    4950 6525
	-1   0    0    -1  
$EndComp
Text Label 6525 8525 2    39   ~ 0
VD0
Text Label 6525 7825 2    39   ~ 0
VD1
Text Label 6525 8325 2    39   ~ 0
VD4
Text Label 6525 8025 2    39   ~ 0
VD5
Text Label 6525 8225 2    39   ~ 0
VD6
Text Label 6525 8125 2    39   ~ 0
VD7
Entry Wire Line
	6525 8525 6625 8625
Entry Wire Line
	6525 8425 6625 8525
Entry Wire Line
	6525 8325 6625 8425
Entry Wire Line
	6525 8225 6625 8325
Entry Wire Line
	6525 8125 6625 8225
Entry Wire Line
	6525 8025 6625 8125
Entry Wire Line
	6525 7925 6625 8025
Entry Wire Line
	6525 7825 6625 7925
Text Label 8025 5075 2    39   ~ 0
D0
Text Label 8025 5175 2    39   ~ 0
D1
Text Label 8025 5275 2    39   ~ 0
D2
Text Label 8025 5375 2    39   ~ 0
D3
Text Label 8025 5475 2    39   ~ 0
D4
Text Label 8025 5575 2    39   ~ 0
D5
Text Label 8025 5675 2    39   ~ 0
D6
Text Label 8025 5775 2    39   ~ 0
D7
Entry Wire Line
	8025 5775 8125 5875
Entry Wire Line
	8025 5675 8125 5775
Entry Wire Line
	8025 5575 8125 5675
Entry Wire Line
	8025 5475 8125 5575
Entry Wire Line
	8025 5375 8125 5475
Entry Wire Line
	8025 5275 8125 5375
Entry Wire Line
	8025 5175 8125 5275
Entry Wire Line
	8025 5075 8125 5175
Entry Wire Line
	7225 7575 7125 7475
Entry Wire Line
	7225 7675 7125 7575
Entry Wire Line
	7225 7775 7125 7675
Entry Wire Line
	7225 7875 7125 7775
Entry Wire Line
	7225 7975 7125 7875
Entry Wire Line
	7225 8075 7125 7975
Entry Wire Line
	7225 8175 7125 8075
Text Label 7225 8175 0    39   ~ 0
D6
Text Label 7225 8075 0    39   ~ 0
D5
Text Label 7225 7975 0    39   ~ 0
D4
Text Label 7225 7875 0    39   ~ 0
D3
Text Label 7225 7775 0    39   ~ 0
D2
Text Label 7225 7675 0    39   ~ 0
D1
Text Label 7225 7575 0    39   ~ 0
D0
Text Label 8025 7575 2    39   ~ 0
VD0
Text Label 8025 7675 2    39   ~ 0
VD1
Text Label 8025 7775 2    39   ~ 0
VD2
Text Label 8025 7875 2    39   ~ 0
VD3
Text Label 8025 7975 2    39   ~ 0
VD4
Text Label 8025 8075 2    39   ~ 0
VD5
Text Label 8025 8175 2    39   ~ 0
VD6
Entry Wire Line
	8025 8175 8125 8275
Entry Wire Line
	8025 8075 8125 8175
Entry Wire Line
	8025 7975 8125 8075
Entry Wire Line
	8025 7875 8125 7975
Entry Wire Line
	8025 7775 8125 7875
Entry Wire Line
	8025 7675 8125 7775
Entry Wire Line
	8025 7575 8125 7675
Entry Wire Line
	6525 8925 6625 9025
Entry Wire Line
	6525 9025 6625 9125
Text Label 6525 8925 2    39   ~ 0
~VRD
Text Label 6525 9025 2    39   ~ 0
~VWR
Entry Wire Line
	8025 6325 8125 6425
Text Label 8025 6325 2    39   ~ 0
~WR
Entry Wire Line
	8025 5975 8125 6075
Entry Wire Line
	8025 6075 8125 6175
Text Label 8025 6075 2    39   ~ 0
~ROMCS
Entry Wire Line
	8025 6175 8125 6275
Text Label 8025 6175 2    39   ~ 0
~RD
Text Label 8025 5975 2    39   ~ 0
~ROMCS0
Text Notes 4800 4600 0    79   ~ 0
MEMORY
Entry Wire Line
	5625 6575 5725 6675
Text Label 5725 6675 0    39   ~ 0
RA16
Entry Wire Line
	5625 4975 5725 5075
Entry Wire Line
	5625 5075 5725 5175
Entry Wire Line
	5625 5175 5725 5275
Entry Wire Line
	5625 5275 5725 5375
Entry Wire Line
	5625 5375 5725 5475
Entry Wire Line
	5625 5475 5725 5575
Entry Wire Line
	5625 5575 5725 5675
Entry Wire Line
	5625 5675 5725 5775
Entry Wire Line
	5625 5775 5725 5875
Entry Wire Line
	5625 5875 5725 5975
Entry Wire Line
	5625 5975 5725 6075
Entry Wire Line
	5625 6075 5725 6175
Entry Wire Line
	5625 6175 5725 6275
Entry Wire Line
	5625 6275 5725 6375
Entry Wire Line
	5625 6375 5725 6475
Entry Wire Line
	5625 6475 5725 6575
Text Label 5725 5075 0    39   ~ 0
A0
Text Label 5725 5175 0    39   ~ 0
A1
Text Label 5725 5275 0    39   ~ 0
A2
Text Label 5725 5375 0    39   ~ 0
A3
Text Label 5725 5475 0    39   ~ 0
A4
Text Label 5725 5575 0    39   ~ 0
A5
Text Label 5725 5675 0    39   ~ 0
A6
Text Label 5725 5775 0    39   ~ 0
A7
Text Label 5725 5875 0    39   ~ 0
A8
Text Label 5725 5975 0    39   ~ 0
A9
Text Label 5725 6075 0    39   ~ 0
A10
Text Label 5725 6175 0    39   ~ 0
A11
Text Label 5725 6275 0    39   ~ 0
A12
Text Label 5725 6375 0    39   ~ 0
A13
Text Label 5725 6475 0    39   ~ 0
RA14
$Comp
L Device:Jumper JP5
U 1 1 659F823A
P 7525 6325
F 0 "JP5" H 7525 6250 39  0000 C CNN
F 1 "Jumper" H 7525 6498 39  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7525 6325 50  0001 C CNN
F 3 "~" H 7525 6325 50  0001 C CNN
	1    7525 6325
	1    0    0    -1  
$EndComp
$Comp
L my:29C040 U9
U 1 1 5EE8E509
P 6525 5975
F 0 "U9" H 6150 7050 51  0000 C CNN
F 1 "SST39SF040" H 6825 7050 51  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_Socket" H 6525 6275 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/25022B.pdf" H 6525 6275 50  0001 C CNN
F 4 ">=64K <=70ns EPROM/FLASH in DIP28 or DIP32" H 6525 4700 39  0000 C CNN "Desc"
	1    6525 5975
	1    0    0    -1  
$EndComp
$Comp
L Device:R R22
U 1 1 5E7B9EA3
P 7525 5975
F 0 "R22" V 7600 5925 39  0000 L CNN
F 1 "470" V 7525 5925 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7455 5975 50  0001 C CNN
F 3 "~" H 7525 5975 50  0001 C CNN
	1    7525 5975
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR042
U 1 1 5A827B63
P 6525 4875
F 0 "#PWR042" H 6525 4725 50  0001 C CNN
F 1 "+5V" H 6525 5025 39  0000 C CNN
F 2 "" H 6525 4875 50  0001 C CNN
F 3 "" H 6525 4875 50  0001 C CNN
	1    6525 4875
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR065
U 1 1 5A827A72
P 6525 7075
F 0 "#PWR065" H 6525 6825 50  0001 C CNN
F 1 "GND" H 6530 6902 39  0001 C CNN
F 2 "" H 6525 7075 50  0001 C CNN
F 3 "" H 6525 7075 50  0001 C CNN
	1    6525 7075
	1    0    0    -1  
$EndComp
Entry Wire Line
	4750 9325 4850 9425
Text Label 4850 9425 0    39   ~ 0
VA16
Entry Wire Line
	4750 7725 4850 7825
Entry Wire Line
	4750 7825 4850 7925
Entry Wire Line
	4750 7925 4850 8025
Entry Wire Line
	4750 8025 4850 8125
Entry Wire Line
	4750 8125 4850 8225
Entry Wire Line
	4750 8225 4850 8325
Entry Wire Line
	4750 8325 4850 8425
Entry Wire Line
	4750 8425 4850 8525
Entry Wire Line
	4750 8525 4850 8625
Entry Wire Line
	4750 8625 4850 8725
Entry Wire Line
	4750 8725 4850 8825
Entry Wire Line
	4750 8825 4850 8925
Entry Wire Line
	4750 8925 4850 9025
Entry Wire Line
	4750 9025 4850 9125
Entry Wire Line
	4750 9125 4850 9225
Entry Wire Line
	4750 9225 4850 9325
Text Label 4850 8225 0    39   ~ 0
VA10
Text Label 4850 8725 0    39   ~ 0
VA2
Text Label 4850 8925 0    39   ~ 0
VA3
Text Label 4850 8825 0    39   ~ 0
VA4
Text Label 4850 9025 0    39   ~ 0
VA5
Text Label 4850 9225 0    39   ~ 0
VA6
Text Label 4850 8125 0    39   ~ 0
VA9
Text Label 4850 8325 0    39   ~ 0
VA11
Text Label 4850 7925 0    39   ~ 0
VA15
Text Label 4850 7825 0    39   ~ 0
VA14
Text Label 4850 8525 0    39   ~ 0
VA13
Text Label 4850 8025 0    39   ~ 0
VA8
Text Label 4850 9325 0    39   ~ 0
VA7
Text Label 4850 8425 0    39   ~ 0
VA12
Entry Wire Line
	4750 9425 4850 9525
Text Label 4850 9625 0    39   ~ 0
VA17
Entry Wire Line
	4750 9525 4850 9625
Text Label 4850 9525 0    39   ~ 0
VA18
$Comp
L power:GND #PWR082
U 1 1 91723150
P 1850 12150
F 0 "#PWR082" H 1850 11900 50  0001 C CNN
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
	825  9500 725  9400
Entry Wire Line
	825  9400 725  9300
Entry Wire Line
	825  9300 725  9200
Entry Wire Line
	725  5800 825  5900
Text Label 825  5900 0    39   ~ 0
CLK17
Text Label 4475 10900 2    39   ~ 0
VD4
Text Label 4475 11200 2    39   ~ 0
VD2
Text Label 4475 11300 2    39   ~ 0
VD0
Text Notes 725  4625 0    79   ~ 0
CPLD
Entry Wire Line
	725  6100 825  6200
$Comp
L EPM3256ATC144:EPM3256ATC144 U11
U 1 1 9170CED9
P 2650 8600
F 0 "U11" H 2650 12481 50  0000 C CNN
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
L power:+5V #PWR021
U 1 1 63A70551
P 7325 2725
F 0 "#PWR021" H 7325 2575 50  0001 C CNN
F 1 "+5V" H 7325 2875 39  0000 C CNN
F 2 "" H 7325 2725 50  0001 C CNN
F 3 "" H 7325 2725 50  0001 C CNN
	1    7325 2725
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
Entry Wire Line
	4575 8900 4475 8800
Entry Wire Line
	4575 8800 4475 8700
Text Label 4475 11400 2    39   ~ 0
VA4
Text Label 825  6200 0    39   ~ 0
VA3
Text Label 825  6100 0    39   ~ 0
~VRD
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
Entry Wire Line
	725  6000 825  6100
Entry Wire Line
	725  6200 825  6300
NoConn ~ 22100 14175
Text Label 21200 12675 0    39   ~ 0
~CLKCPU
Text Label 825  5800 0    39   ~ 0
~RST
Text Label 825  5700 0    39   ~ 0
~MAGIC
Text Label 4475 10800 2    39   ~ 0
~RD
Text Label 4475 10700 2    39   ~ 0
~WR
Text Label 825  9200 0    39   ~ 0
~M1
Text Label 825  9100 0    39   ~ 0
~NMI
Text Label 825  9000 0    39   ~ 0
~INT
Text Label 825  9900 0    39   ~ 0
~RSTCPU
Text Label 4475 10600 2    39   ~ 0
CLKCPU0
Entry Wire Line
	11700 6150 11800 6250
Entry Wire Line
	11700 6250 11800 6350
Entry Wire Line
	11700 6350 11800 6450
Entry Wire Line
	11700 6450 11800 6550
Entry Wire Line
	11700 6550 11800 6650
Entry Wire Line
	11700 6650 11800 6750
Entry Wire Line
	11700 6750 11800 6850
Entry Wire Line
	11700 6850 11800 6950
Entry Bus Bus
	11800 6950 11900 7050
Entry Bus Bus
	9525 5900 9625 6000
Entry Wire Line
	9625 6050 9725 6150
Entry Wire Line
	9625 6150 9725 6250
Entry Wire Line
	9625 6250 9725 6350
Entry Wire Line
	9625 6350 9725 6450
Text Label 11700 6850 2    39   ~ 0
D7
Text Label 11700 6750 2    39   ~ 0
D6
Text Label 11700 6650 2    39   ~ 0
D5
Text Label 11700 6550 2    39   ~ 0
D4
Text Label 11700 6450 2    39   ~ 0
D3
Text Label 11700 6350 2    39   ~ 0
D2
Text Label 11700 6250 2    39   ~ 0
D1
Text Label 11700 6150 2    39   ~ 0
D0
Text Label 9725 6450 0    39   ~ 0
~WR
Text Label 9725 6350 0    39   ~ 0
~RD
Text Label 9725 6250 0    39   ~ 0
A6
Text Label 9725 6150 0    39   ~ 0
A5
Text Label 11800 7000 2    39   ~ 0
VG_INTRQ
$Comp
L power:+5V #PWR070
U 1 1 651CAE2F
P 10075 7700
F 0 "#PWR070" H 10075 7550 50  0001 C CNN
F 1 "+5V" H 10090 7865 39  0001 C CNN
F 2 "" H 10075 7700 50  0001 C CNN
F 3 "" H 10075 7700 50  0001 C CNN
	1    10075 7700
	0    -1   -1   0   
$EndComp
NoConn ~ 11275 8200
Entry Wire Line
	11800 8100 11900 8200
Entry Wire Line
	11800 8000 11900 8100
Entry Wire Line
	11800 7900 11900 8000
Entry Wire Line
	11800 7800 11900 7900
Entry Wire Line
	11800 7550 11900 7650
Entry Wire Line
	11800 7450 11900 7550
Entry Wire Line
	11800 7350 11900 7450
Entry Wire Line
	11800 7250 11900 7350
Entry Wire Line
	11800 7100 11900 7200
Entry Wire Line
	11800 7000 11900 7100
Entry Wire Line
	9525 7950 9625 8050
Entry Wire Line
	9525 7850 9625 7950
Entry Wire Line
	9525 7750 9625 7850
Entry Wire Line
	9525 7450 9625 7550
Entry Wire Line
	9525 7350 9625 7450
Entry Wire Line
	9525 7200 9625 7300
Entry Wire Line
	9525 6900 9625 7000
Entry Wire Line
	9525 6800 9625 6900
Entry Wire Line
	9525 6450 9625 6550
Entry Wire Line
	9525 6700 9625 6800
Text Label 9625 7150 0    39   ~ 0
VG_WF_DE
Entry Wire Line
	9525 7050 9625 7150
Entry Wire Line
	9525 6600 9625 6700
Text Label 9625 6700 0    39   ~ 0
VG_INDEX
Text Label 13200 8125 0    39   ~ 0
VG_WF_DE
Entry Wire Line
	13100 8225 13200 8325
Text Label 13200 7725 0    39   ~ 0
FD_INDEX
Text Label 13200 8425 0    39   ~ 0
FD_RDAT
Text Label 13200 7200 0    39   ~ 0
FD_RDAT
Entry Wire Line
	13100 7100 13200 7200
Entry Wire Line
	13100 8125 13200 8225
Entry Wire Line
	13100 8025 13200 8125
Entry Wire Line
	13100 8325 13200 8425
Entry Wire Line
	13100 7725 13200 7825
Entry Wire Line
	13100 7625 13200 7725
Entry Wire Line
	11900 7500 12000 7600
Entry Wire Line
	11900 7175 12000 7275
Entry Wire Line
	11900 6850 12000 6950
Entry Wire Line
	11900 6525 12000 6625
Entry Wire Line
	11900 6200 12000 6300
Entry Wire Line
	11900 5850 12000 5950
Text Label 13200 7100 0    39   ~ 0
FD_WPT
Entry Wire Line
	13100 7000 13200 7100
Text Label 13200 7000 0    39   ~ 0
FD_TR00
Entry Wire Line
	13100 6900 13200 7000
$Comp
L Device:R_Network08 RN3
U 1 1 619201BB
P 13975 8125
F 0 "RN3" V 13450 8050 50  0000 L CNN
F 1 "4.7k" V 14400 8050 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 14450 8125 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 13975 8125 50  0001 C CNN
	1    13975 8125
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR071
U 1 1 61922E47
P 14175 7725
F 0 "#PWR071" H 14175 7575 50  0001 C CNN
F 1 "+5V" H 14190 7890 39  0001 C CNN
F 2 "" H 14175 7725 50  0001 C CNN
F 3 "" H 14175 7725 50  0001 C CNN
	1    14175 7725
	0    1    1    0   
$EndComp
NoConn ~ 13525 7400
NoConn ~ 13525 5800
$Comp
L power:+12V #PWR056
U 1 1 61123D97
P 10775 5900
F 0 "#PWR056" H 10775 5750 50  0001 C CNN
F 1 "+12V" H 10750 6050 39  0000 C CNN
F 2 "" H 10775 5900 50  0001 C CNN
F 3 "" H 10775 5900 50  0001 C CNN
	1    10775 5900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR055
U 1 1 6108AEFB
P 10575 5900
F 0 "#PWR055" H 10575 5750 50  0001 C CNN
F 1 "+5V" H 10575 6050 39  0000 C CNN
F 2 "" H 10575 5900 50  0001 C CNN
F 3 "" H 10575 5900 50  0001 C CNN
	1    10575 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR073
U 1 1 6103D95A
P 10675 8450
F 0 "#PWR073" H 10675 8200 50  0001 C CNN
F 1 "GND" H 10680 8277 39  0001 C CNN
F 2 "" H 10675 8450 50  0001 C CNN
F 3 "" H 10675 8450 50  0001 C CNN
	1    10675 8450
	1    0    0    -1  
$EndComp
NoConn ~ 13525 6000
$Comp
L my:1818VG93 U10
U 1 1 60DAA59C
P 10675 7300
F 0 "U10" H 10250 8600 39  0000 C CNN
F 1 "MB8877A" H 11000 8600 39  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 10675 7450 39  0001 C CNN
F 3 "" H 10675 7450 39  0001 C CNN
	1    10675 7300
	1    0    0    -1  
$EndComp
Text Notes 9550 5450 0    79   ~ 0
BETA DISK INTERFACE
Text Label 11800 7450 2    39   ~ 0
FD_DIR
Text Label 11800 7350 2    39   ~ 0
FD_STEP
Text Label 11800 7250 2    39   ~ 0
FD_MOTOR
Text Label 9625 8050 0    39   ~ 0
FD_MOTOR
Text Label 9625 6900 0    39   ~ 0
FD_WPT
Text Label 9625 6550 0    39   ~ 0
VG_CS
Text Label 9625 6800 0    39   ~ 0
FD_TR00
Text Label 9625 7300 0    39   ~ 0
VG_CLK
$Comp
L 74xx:74HC04 U2
U 1 1 614C5547
P 12600 6625
F 0 "U2" H 12600 6775 39  0000 C CNN
F 1 "74HCT05" H 12600 6625 39  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 12600 6625 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 12600 6625 50  0001 C CNN
	1    12600 6625
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U2
U 2 1 6186236B
P 12600 6300
F 0 "U2" H 12600 6450 39  0000 C CNN
F 1 "74HCT05" H 12575 6300 39  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 12600 6300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 12600 6300 50  0001 C CNN
	2    12600 6300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U2
U 3 1 61867695
P 12600 6950
F 0 "U2" H 12600 7100 39  0000 C CNN
F 1 "74HCT05" H 12600 7150 39  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 12600 6950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 12600 6950 50  0001 C CNN
	3    12600 6950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U2
U 5 1 6186CE1D
P 12600 7275
F 0 "U2" H 12600 7425 39  0000 C CNN
F 1 "74HCT05" H 12575 7275 39  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 12600 7275 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 12600 7275 50  0001 C CNN
	5    12600 7275
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U2
U 6 1 6186FC01
P 12600 5950
F 0 "U2" H 12600 6100 39  0000 C CNN
F 1 "74HCT05" H 12600 6175 39  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 12600 5950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 12600 5950 50  0001 C CNN
	6    12600 5950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U2
U 4 1 6186A295
P 12600 7600
F 0 "U2" H 12600 7750 39  0000 C CNN
F 1 "74HCT05" H 12575 7600 39  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 12600 7600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 12600 7600 50  0001 C CNN
	4    12600 7600
	1    0    0    -1  
$EndComp
Text Label 12000 5950 0    39   ~ 0
FD_MOTOR
Text Label 12000 6300 0    39   ~ 0
FD_DIR
Text Label 12000 6625 0    39   ~ 0
FD_STEP
Text Label 12000 6950 0    39   ~ 0
FD_WDAT
Text Label 12000 7275 0    39   ~ 0
FD_WSTB
Text Label 12000 7600 0    39   ~ 0
FD_SIDE
Text Label 13200 6400 0    39   ~ 0
FD_DISK0
Entry Wire Line
	13100 6300 13200 6400
Text Label 13200 6300 0    39   ~ 0
FD_DISK1
Entry Wire Line
	13100 6200 13200 6300
Text Label 9625 7950 0    39   ~ 0
VG_RST
Text Label 9625 7850 0    39   ~ 0
VG_HLT
Text Label 9625 7000 0    39   ~ 0
VG_DDEN
Text Label 9625 7450 0    39   ~ 0
VG_RCLK
Text Label 9625 7550 0    39   ~ 0
VG_RAWR
Text Label 11800 7800 2    39   ~ 0
VG_TR43
Text Label 11800 7900 2    39   ~ 0
VG_SL
Text Label 11800 8000 2    39   ~ 0
VG_SR
Text Label 11800 8100 2    39   ~ 0
VG_WD
$Comp
L power:+5V #PWR083
U 1 1 632B7B4B
P 21600 12175
F 0 "#PWR083" H 21600 12025 50  0001 C CNN
F 1 "+5V" V 21600 12300 39  0000 L CNN
F 2 "" H 21600 12175 50  0001 C CNN
F 3 "" H 21600 12175 50  0001 C CNN
	1    21600 12175
	0    -1   -1   0   
$EndComp
$Comp
L power:+9V #PWR084
U 1 1 632BA68A
P 21600 12275
F 0 "#PWR084" H 21600 12125 50  0001 C CNN
F 1 "+9V" V 21600 12400 39  0000 L CNN
F 2 "" H 21600 12275 50  0001 C CNN
F 3 "" H 21600 12275 50  0001 C CNN
	1    21600 12275
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R40
U 1 1 62053588
P 7575 7575
F 0 "R40" V 7525 7350 39  0000 L CNN
F 1 "1k" V 7575 7525 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 7575 50  0001 C CNN
F 3 "~" H 7575 7575 50  0001 C CNN
	1    7575 7575
	0    -1   1    0   
$EndComp
$Comp
L Device:R R41
U 1 1 62053582
P 7575 7675
F 0 "R41" V 7525 7450 39  0000 L CNN
F 1 "1k" V 7575 7625 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 7675 50  0001 C CNN
F 3 "~" H 7575 7675 50  0001 C CNN
	1    7575 7675
	0    -1   1    0   
$EndComp
$Comp
L Device:R R42
U 1 1 6205357C
P 7575 7775
F 0 "R42" V 7525 7550 39  0000 L CNN
F 1 "1k" V 7575 7725 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 7775 50  0001 C CNN
F 3 "~" H 7575 7775 50  0001 C CNN
	1    7575 7775
	0    -1   1    0   
$EndComp
$Comp
L Device:R R43
U 1 1 62053576
P 7575 7875
F 0 "R43" V 7525 7650 39  0000 L CNN
F 1 "1k" V 7575 7825 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 7875 50  0001 C CNN
F 3 "~" H 7575 7875 50  0001 C CNN
	1    7575 7875
	0    -1   1    0   
$EndComp
$Comp
L Device:R R44
U 1 1 62053570
P 7575 7975
F 0 "R44" V 7525 7750 39  0000 L CNN
F 1 "1k" V 7575 7925 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 7975 50  0001 C CNN
F 3 "~" H 7575 7975 50  0001 C CNN
	1    7575 7975
	0    -1   1    0   
$EndComp
$Comp
L Device:R R45
U 1 1 6205356A
P 7575 8075
F 0 "R45" V 7525 7850 39  0000 L CNN
F 1 "1k" V 7575 8025 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 8075 50  0001 C CNN
F 3 "~" H 7575 8075 50  0001 C CNN
	1    7575 8075
	0    -1   1    0   
$EndComp
$Comp
L Device:R R46
U 1 1 62053564
P 7575 8175
F 0 "R46" V 7525 7950 39  0000 L CNN
F 1 "1k" V 7575 8125 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 8175 50  0001 C CNN
F 3 "~" H 7575 8175 50  0001 C CNN
	1    7575 8175
	0    -1   1    0   
$EndComp
Text Label 7225 8275 0    39   ~ 0
D7
Text Label 8025 8275 2    39   ~ 0
VD7
Entry Wire Line
	8025 8275 8125 8375
$Comp
L Device:R R47
U 1 1 6205355E
P 7575 8275
F 0 "R47" V 7525 8050 39  0000 L CNN
F 1 "1k" V 7575 8225 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 8275 50  0001 C CNN
F 3 "~" H 7575 8275 50  0001 C CNN
	1    7575 8275
	0    -1   1    0   
$EndComp
Entry Wire Line
	7225 8275 7125 8175
Text Label 5725 6575 0    39   ~ 0
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
	3675 1550 3400 1550
Wire Wire Line
	3400 1650 3675 1650
Wire Wire Line
	3400 2050 3675 2050
Wire Wire Line
	3400 1950 3675 1950
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
Wire Bus Line
	3300 825  4400 825 
Wire Bus Line
	4400 825  4400 4175
Connection ~ 21400 925 
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
Connection ~ 21400 1225
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
	21100 3100 22500 3100
Wire Wire Line
	21200 9675 21750 9675
Wire Wire Line
	21200 9375 21525 9375
Wire Wire Line
	21525 9275 21200 9275
Wire Wire Line
	21200 9075 21825 9075
Wire Wire Line
	22125 9475 22400 9475
Wire Wire Line
	22400 9375 22125 9375
Wire Wire Line
	22125 9275 22400 9275
Wire Wire Line
	21600 10950 21200 10950
Wire Wire Line
	21200 5725 21525 5725
Wire Wire Line
	21200 5925 21525 5925
Wire Wire Line
	21200 6125 21525 6125
Wire Wire Line
	21200 4850 21425 4850
Wire Wire Line
	21200 4650 21575 4650
Wire Wire Line
	21200 4550 21700 4550
Wire Wire Line
	21200 4450 21350 4450
Wire Wire Line
	21200 11975 21600 11975
Wire Wire Line
	21200 12075 21600 12075
Wire Wire Line
	21200 12675 21600 12675
Wire Wire Line
	21200 12775 21600 12775
Wire Wire Line
	21200 12875 21600 12875
Wire Wire Line
	21200 12975 21600 12975
Wire Wire Line
	21200 13775 21600 13775
Wire Wire Line
	21200 13875 21600 13875
Wire Wire Line
	21200 13975 21600 13975
Wire Wire Line
	21200 14075 21600 14075
Wire Wire Line
	21200 14175 21600 14175
Wire Wire Line
	21200 14275 21600 14275
Wire Wire Line
	21200 14375 21600 14375
Wire Wire Line
	21200 14475 21600 14475
Wire Wire Line
	21200 14575 21600 14575
Wire Wire Line
	21200 14675 21600 14675
Wire Wire Line
	21200 13075 21600 13075
Wire Wire Line
	21200 13175 21600 13175
Wire Wire Line
	22400 11975 22100 11975
Wire Wire Line
	22400 12075 22100 12075
Wire Wire Line
	22400 12175 22100 12175
Wire Wire Line
	22400 12475 22100 12475
Wire Wire Line
	22400 12575 22100 12575
Wire Wire Line
	22400 12675 22100 12675
Wire Wire Line
	22400 12775 22100 12775
Wire Wire Line
	22400 12875 22100 12875
Wire Wire Line
	22400 12975 22100 12975
Wire Wire Line
	22400 13075 22100 13075
Wire Wire Line
	22400 13175 22100 13175
Wire Wire Line
	22400 13275 22100 13275
Wire Wire Line
	22400 13375 22100 13375
Wire Wire Line
	22400 13475 22100 13475
Wire Wire Line
	22400 13575 22100 13575
Wire Wire Line
	22400 14275 22100 14275
Wire Wire Line
	22400 14375 22100 14375
Wire Wire Line
	22400 14475 22100 14475
Wire Wire Line
	22400 14575 22100 14575
Wire Wire Line
	22400 13675 22100 13675
Wire Wire Line
	22400 13775 22100 13775
Wire Wire Line
	22400 13975 22100 13975
Wire Wire Line
	5925 6775 5450 6775
Wire Wire Line
	5100 6875 5925 6875
Connection ~ 4750 7325
Wire Wire Line
	6525 8525 6250 8525
Wire Wire Line
	6525 8425 6250 8425
Wire Wire Line
	6250 8325 6525 8325
Wire Wire Line
	6525 8225 6250 8225
Wire Wire Line
	6250 8125 6525 8125
Wire Wire Line
	6525 8025 6250 8025
Wire Wire Line
	6525 7925 6250 7925
Wire Wire Line
	6250 7825 6525 7825
Wire Wire Line
	6525 8925 6250 8925
Wire Wire Line
	6525 9025 6250 9025
Wire Wire Line
	7175 6275 7125 6275
Wire Wire Line
	7175 6325 7175 6275
Wire Wire Line
	7225 6325 7175 6325
Wire Wire Line
	8025 6175 7125 6175
Wire Wire Line
	7175 6075 8025 6075
Wire Wire Line
	7825 6325 8025 6325
Wire Wire Line
	7125 5075 8025 5075
Wire Wire Line
	8025 5175 7125 5175
Wire Wire Line
	8025 5275 7125 5275
Wire Wire Line
	7125 5375 8025 5375
Wire Wire Line
	8025 5475 7125 5475
Wire Wire Line
	7125 5575 8025 5575
Wire Wire Line
	8025 5675 7125 5675
Wire Wire Line
	8025 5775 7125 5775
Wire Bus Line
	8125 4650 5625 4650
Wire Wire Line
	5925 6475 5725 6475
Wire Wire Line
	5925 6575 5725 6575
Wire Wire Line
	5725 6675 5925 6675
Wire Wire Line
	5725 5075 5925 5075
Wire Wire Line
	5925 5175 5725 5175
Wire Wire Line
	5725 5275 5925 5275
Wire Wire Line
	5925 5375 5725 5375
Wire Wire Line
	5725 5475 5925 5475
Wire Wire Line
	5925 5575 5725 5575
Wire Wire Line
	5725 5675 5925 5675
Wire Wire Line
	5725 5775 5925 5775
Wire Wire Line
	5725 5875 5925 5875
Wire Wire Line
	5925 5975 5725 5975
Wire Wire Line
	5725 6075 5925 6075
Wire Wire Line
	5925 6175 5725 6175
Wire Wire Line
	5725 6275 5925 6275
Wire Wire Line
	5925 6375 5725 6375
Wire Wire Line
	7675 5975 8025 5975
Wire Wire Line
	7175 6075 7175 5975
Wire Wire Line
	7175 5975 7375 5975
Connection ~ 7175 6075
Wire Wire Line
	7175 6075 7125 6075
Wire Bus Line
	5625 4650 4750 4650
Wire Bus Line
	4750 4650 4750 7325
Connection ~ 5625 4650
Wire Bus Line
	4750 7325 6625 7325
Connection ~ 6625 7325
Wire Bus Line
	6625 7325 7125 7325
Connection ~ 7125 7325
Wire Bus Line
	7125 7325 8125 7325
Wire Wire Line
	5050 9225 4850 9225
Wire Wire Line
	5050 9325 4850 9325
Wire Wire Line
	4850 9425 5050 9425
Wire Wire Line
	4850 7825 5050 7825
Wire Wire Line
	5050 7925 4850 7925
Wire Wire Line
	4850 8025 5050 8025
Wire Wire Line
	5050 8125 4850 8125
Wire Wire Line
	4850 8225 5050 8225
Wire Wire Line
	5050 8325 4850 8325
Wire Wire Line
	4850 8425 5050 8425
Wire Wire Line
	4850 8525 5050 8525
Wire Wire Line
	4850 8625 5050 8625
Wire Wire Line
	5050 8725 4850 8725
Wire Wire Line
	4850 8825 5050 8825
Wire Wire Line
	5050 8925 4850 8925
Wire Wire Line
	4850 9025 5050 9025
Wire Wire Line
	5050 9125 4850 9125
Wire Wire Line
	4850 9525 5050 9525
Wire Wire Line
	4850 9625 5050 9625
Wire Wire Line
	1450 5600 825  5600
Wire Wire Line
	1450 5700 825  5700
Wire Wire Line
	1450 5800 825  5800
Wire Wire Line
	1450 9900 825  9900
Wire Wire Line
	3850 10600 4475 10600
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
	3850 5600 4475 5600
Wire Wire Line
	3850 5700 4475 5700
Wire Wire Line
	3850 5800 4475 5800
Wire Wire Line
	3850 5900 4475 5900
Wire Wire Line
	1450 6200 825  6200
Wire Bus Line
	725  4650 4575 4650
Wire Wire Line
	11275 6150 11700 6150
Wire Wire Line
	11700 6250 11275 6250
Wire Wire Line
	11700 6350 11275 6350
Wire Wire Line
	11275 6450 11700 6450
Wire Wire Line
	11700 6550 11275 6550
Wire Wire Line
	11275 6650 11700 6650
Wire Wire Line
	11700 6750 11275 6750
Wire Wire Line
	11700 6850 11275 6850
Wire Wire Line
	9725 6150 10075 6150
Wire Wire Line
	10075 6250 9725 6250
Wire Wire Line
	9725 6350 10075 6350
Wire Wire Line
	10075 6450 9725 6450
Connection ~ 11900 5475
Wire Wire Line
	11800 8100 11275 8100
Wire Wire Line
	11275 8000 11800 8000
Wire Wire Line
	11800 7900 11275 7900
Wire Wire Line
	11275 7800 11800 7800
Wire Wire Line
	11275 7550 11800 7550
Wire Wire Line
	11800 7450 11275 7450
Wire Wire Line
	11275 7350 11800 7350
Wire Wire Line
	11800 7250 11275 7250
Wire Wire Line
	11800 7100 11275 7100
Wire Wire Line
	11800 7000 11275 7000
Wire Wire Line
	10075 7300 9625 7300
Wire Wire Line
	10075 7450 9625 7450
Wire Wire Line
	10075 7550 9625 7550
Wire Wire Line
	9625 7950 10075 7950
Wire Wire Line
	10075 7850 9625 7850
Wire Wire Line
	10075 8050 9625 8050
Wire Wire Line
	10075 7000 9625 7000
Wire Wire Line
	10075 6900 9625 6900
Wire Wire Line
	10075 6800 9625 6800
Wire Wire Line
	10075 6550 9625 6550
Wire Wire Line
	10075 7150 9625 7150
Wire Wire Line
	10075 6700 9625 6700
Wire Bus Line
	9525 5475 11900 5475
Connection ~ 13100 5475
Wire Bus Line
	11900 5475 13100 5475
Wire Wire Line
	13200 7200 13525 7200
Wire Wire Line
	13775 8125 13200 8125
Wire Wire Line
	13775 8425 13200 8425
Wire Wire Line
	13775 7825 13200 7825
Wire Wire Line
	13775 7725 13200 7725
Wire Wire Line
	13025 7600 12900 7600
Wire Wire Line
	13025 7300 13025 7600
Wire Wire Line
	13525 7300 13025 7300
Wire Wire Line
	13050 6500 13525 6500
Wire Wire Line
	12900 5950 13050 5950
Wire Wire Line
	12975 6600 13525 6600
Wire Wire Line
	12975 6300 12975 6600
Wire Wire Line
	12900 6300 12975 6300
Wire Wire Line
	12925 6700 13525 6700
Wire Wire Line
	12925 6625 12925 6700
Wire Wire Line
	12900 6625 12925 6625
Wire Wire Line
	12925 6950 12900 6950
Wire Wire Line
	12925 6800 12925 6950
Wire Wire Line
	13525 6800 12925 6800
Wire Wire Line
	12975 7275 12900 7275
Wire Wire Line
	12975 6900 12975 7275
Wire Wire Line
	13525 7100 13200 7100
Wire Wire Line
	13200 7000 13525 7000
Wire Wire Line
	14425 7300 14425 7200
Connection ~ 14425 7300
Wire Wire Line
	14425 7200 14425 7100
Connection ~ 14425 7200
Wire Wire Line
	14425 7100 14425 7000
Connection ~ 14425 7100
Wire Wire Line
	14425 7000 14425 6900
Connection ~ 14425 7000
Wire Wire Line
	14425 6900 14425 6800
Connection ~ 14425 6900
Wire Wire Line
	14425 6800 14425 6700
Connection ~ 14425 6800
Wire Wire Line
	14425 6700 14425 6600
Connection ~ 14425 6700
Wire Wire Line
	14425 6600 14425 6500
Connection ~ 14425 6600
Wire Wire Line
	14425 6500 14425 6400
Connection ~ 14425 6500
Wire Wire Line
	14425 6400 14425 6300
Connection ~ 14425 6400
Wire Wire Line
	14425 6300 14425 6200
Connection ~ 14425 6300
Wire Wire Line
	14425 6200 14425 6100
Connection ~ 14425 6200
Wire Wire Line
	14425 6100 14425 6000
Connection ~ 14425 6100
Wire Wire Line
	14425 6000 14425 5900
Connection ~ 14425 6000
Wire Wire Line
	14425 5900 14425 5800
Connection ~ 14425 5900
Wire Wire Line
	14425 7400 14425 7300
Wire Wire Line
	12300 7275 12000 7275
Wire Wire Line
	12300 6950 12000 6950
Wire Wire Line
	12300 6625 12000 6625
Wire Wire Line
	12300 6300 12000 6300
Wire Wire Line
	12300 5950 12000 5950
Wire Wire Line
	12300 7600 12000 7600
Wire Wire Line
	13200 6400 13525 6400
Wire Wire Line
	13200 6300 13525 6300
Wire Wire Line
	7725 7575 8025 7575
Wire Wire Line
	7725 7675 8025 7675
Wire Wire Line
	7725 7775 8025 7775
Wire Wire Line
	7725 7875 8025 7875
Wire Wire Line
	7725 7975 8025 7975
Wire Wire Line
	7725 8075 8025 8075
Wire Wire Line
	7725 8175 8025 8175
Wire Wire Line
	7225 7575 7425 7575
Wire Wire Line
	7225 7675 7425 7675
Wire Wire Line
	7225 7775 7425 7775
Wire Wire Line
	7225 7875 7425 7875
Wire Wire Line
	7225 7975 7425 7975
Wire Wire Line
	7225 8075 7425 8075
Wire Wire Line
	7225 8175 7425 8175
Wire Wire Line
	7725 8275 8025 8275
Wire Wire Line
	7225 8275 7425 8275
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
$Comp
L power:+5V #PWR031
U 1 1 6721611A
P 21675 3700
F 0 "#PWR031" H 21675 3550 50  0001 C CNN
F 1 "+5V" V 21675 3875 39  0000 C CNN
F 2 "" H 21675 3700 50  0001 C CNN
F 3 "" H 21675 3700 50  0001 C CNN
	1    21675 3700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR028
U 1 1 672169BB
P 21675 3500
F 0 "#PWR028" H 21675 3250 50  0001 C CNN
F 1 "GND" H 21680 3327 39  0001 C CNN
F 2 "" H 21675 3500 50  0001 C CNN
F 3 "" H 21675 3500 50  0001 C CNN
	1    21675 3500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR029
U 1 1 67216F17
P 21675 3600
F 0 "#PWR029" H 21675 3350 50  0001 C CNN
F 1 "GND" H 21680 3427 39  0001 C CNN
F 2 "" H 21675 3600 50  0001 C CNN
F 3 "" H 21675 3600 50  0001 C CNN
	1    21675 3600
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR026
U 1 1 672172BA
P 21675 3400
F 0 "#PWR026" H 21675 3250 50  0001 C CNN
F 1 "+12V" V 21675 3600 39  0000 C CNN
F 2 "" H 21675 3400 50  0001 C CNN
F 3 "" H 21675 3400 50  0001 C CNN
	1    21675 3400
	0    -1   -1   0   
$EndComp
$Comp
L my:AS6C4008 U12
U 1 1 6056FD84
P 5650 8725
F 0 "U12" H 5275 9800 51  0000 C CNN
F 1 "AS6C4008-55PCN" H 6050 9800 51  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_Socket" H 5650 8825 50  0001 C CNN
F 3 "https://www.alliancememory.com/wp-content/uploads/pdf/AS6C4008.pdf" H 5650 8825 50  0001 C CNN
F 4 ">=128K <=70ns SRAM" H 5650 7450 39  0000 C CNN "Desc"
	1    5650 8725
	1    0    0    -1  
$EndComp
Wire Wire Line
	21900 9675 22400 9675
$Comp
L Switch:SW_Push SW3
U 1 1 6509608E
P 20325 6475
F 0 "SW3" H 20250 6400 39  0000 L CNN
F 1 "WF-2" H 20200 6400 39  0001 L CNN
F 2 "Button_Switch_THT:SW_Tactile_SPST_Angled_PTS645Vx83-2LFS" H 20325 6675 50  0001 C CNN
F 3 "" H 20325 6675 50  0001 C CNN
F 4 "MAGIC" H 20325 6400 50  0001 C CNN "Desc"
	1    20325 6475
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 1400 6600 1400
Wire Wire Line
	6100 2925 6600 2925
Wire Wire Line
	22250 4550 22250 4125
Wire Wire Line
	22250 4125 21575 4125
Wire Wire Line
	22200 4550 22250 4550
Connection ~ 21575 4125
$Comp
L Device:C C1
U 1 1 5DF10FF0
P 17000 1075
F 0 "C1" H 16900 1000 39  0000 C CNN
F 1 "100n" H 16900 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 17038 925 50  0001 C CNN
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
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 20088 925 50  0001 C CNN
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
L power:GND #PWR072
U 1 1 5EA07C77
P 21550 8350
F 0 "#PWR072" H 21550 8100 50  0001 C CNN
F 1 "GND" V 21550 8175 39  0000 C CNN
F 2 "" H 21550 8350 50  0001 C CNN
F 3 "" H 21550 8350 50  0001 C CNN
	1    21550 8350
	0    1    1    0   
$EndComp
Entry Wire Line
	21100 8050 21200 8150
Entry Wire Line
	21100 8150 21200 8250
Entry Wire Line
	22500 8150 22400 8250
Entry Wire Line
	22500 8250 22400 8350
Text Label 21200 8150 0    39   ~ 0
Blue
Text Label 21200 8250 0    39   ~ 0
Red
Text Label 22400 8150 2    39   ~ 0
Green
Text Label 22400 8450 2    39   ~ 0
Bright
Wire Wire Line
	21200 8150 21550 8150
Wire Wire Line
	22400 8150 22050 8150
Wire Wire Line
	22400 8450 22050 8450
Wire Wire Line
	21200 8250 21550 8250
Entry Wire Line
	22500 8350 22400 8450
Text Label 21200 8450 0    39   ~ 0
Hsync
Wire Wire Line
	21200 8450 21550 8450
Entry Wire Line
	21100 8450 21200 8550
Text Label 22400 8350 2    39   ~ 0
Vsync
Wire Wire Line
	22400 8350 22050 8350
Entry Wire Line
	22500 8050 22400 8150
Text Label 22400 8250 2    39   ~ 0
Bright
Wire Wire Line
	22400 8250 22050 8250
Entry Wire Line
	21100 8350 21200 8450
Text Label 21200 8550 0    39   ~ 0
Bright
Wire Wire Line
	21200 8550 21550 8550
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
	3850 6700 4475 6700
Text Label 4475 6700 2    39   ~ 0
Vsync
Wire Wire Line
	3850 6800 4475 6800
$Comp
L power:+3.3V #PWR040
U 1 1 5E62748E
P 21425 4125
F 0 "#PWR040" H 21425 3975 50  0001 C CNN
F 1 "+3.3V" H 21440 4290 39  0000 C CNN
F 2 "" H 21425 4125 50  0001 C CNN
F 3 "" H 21425 4125 50  0001 C CNN
	1    21425 4125
	1    0    0    -1  
$EndComp
Connection ~ 21425 4125
$Comp
L power:+3.3V #PWR044
U 1 1 5E78889E
P 2150 4900
F 0 "#PWR044" H 2150 4750 50  0001 C CNN
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
L power:GND #PWR09
U 1 1 5F3425B2
P 17300 1225
F 0 "#PWR09" H 17300 975 50  0001 C CNN
F 1 "GND" H 17305 1052 39  0001 C CNN
F 2 "" H 17300 1225 50  0001 C CNN
F 3 "" H 17300 1225 50  0001 C CNN
	1    17300 1225
	1    0    0    -1  
$EndComp
Connection ~ 17525 1225
$Comp
L power:+3.3V #PWR02
U 1 1 5F343586
P 17300 925
F 0 "#PWR02" H 17300 775 50  0001 C CNN
F 1 "+3.3V" H 17315 1090 39  0000 C CNN
F 2 "" H 17300 925 50  0001 C CNN
F 3 "" H 17300 925 50  0001 C CNN
	1    17300 925 
	1    0    0    -1  
$EndComp
Connection ~ 17525 925 
$Comp
L Device:C C41
U 1 1 5FD74EC4
P 19900 5475
F 0 "C41" H 19800 5400 39  0000 C CNN
F 1 "100n" H 19800 5575 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 19938 5325 50  0001 C CNN
F 3 "~" H 19900 5475 50  0001 C CNN
	1    19900 5475
	-1   0    0    1   
$EndComp
Wire Wire Line
	20325 5675 19900 5675
Connection ~ 20325 5675
Wire Wire Line
	19900 5675 19900 5625
Wire Wire Line
	19900 5325 19900 5275
Connection ~ 19900 5275
Text Label 3400 1550 0    39   ~ 0
~INT
$Comp
L Device:Jumper JP4
U 1 1 5EDDBD8E
P 5300 5925
F 0 "JP4" H 5300 5850 39  0000 C CNN
F 1 "Jumper" H 5300 6098 39  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5300 5925 50  0001 C CNN
F 3 "~" H 5300 5925 50  0001 C CNN
	1    5300 5925
	0    -1   -1   0   
$EndComp
$Comp
L Device:Jumper JP3
U 1 1 5EDDC4C5
P 4950 5925
F 0 "JP3" H 4950 5850 39  0000 C CNN
F 1 "Jumper" H 4950 6098 39  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4950 5925 50  0001 C CNN
F 3 "~" H 4950 5925 50  0001 C CNN
	1    4950 5925
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R24
U 1 1 5EF12D51
P 4950 6375
F 0 "R24" V 5025 6325 39  0000 L CNN
F 1 "10k" V 4950 6325 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4880 6375 50  0001 C CNN
F 3 "~" H 4950 6375 50  0001 C CNN
	1    4950 6375
	-1   0    0    1   
$EndComp
Wire Wire Line
	5450 6225 5300 6225
Wire Wire Line
	5100 6225 4950 6225
Wire Wire Line
	5100 6225 5100 6875
Connection ~ 4950 6225
$Comp
L Device:R R26
U 1 1 5F88DEA6
P 7525 6575
F 0 "R26" V 7450 6525 39  0000 L CNN
F 1 "10k" V 7525 6525 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7455 6575 50  0001 C CNN
F 3 "~" H 7525 6575 50  0001 C CNN
	1    7525 6575
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR062
U 1 1 5F88EE36
P 7675 6575
F 0 "#PWR062" H 7675 6425 50  0001 C CNN
F 1 "+5V" V 7675 6750 39  0000 C CNN
F 2 "" H 7675 6575 50  0001 C CNN
F 3 "" H 7675 6575 50  0001 C CNN
	1    7675 6575
	0    1    1    0   
$EndComp
Wire Wire Line
	7175 6325 7175 6575
Wire Wire Line
	7175 6575 7375 6575
Connection ~ 7175 6325
$Comp
L power:+5V #PWR051
U 1 1 5FB01130
P 4950 5625
F 0 "#PWR051" H 4950 5475 50  0001 C CNN
F 1 "+5V" H 4950 5775 39  0000 C CNN
F 2 "" H 4950 5625 50  0001 C CNN
F 3 "" H 4950 5625 50  0001 C CNN
	1    4950 5625
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR052
U 1 1 5FB0167E
P 5300 5625
F 0 "#PWR052" H 5300 5475 50  0001 C CNN
F 1 "+5V" H 5300 5775 39  0000 C CNN
F 2 "" H 5300 5625 50  0001 C CNN
F 3 "" H 5300 5625 50  0001 C CNN
	1    5300 5625
	1    0    0    -1  
$EndComp
Text Label 13200 7825 0    39   ~ 0
FD_TR00
$Comp
L Device:R R25
U 1 1 5EF18024
P 5300 6375
F 0 "R25" V 5375 6325 39  0000 L CNN
F 1 "10k" V 5300 6325 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5230 6375 50  0001 C CNN
F 3 "~" H 5300 6375 50  0001 C CNN
	1    5300 6375
	-1   0    0    1   
$EndComp
Connection ~ 5300 6225
Wire Wire Line
	5450 6225 5450 6775
$Comp
L power:+12V #PWR01
U 1 1 5DF4DF93
P 17000 925
F 0 "#PWR01" H 17000 775 50  0001 C CNN
F 1 "+12V" H 16975 1075 39  0000 C CNN
F 2 "" H 17000 925 50  0001 C CNN
F 3 "" H 17000 925 50  0001 C CNN
	1    17000 925 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R23
U 1 1 5EBC9A23
P 19900 6125
F 0 "R23" V 19975 6075 39  0000 L CNN
F 1 "10k" V 19900 6075 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 19830 6125 50  0001 C CNN
F 3 "~" H 19900 6125 50  0001 C CNN
	1    19900 6125
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR058
U 1 1 5ED02967
P 19900 5975
F 0 "#PWR058" H 19900 5825 50  0001 C CNN
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
FD_INDEX
Wire Wire Line
	3850 8900 4475 8900
Text Label 4475 8900 2    39   ~ 0
VG_INDEX
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
VG_CS
Text Label 4475 7800 2    39   ~ 0
FD_DISK0
Text Label 4475 7300 2    39   ~ 0
FD_DISK1
Text Label 4475 7100 2    39   ~ 0
VG_RST
Text Label 4475 7600 2    39   ~ 0
VG_HLT
Text Label 4475 7500 2    39   ~ 0
FD_SIDE
Text Label 4475 8800 2    39   ~ 0
VG_DDEN
Text Label 4475 6900 2    39   ~ 0
VG_SL
Text Label 4475 7000 2    39   ~ 0
VG_SR
Text Label 4475 8600 2    39   ~ 0
VG_INTRQ
Text Label 4475 8700 2    39   ~ 0
VG_DRQ
Text Label 4475 8200 2    39   ~ 0
FD_MOTOR
Text Label 4475 7200 2    39   ~ 0
FD_RDAT
Text Label 4475 7400 2    39   ~ 0
FD_WDAT
Text Label 4475 8000 2    39   ~ 0
VG_RCLK
Wire Wire Line
	825  9800 1450 9800
Wire Wire Line
	825  10000 1450 10000
Text Label 4475 6800 2    39   ~ 0
Hsync
Text Label 4850 9125 0    39   ~ 0
VA1
Entry Wire Line
	13100 6000 13200 6100
Wire Wire Line
	13200 6100 13525 6100
Text Label 13200 6100 0    39   ~ 0
FD_INDEX
Connection ~ 19900 6275
Wire Wire Line
	19900 6275 20325 6275
Wire Wire Line
	19700 6275 19900 6275
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J11
U 1 1 5E77BD3E
P 21750 8350
F 0 "J11" H 21800 8767 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 21800 8676 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 21750 8350 50  0001 C CNN
F 3 "~" H 21750 8350 50  0001 C CNN
F 4 "EGA_HDR" H 21800 8676 50  0000 C CNN "Desc"
	1    21750 8350
	1    0    0    -1  
$EndComp
Wire Wire Line
	21600 11500 21200 11500
Entry Wire Line
	21100 11400 21200 11500
$Comp
L Connector:AudioJack3 J14
U 1 1 6047590C
P 21800 10850
F 0 "J14" H 21520 10875 50  0000 R CNN
F 1 "PJ-313" H 21520 10784 39  0001 R CNN
F 2 "my:PJ-313" H 21800 10850 50  0001 C CNN
F 3 "~" H 21800 10850 50  0001 C CNN
F 4 "MIC" H 21520 10784 50  0000 R CNN "Desc"
	1    21800 10850
	-1   0    0    -1  
$EndComp
Entry Wire Line
	21100 10750 21200 10850
Text Label 21200 10850 0    39   ~ 0
SND_R
Wire Wire Line
	21200 10850 21600 10850
$Comp
L power:GND #PWR080
U 1 1 5D12CA06
P 21600 10750
F 0 "#PWR080" H 21600 10500 50  0001 C CNN
F 1 "GND" V 21600 10575 39  0000 C CNN
F 2 "" H 21600 10750 50  0001 C CNN
F 3 "" H 21600 10750 50  0001 C CNN
	1    21600 10750
	0    1    1    0   
$EndComp
$Comp
L Connector:AudioJack3 J15
U 1 1 606FADA5
P 21800 11400
F 0 "J15" H 21520 11425 50  0000 R CNN
F 1 "PJ-313" H 21520 11334 39  0001 R CNN
F 2 "my:PJ-313" H 21800 11400 50  0001 C CNN
F 3 "~" H 21800 11400 50  0001 C CNN
F 4 "EAR" H 21520 11334 50  0000 R CNN "Desc"
	1    21800 11400
	-1   0    0    -1  
$EndComp
Text Notes 8350 800  0    79   ~ 0
KEYBOARD & JOYSTICK
$Comp
L power:+5V #PWR019
U 1 1 5B52B6BD
P 9850 2200
F 0 "#PWR019" H 9850 2050 50  0001 C CNN
F 1 "+5V" H 9850 2350 39  0000 C CNN
F 2 "" H 9850 2200 50  0001 C CNN
F 3 "" H 9850 2200 50  0001 C CNN
	1    9850 2200
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J2
U 1 1 5FB9292E
P 10650 2400
F 0 "J2" H 10600 2800 39  0000 L CNN
F 1 "DS1020-08" H 10730 2301 50  0001 L CNN
F 2 "my:FFC_FPC_1x08" H 10650 2400 50  0001 C CNN
F 3 "~" H 10650 2400 50  0001 C CNN
F 4 "KB_A" H 10575 1900 39  0000 L CNN "Desc"
	1    10650 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08 RN2
U 1 1 602BB24C
P 9650 2600
F 0 "RN2" V 9150 2525 50  0000 L CNN
F 1 "10k" V 10050 2525 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 10125 2600 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9650 2600 50  0001 C CNN
	1    9650 2600
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 60F8B1A6
P 9875 1225
F 0 "#PWR07" H 9875 1075 50  0001 C CNN
F 1 "+5V" H 9875 1375 39  0000 C CNN
F 2 "" H 9875 1225 50  0001 C CNN
F 3 "" H 9875 1225 50  0001 C CNN
	1    9875 1225
	1    0    0    -1  
$EndComp
Text Notes 11125 800  0    79   ~ 0
TAPE INTERFACE
Entry Wire Line
	8950 1200 9050 1300
Entry Wire Line
	8950 1450 9050 1550
Entry Wire Line
	8950 1700 9050 1800
Entry Wire Line
	8950 1950 9050 2050
Entry Wire Line
	8950 2200 9050 2300
Entry Wire Line
	8950 2450 9050 2550
Entry Wire Line
	8950 2700 9050 2800
Entry Wire Line
	8950 2950 9050 3050
Text Label 8950 2700 2    39   ~ 0
KA14
Text Label 8950 2450 2    39   ~ 0
KA13
Text Label 8950 2200 2    39   ~ 0
KA12
Text Label 8950 1950 2    39   ~ 0
KA11
Text Label 8950 1700 2    39   ~ 0
KA10
Text Label 8950 1450 2    39   ~ 0
KA9
Text Label 8950 1200 2    39   ~ 0
KA8
Entry Wire Line
	10150 2000 10250 2100
Entry Wire Line
	10150 2100 10250 2200
Entry Wire Line
	10150 2200 10250 2300
Entry Wire Line
	10150 2300 10250 2400
Entry Wire Line
	10150 2400 10250 2500
Entry Wire Line
	10150 2500 10250 2600
Entry Wire Line
	10150 2600 10250 2700
Entry Wire Line
	10150 2700 10250 2800
Text Label 10250 2100 0    39   ~ 0
KA11
Text Label 10250 2200 0    39   ~ 0
KA10
Text Label 10250 2300 0    39   ~ 0
KA9
Text Label 10250 2400 0    39   ~ 0
KA12
Text Label 10250 2500 0    39   ~ 0
KA13
Text Label 10250 2600 0    39   ~ 0
KA8
Text Label 10250 2700 0    39   ~ 0
KA14
Text Label 10250 2800 0    39   ~ 0
KA15
Text Label 8450 1200 0    39   ~ 0
A8
Text Label 8450 1450 0    39   ~ 0
A9
Text Label 8450 1700 0    39   ~ 0
A10
Text Label 8450 1950 0    39   ~ 0
A11
Text Label 8450 2200 0    39   ~ 0
A12
Text Label 8450 2450 0    39   ~ 0
A13
Text Label 8450 2700 0    39   ~ 0
A14
Text Label 8450 2950 0    39   ~ 0
A15
Entry Wire Line
	8350 2850 8450 2950
Entry Wire Line
	8350 2600 8450 2700
Entry Wire Line
	8350 2350 8450 2450
Entry Wire Line
	8350 2100 8450 2200
Entry Wire Line
	8350 1850 8450 1950
Entry Wire Line
	8350 1600 8450 1700
Entry Wire Line
	8350 1350 8450 1450
Entry Wire Line
	8350 1100 8450 1200
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 5FD04AD5
P 10650 1425
F 0 "J1" H 10625 1725 39  0000 L CNN
F 1 "DS1020-05" H 10730 1376 50  0001 L CNN
F 2 "my:FFC_FPC_1x05" H 10650 1425 50  0001 C CNN
F 3 "~" H 10650 1425 50  0001 C CNN
F 4 "KB_D" H 10575 1125 39  0000 L CNN "Desc"
	1    10650 1425
	1    0    0    -1  
$EndComp
Entry Wire Line
	9050 1225 9150 1325
Entry Wire Line
	9050 1325 9150 1425
Entry Wire Line
	9050 1425 9150 1525
Entry Wire Line
	9050 1525 9150 1625
Entry Wire Line
	9050 1625 9150 1725
Text Label 9150 1325 0    39   ~ 0
KD4
Text Label 9150 1425 0    39   ~ 0
KD3
Text Label 9150 1525 0    39   ~ 0
KD2
Text Label 9150 1625 0    39   ~ 0
KD1
Text Label 9150 1725 0    39   ~ 0
KD0
Entry Wire Line
	9050 2100 9150 2200
Entry Wire Line
	9050 2200 9150 2300
Entry Wire Line
	9050 2300 9150 2400
Entry Wire Line
	9050 2400 9150 2500
Entry Wire Line
	9050 2500 9150 2600
Entry Wire Line
	9050 2600 9150 2700
Entry Wire Line
	9050 2700 9150 2800
Text Label 9150 2300 0    39   ~ 0
~JOY_B3
Text Label 9150 2200 0    39   ~ 0
~JOY_B2
Text Label 9150 2400 0    39   ~ 0
~JOY_RIGHT
Text Label 9150 2500 0    39   ~ 0
~JOY_LEFT
Text Label 9150 2600 0    39   ~ 0
~JOY_DOWN
Text Label 9150 2800 0    39   ~ 0
~JOY_UP
Entry Wire Line
	10250 1525 10150 1425
Entry Wire Line
	10250 1425 10150 1325
Text Label 10250 1625 0    39   ~ 0
KD4
Text Label 10250 1525 0    39   ~ 0
KD3
Text Label 10250 1425 0    39   ~ 0
KD2
Text Label 10250 1325 0    39   ~ 0
KD1
Text Label 10250 1225 0    39   ~ 0
KD0
Entry Wire Line
	10250 1325 10150 1225
Entry Wire Line
	10150 1125 10250 1225
Entry Wire Line
	10250 1625 10150 1525
Wire Bus Line
	11125 825  14350 825 
Connection ~ 9050 825 
Wire Wire Line
	10450 2100 10250 2100
Wire Wire Line
	10250 2200 10450 2200
Wire Wire Line
	10450 2300 10250 2300
Wire Wire Line
	10250 2400 10450 2400
Wire Wire Line
	10250 2500 10450 2500
Wire Wire Line
	10250 2600 10450 2600
Wire Wire Line
	10250 2700 10450 2700
Wire Wire Line
	10250 2800 10450 2800
Wire Wire Line
	8550 2200 8450 2200
Wire Wire Line
	8450 1200 8550 1200
Wire Bus Line
	8350 825  9050 825 
Wire Wire Line
	9450 1725 9150 1725
Wire Wire Line
	9150 1625 9450 1625
Wire Wire Line
	9450 1525 9150 1525
Wire Wire Line
	9450 1425 9150 1425
Wire Wire Line
	9150 1325 9450 1325
Wire Wire Line
	9450 2200 9150 2200
Wire Wire Line
	9150 2300 9450 2300
Wire Wire Line
	9450 2400 9150 2400
Wire Wire Line
	9150 2500 9450 2500
Wire Wire Line
	9450 2600 9150 2600
Wire Wire Line
	9150 2700 9450 2700
Wire Wire Line
	9450 2800 9150 2800
Wire Bus Line
	9050 825  10150 825 
Connection ~ 10150 825 
Wire Bus Line
	10150 825  10975 825 
Wire Wire Line
	10450 1225 10250 1225
Wire Wire Line
	10250 1325 10450 1325
Wire Wire Line
	10450 1425 10250 1425
Wire Wire Line
	10250 1525 10450 1525
Wire Wire Line
	10450 1625 10250 1625
Text Label 9150 2700 0    39   ~ 0
~JOY_B1
Wire Wire Line
	8850 1200 8950 1200
Wire Bus Line
	10975 825  10975 3125
Wire Wire Line
	8450 2950 8550 2950
Wire Wire Line
	8850 2950 8950 2950
Wire Wire Line
	8950 2700 8850 2700
Wire Wire Line
	8450 2700 8550 2700
Wire Wire Line
	8950 2450 8850 2450
Wire Wire Line
	8450 2450 8550 2450
Wire Wire Line
	8850 2200 8950 2200
Wire Wire Line
	8850 1950 8950 1950
Wire Wire Line
	8450 1950 8550 1950
Wire Wire Line
	8450 1700 8550 1700
Wire Wire Line
	8850 1700 8950 1700
Wire Wire Line
	8450 1450 8550 1450
Wire Wire Line
	8850 1450 8950 1450
$Comp
L Device:D_Schottky D3
U 1 1 64E82479
P 8700 1200
F 0 "D3" H 8700 1316 39  0000 C CNN
F 1 "BAT85" H 8700 1317 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8700 1200 50  0001 C CNN
F 3 "~" H 8700 1200 50  0001 C CNN
	1    8700 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D5
U 1 1 6522B61E
P 8700 1700
F 0 "D5" H 8700 1816 39  0000 C CNN
F 1 "BAT85" H 8700 1817 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8700 1700 50  0001 C CNN
F 3 "~" H 8700 1700 50  0001 C CNN
	1    8700 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D6
U 1 1 6522B624
P 8700 1950
F 0 "D6" H 8700 2066 39  0000 C CNN
F 1 "BAT85" H 8700 2067 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8700 1950 50  0001 C CNN
F 3 "~" H 8700 1950 50  0001 C CNN
	1    8700 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D7
U 1 1 65363E8B
P 8700 2200
F 0 "D7" H 8700 2316 39  0000 C CNN
F 1 "BAT85" H 8700 2317 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8700 2200 50  0001 C CNN
F 3 "~" H 8700 2200 50  0001 C CNN
	1    8700 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D8
U 1 1 65363E91
P 8700 2450
F 0 "D8" H 8700 2566 39  0000 C CNN
F 1 "BAT85" H 8700 2567 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8700 2450 50  0001 C CNN
F 3 "~" H 8700 2450 50  0001 C CNN
	1    8700 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D9
U 1 1 65363E97
P 8700 2700
F 0 "D9" H 8700 2816 39  0000 C CNN
F 1 "BAT85" H 8700 2817 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8700 2700 50  0001 C CNN
F 3 "~" H 8700 2700 50  0001 C CNN
	1    8700 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D10
U 1 1 65363E9D
P 8700 2950
F 0 "D10" H 8700 3066 39  0000 C CNN
F 1 "BAT85" H 8700 3067 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8700 2950 50  0001 C CNN
F 3 "~" H 8700 2950 50  0001 C CNN
	1    8700 2950
	1    0    0    -1  
$EndComp
Text Label 8950 2950 2    39   ~ 0
KA15
Text Label 9150 2900 0    39   ~ 0
TAPE_IN0
Entry Wire Line
	9050 2800 9150 2900
Wire Wire Line
	9150 2900 9450 2900
$Comp
L Device:R R3
U 1 1 5E09D2F0
P 9600 1325
F 0 "R3" V 9550 1450 39  0000 L CNN
F 1 "10k" V 9600 1275 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9530 1325 50  0001 C CNN
F 3 "~" H 9600 1325 50  0001 C CNN
	1    9600 1325
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5E0A08A6
P 9600 1425
F 0 "R4" V 9550 1550 39  0000 L CNN
F 1 "10k" V 9600 1375 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9530 1425 50  0001 C CNN
F 3 "~" H 9600 1425 50  0001 C CNN
	1    9600 1425
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5E0A0E31
P 9600 1525
F 0 "R5" V 9550 1650 39  0000 L CNN
F 1 "10k" V 9600 1475 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9530 1525 50  0001 C CNN
F 3 "~" H 9600 1525 50  0001 C CNN
	1    9600 1525
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5E0A10DA
P 9600 1625
F 0 "R8" V 9550 1750 39  0000 L CNN
F 1 "10k" V 9600 1575 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9530 1625 50  0001 C CNN
F 3 "~" H 9600 1625 50  0001 C CNN
	1    9600 1625
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5E0A13C2
P 9600 1725
F 0 "R9" V 9550 1850 39  0000 L CNN
F 1 "10k" V 9600 1675 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9530 1725 50  0001 C CNN
F 3 "~" H 9600 1725 50  0001 C CNN
	1    9600 1725
	0    1    1    0   
$EndComp
Wire Wire Line
	9750 1325 9875 1325
Wire Wire Line
	9875 1325 9875 1225
Wire Wire Line
	9875 1325 9875 1425
Wire Wire Line
	9875 1425 9750 1425
Connection ~ 9875 1325
Wire Wire Line
	9750 1525 9875 1525
Wire Wire Line
	9875 1525 9875 1425
Connection ~ 9875 1425
Wire Wire Line
	9750 1625 9875 1625
Wire Wire Line
	9875 1625 9875 1525
Connection ~ 9875 1525
Wire Wire Line
	9750 1725 9875 1725
Wire Wire Line
	9875 1725 9875 1625
Connection ~ 9875 1625
$Comp
L power:+5V #PWR04
U 1 1 61916B9C
P 14875 950
F 0 "#PWR04" H 14875 800 50  0001 C CNN
F 1 "+5V" H 14875 1100 39  0000 C CNN
F 2 "" H 14875 950 50  0001 C CNN
F 3 "" H 14875 950 50  0001 C CNN
	1    14875 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 618C9AB9
P 14875 1950
F 0 "#PWR015" H 14875 1700 50  0001 C CNN
F 1 "GND" H 14880 1777 39  0001 C CNN
F 2 "" H 14875 1950 50  0001 C CNN
F 3 "" H 14875 1950 50  0001 C CNN
	1    14875 1950
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U2
U 7 1 61872BAF
P 14875 1450
F 0 "U2" H 15105 1496 50  0000 L CNN
F 1 "74HCT05" H 15105 1405 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 14875 1450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 14875 1450 50  0001 C CNN
	7    14875 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	825  9300 1450 9300
$Comp
L my:Micro_SD_Card_Det J18
U 1 1 5DF95E3B
P 2675 14700
F 0 "J18" H 2625 15517 50  0000 C CNN
F 1 "MEM2055-00-190-01-A" H 2625 15426 50  0000 C CNN
F 2 "my:GCT-MEM2055-00-190-01-A" H 4725 15400 50  0001 C CNN
F 3 "https://www.hirose.com/product/en/download_file/key_name/DM3/category/Catalog/doc_file_id/49662/?file_category_id=4&item_id=195&is_series=1" H 2675 14800 50  0001 C CNN
	1    2675 14700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5E519BC3
P 3475 15200
F 0 "#PWR0119" H 3475 14950 50  0001 C CNN
F 1 "GND" H 3480 15027 39  0001 C CNN
F 2 "" H 3475 15200 50  0001 C CNN
F 3 "" H 3475 15200 50  0001 C CNN
	1    3475 15200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5E51A17F
P 1775 14800
F 0 "#PWR0115" H 1775 14550 50  0001 C CNN
F 1 "GND" H 1780 14627 39  0001 C CNN
F 2 "" H 1775 14800 50  0001 C CNN
F 3 "" H 1775 14800 50  0001 C CNN
	1    1775 14800
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0110
U 1 1 5E51A7CC
P 1775 14600
F 0 "#PWR0110" H 1775 14450 50  0001 C CNN
F 1 "+3.3V" V 1775 14800 39  0000 C CNN
F 2 "" H 1775 14600 50  0001 C CNN
F 3 "" H 1775 14600 50  0001 C CNN
	1    1775 14600
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR093
U 1 1 5EFA36A0
P 1200 13625
F 0 "#PWR093" H 1200 13475 50  0001 C CNN
F 1 "+3.3V" H 1200 13775 39  0000 C CNN
F 2 "" H 1200 13625 50  0001 C CNN
F 3 "" H 1200 13625 50  0001 C CNN
	1    1200 13625
	-1   0    0    -1  
$EndComp
Wire Wire Line
	850  14400 1775 14400
Text Label 850  15200 0    39   ~ 0
SD_CD
Entry Wire Line
	750  15100 850  15200
Text Label 850  14400 0    39   ~ 0
SD_CS
Entry Wire Line
	750  14300 850  14400
Text Label 850  14500 0    39   ~ 0
SD_MOSI
Entry Wire Line
	750  14400 850  14500
Text Label 850  14900 0    39   ~ 0
SD_MISO
Entry Wire Line
	750  14800 850  14900
Text Label 850  14700 0    39   ~ 0
SD_SCK
Wire Wire Line
	850  14700 1775 14700
Entry Wire Line
	750  14600 850  14700
Wire Wire Line
	1725 13925 1725 14300
Wire Wire Line
	1725 14300 1775 14300
Wire Wire Line
	850  14500 1775 14500
Wire Wire Line
	1550 13925 1550 14900
Wire Bus Line
	3675 13250 3675 15425
Wire Bus Line
	750  13250 3675 13250
Text Notes 800  13225 0    79   ~ 0
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
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 17338 925 50  0001 C CNN
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
L Device:R R58
U 1 1 62F26938
P 1725 13775
F 0 "R58" V 1800 13725 39  0000 L CNN
F 1 "10k" V 1725 13725 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 1655 13775 50  0001 C CNN
F 3 "~" H 1725 13775 50  0001 C CNN
	1    1725 13775
	1    0    0    -1  
$EndComp
$Comp
L Device:R R57
U 1 1 62F277A2
P 1550 13775
F 0 "R57" V 1625 13725 39  0000 L CNN
F 1 "10k" V 1550 13725 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 1480 13775 50  0001 C CNN
F 3 "~" H 1550 13775 50  0001 C CNN
	1    1550 13775
	1    0    0    -1  
$EndComp
Wire Wire Line
	1375 13625 1550 13625
Connection ~ 1375 13625
Connection ~ 1550 13625
$Comp
L Device:R R56
U 1 1 62F279F0
P 1375 13775
F 0 "R56" V 1450 13725 39  0000 L CNN
F 1 "10k" V 1375 13725 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 1305 13775 50  0001 C CNN
F 3 "~" H 1375 13775 50  0001 C CNN
	1    1375 13775
	1    0    0    -1  
$EndComp
Wire Wire Line
	13775 8225 13200 8225
Wire Wire Line
	13775 8325 13200 8325
Text Label 13200 8225 0    39   ~ 0
VG_DRQ
Text Label 13200 8325 0    39   ~ 0
VG_INTRQ
$Comp
L Device:R R55
U 1 1 6426411B
P 1200 13775
F 0 "R55" V 1275 13725 39  0000 L CNN
F 1 "10k" V 1200 13725 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 1130 13775 50  0001 C CNN
F 3 "~" H 1200 13775 50  0001 C CNN
	1    1200 13775
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 13925 1200 15200
Wire Wire Line
	1375 13925 1375 15000
Connection ~ 1200 15200
Wire Wire Line
	1200 15200 1775 15200
Wire Wire Line
	1375 15000 1775 15000
Connection ~ 1550 14900
Wire Wire Line
	1550 14900 1775 14900
Wire Wire Line
	850  14900 1550 14900
Wire Wire Line
	850  15200 1200 15200
Wire Wire Line
	1550 13625 1725 13625
Wire Wire Line
	1375 13625 1200 13625
Connection ~ 1200 13625
Text Label 11800 7550 2    39   ~ 0
FD_WSTB
Wire Wire Line
	13775 7925 13200 7925
Entry Wire Line
	13100 7825 13200 7925
Text Label 13200 7925 0    39   ~ 0
FD_WPT
Wire Wire Line
	13775 8025 13200 8025
Entry Wire Line
	13100 7925 13200 8025
Text Label 13200 8025 0    39   ~ 0
FD_DISK1
Text Label 4475 8100 2    39   ~ 0
VG_RAWR
Text Label 4475 8400 2    39   ~ 0
VG_WD
Text Label 4475 8300 2    39   ~ 0
VG_TR43
Text Label 4475 8500 2    39   ~ 0
VG_WF_DE
Text Label 4475 7900 2    39   ~ 0
VG_CLK
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
	1450 10400 825  10400
Text Label 825  10400 0    39   ~ 0
TAPE_IN0
Wire Wire Line
	3850 10800 4475 10800
Wire Wire Line
	3850 10700 4475 10700
Wire Wire Line
	3850 11400 4475 11400
Wire Wire Line
	1450 6100 825  6100
Wire Wire Line
	3850 10900 4475 10900
Wire Wire Line
	3850 11200 4475 11200
Wire Wire Line
	3850 11300 4475 11300
Text Label 825  9500 0    39   ~ 0
AY_ABC
Wire Wire Line
	4475 9500 3850 9500
Wire Wire Line
	3850 9900 4475 9900
Text Label 4475 10100 2    39   ~ 0
KD2
Text Label 4850 8625 0    39   ~ 0
VA0
Text Label 4475 9900 2    39   ~ 0
KD4
Text Label 4475 10000 2    39   ~ 0
KD3
NoConn ~ 3675 1350
NoConn ~ 3675 1450
NoConn ~ 3850 10300
Entry Wire Line
	4475 10200 4575 10300
NoConn ~ 3850 10500
NoConn ~ 11275 7650
$Comp
L power:GND #PWR037
U 1 1 5FFB0CC1
P 2025 4025
F 0 "#PWR037" H 2025 3775 50  0001 C CNN
F 1 "GND" H 2030 3852 39  0001 C CNN
F 2 "" H 2025 4025 50  0001 C CNN
F 3 "" H 2025 4025 50  0001 C CNN
	1    2025 4025
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR091
U 1 1 5FFB21FA
P 21600 13275
F 0 "#PWR091" H 21600 13025 50  0001 C CNN
F 1 "GND" H 21605 13102 39  0001 C CNN
F 2 "" H 21600 13275 50  0001 C CNN
F 3 "" H 21600 13275 50  0001 C CNN
	1    21600 13275
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5FFB337B
P 17000 1225
F 0 "#PWR08" H 17000 975 50  0001 C CNN
F 1 "GND" H 17005 1052 39  0001 C CNN
F 2 "" H 17000 1225 50  0001 C CNN
F 3 "" H 17000 1225 50  0001 C CNN
	1    17000 1225
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR067
U 1 1 5FFB440B
P 14425 7400
F 0 "#PWR067" H 14425 7150 50  0001 C CNN
F 1 "GND" H 14430 7227 39  0001 C CNN
F 2 "" H 14425 7400 50  0001 C CNN
F 3 "" H 14425 7400 50  0001 C CNN
	1    14425 7400
	1    0    0    -1  
$EndComp
Connection ~ 14425 7400
$Comp
L power:GND #PWR059
U 1 1 5E0BAE2A
P 22025 6125
F 0 "#PWR059" H 22025 5875 50  0001 C CNN
F 1 "GND" V 22025 5950 39  0000 C CNN
F 2 "" H 22025 6125 50  0001 C CNN
F 3 "" H 22025 6125 50  0001 C CNN
	1    22025 6125
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R48
U 1 1 917232FA
P 1300 10200
F 0 "R48" V 1225 10150 39  0000 L CNN
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
L my:logo LOGO2
U 1 1 5E51C621
P 20475 14450
F 0 "LOGO2" H 20475 14650 50  0001 C CNN
F 1 "graphic" H 20475 14200 50  0001 C CNN
F 2 "my:black-mage2" H 20475 14250 50  0001 C CNN
F 3 "~" H 20505 14250 50  0001 C CNN
F 4 "Logo" H 20475 14375 39  0000 C CNN "Desc"
	1    20475 14450
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D4
U 1 1 650F46F9
P 8700 1450
F 0 "D4" H 8700 1566 39  0000 C CNN
F 1 "BAT85" H 8700 1567 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 8700 1450 50  0001 C CNN
F 3 "~" H 8700 1450 50  0001 C CNN
	1    8700 1450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J13
U 1 1 5E35DD23
P 21825 10125
F 0 "J13" H 21925 10092 50  0000 L CNN
F 1 "RCJ-014" H 21925 10009 39  0000 L CNN
F 2 "my:CUI_RCJ-01X-WIDE" H 21825 10125 50  0001 C CNN
F 3 " ~" H 21825 10125 50  0001 C CNN
	1    21825 10125
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR079
U 1 1 5E4C0B48
P 21825 10325
F 0 "#PWR079" H 21825 10075 50  0001 C CNN
F 1 "GND" H 21825 10175 39  0000 C CNN
F 2 "" H 21825 10325 50  0001 C CNN
F 3 "" H 21825 10325 50  0001 C CNN
	1    21825 10325
	1    0    0    -1  
$EndComp
Entry Wire Line
	21100 10025 21200 10125
Text Label 21200 10125 0    39   ~ 0
VID_COMP
Wire Wire Line
	21200 10125 21625 10125
$Comp
L Graphic:Logo_Open_Hardware_Small LOGO1
U 1 1 5EE31DCE
P 20450 14025
F 0 "LOGO1" H 20450 14300 50  0001 C CNN
F 1 "Logo_Open_Hardware_Small" H 20450 13800 50  0001 C CNN
F 2 "Symbol:OSHW-Symbol_6.7x6mm_SilkScreen" H 20450 14025 50  0001 C CNN
F 3 "~" H 20450 14025 50  0001 C CNN
	1    20450 14025
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Switching:CRE1S0505S3C U6
U 1 1 5E2DBB14
P 19775 3525
F 0 "U6" H 19775 3968 39  0000 C CNN
F 1 "AM1S-0512SZ" H 19775 3893 39  0000 C CNN
F 2 "Converter_DCDC:Converter_DCDC_muRata_CRE1xxxxxx3C_THT" H 19775 3125 50  0001 C CNN
F 3 "http://power.murata.com/datasheet?/data/power/ncl/kdc_cre1.pdf" H 19775 3025 50  0001 C CNN
	1    19775 3525
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR022
U 1 1 5FE29122
P 19225 2950
F 0 "#PWR022" H 19225 2800 50  0001 C CNN
F 1 "+5V" H 19225 3100 39  0000 C CNN
F 2 "" H 19225 2950 50  0001 C CNN
F 3 "" H 19225 2950 50  0001 C CNN
	1    19225 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	19275 3325 19225 3325
$Comp
L power:GND #PWR035
U 1 1 5FF804D6
P 19775 3900
F 0 "#PWR035" H 19775 3650 50  0001 C CNN
F 1 "GND" H 19780 3727 39  0001 C CNN
F 2 "" H 19775 3900 50  0001 C CNN
F 3 "" H 19775 3900 50  0001 C CNN
	1    19775 3900
	1    0    0    -1  
$EndComp
Connection ~ 19775 3900
$Comp
L power:+12V #PWR023
U 1 1 6038A941
P 20375 2950
F 0 "#PWR023" H 20375 2800 50  0001 C CNN
F 1 "+12V" H 20350 3100 39  0000 C CNN
F 2 "" H 20375 2950 50  0001 C CNN
F 3 "" H 20375 2950 50  0001 C CNN
	1    20375 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	20375 3325 20275 3325
Wire Wire Line
	19775 3900 20375 3900
Wire Wire Line
	20275 3725 20375 3725
Connection ~ 20375 3725
Wire Wire Line
	20375 3725 20375 3900
Wire Wire Line
	19225 3900 19225 3725
Wire Wire Line
	19225 3725 19275 3725
Wire Wire Line
	19225 3900 19775 3900
Wire Wire Line
	17125 3075 17125 3025
$Comp
L power:GND #PWR024
U 1 1 5E6F2804
P 16525 3075
F 0 "#PWR024" H 16525 2825 50  0001 C CNN
F 1 "GND" H 16530 2902 39  0001 C CNN
F 2 "" H 16525 3075 50  0001 C CNN
F 3 "" H 16525 3075 50  0001 C CNN
	1    16525 3075
	0    1    1    0   
$EndComp
Wire Wire Line
	16350 2775 16275 2775
Wire Wire Line
	16275 2775 16275 3025
Wire Wire Line
	16275 3125 16275 3225
$Comp
L Switch:SW_SPST SW1
U 1 1 651F58B7
P 16550 2775
F 0 "SW1" H 16550 2910 39  0000 C CNN
F 1 "Conn_01x02" H 16550 2919 39  0001 C CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 16550 2775 50  0001 C CNN
F 3 "~" H 16550 2775 50  0001 C CNN
	1    16550 2775
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack_Switch J3
U 1 1 5B555C2D
P 15975 3125
F 0 "J3" H 15975 3450 39  0000 C CNN
F 1 "DS-210" H 15975 3350 39  0001 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 16025 3085 50  0001 C CNN
F 3 "~" H 16025 3085 50  0001 C CNN
F 4 "DC IN" H 15975 3350 39  0000 C CNN "Desc"
	1    15975 3125
	1    0    0    -1  
$EndComp
Text Notes 15850 2700 0    79   ~ 0
POWER
$Comp
L Device:R R13
U 1 1 5B6C9DCD
P 19000 3200
F 0 "R13" V 18925 3150 39  0000 L CNN
F 1 "470" V 19000 3150 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 18930 3200 50  0001 C CNN
F 3 "~" H 19000 3200 50  0001 C CNN
	1    19000 3200
	1    0    0    1   
$EndComp
$Comp
L Device:LED D12
U 1 1 5B653724
P 18775 3025
F 0 "D12" H 18825 2925 39  0000 R CNN
F 1 "LED" V 18722 2908 50  0001 R CNN
F 2 "LED_THT:LED_D4.0mm" H 18775 3025 50  0001 C CNN
F 3 "~" H 18775 3025 50  0001 C CNN
	1    18775 3025
	-1   0    0    1   
$EndComp
$Comp
L Device:C C31
U 1 1 60DBD358
P 17575 3200
F 0 "C31" H 17500 3100 39  0000 C CNN
F 1 "100n" H 17475 3300 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 17613 3050 50  0001 C CNN
F 3 "~" H 17575 3200 50  0001 C CNN
	1    17575 3200
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C32
U 1 1 64688EBA
P 18550 3200
F 0 "C32" H 18600 3300 39  0000 L CNN
F 1 "470u/25V" H 18575 3100 39  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P3.80mm" H 18588 3050 50  0001 C CNN
F 3 "~" H 18550 3200 50  0001 C CNN
	1    18550 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	18550 2700 18550 2775
$Comp
L power:+5V #PWR020
U 1 1 5B6C7C72
P 18550 2700
F 0 "#PWR020" H 18550 2550 50  0001 C CNN
F 1 "+5V" H 18550 2850 39  0000 C CNN
F 2 "" H 18550 2700 50  0001 C CNN
F 3 "" H 18550 2700 50  0001 C CNN
	1    18550 2700
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U5
U 1 1 5E2CEEDB
P 18075 3025
F 0 "U5" H 18075 3243 39  0000 C CNN
F 1 "L4940V5 / K7805-2000R3L" H 18075 3168 39  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 18100 2875 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 18075 2975 50  0001 C CNN
	1    18075 3025
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5F2120B3
P 18075 3375
F 0 "#PWR025" H 18075 3125 50  0001 C CNN
F 1 "GND" H 18080 3202 39  0001 C CNN
F 2 "" H 18075 3375 50  0001 C CNN
F 3 "" H 18075 3375 50  0001 C CNN
	1    18075 3375
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D11
U 1 1 607DDF76
P 19775 2950
F 0 "D11" H 19825 2850 39  0000 R CNN
F 1 "1N5817" V 19730 2871 50  0001 R CNN
F 2 "Diode_THT:D_DO-41_SOD81_P2.54mm_Vertical_AnodeUp" H 19775 2950 50  0001 C CNN
F 3 "~" H 19775 2950 50  0001 C CNN
	1    19775 2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	17525 4175 18075 4175
Wire Wire Line
	17525 3775 17525 3875
$Comp
L power:+5V #PWR033
U 1 1 5DFDD8BA
P 17525 3775
F 0 "#PWR033" H 17525 3625 50  0001 C CNN
F 1 "+5V" H 17525 3925 39  0000 C CNN
F 2 "" H 17525 3775 50  0001 C CNN
F 3 "" H 17525 3775 50  0001 C CNN
	1    17525 3775
	1    0    0    -1  
$EndComp
Connection ~ 17525 3875
Wire Wire Line
	17775 3875 17525 3875
$Comp
L Device:C C38
U 1 1 8F936D62
P 17525 4025
F 0 "C38" H 17450 3950 39  0000 C CNN
F 1 "100n" H 17425 4125 39  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 17563 3875 50  0001 C CNN
F 3 "~" H 17525 4025 50  0001 C CNN
	1    17525 4025
	-1   0    0    1   
$EndComp
Wire Wire Line
	18375 3875 18550 3875
Wire Wire Line
	18075 4175 18550 4175
$Comp
L Device:CP C39
U 1 1 907E426E
P 18550 4025
F 0 "C39" H 18600 4125 39  0000 L CNN
F 1 "100u/16V" H 18575 3925 39  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 18588 3875 50  0001 C CNN
F 3 "~" H 18550 4025 50  0001 C CNN
	1    18550 4025
	1    0    0    -1  
$EndComp
Connection ~ 18550 3875
Wire Wire Line
	18550 3775 18550 3875
$Comp
L power:+3.3V #PWR034
U 1 1 90B2B0A0
P 18550 3775
F 0 "#PWR034" H 18550 3625 50  0001 C CNN
F 1 "+3.3V" H 18565 3940 39  0000 C CNN
F 2 "" H 18550 3775 50  0001 C CNN
F 3 "" H 18550 3775 50  0001 C CNN
	1    18550 3775
	1    0    0    -1  
$EndComp
Connection ~ 18075 4175
$Comp
L power:GND #PWR041
U 1 1 655A73F4
P 18075 4175
F 0 "#PWR041" H 18075 3925 50  0001 C CNN
F 1 "GND" H 18080 4002 39  0001 C CNN
F 2 "" H 18075 4175 50  0001 C CNN
F 3 "" H 18075 4175 50  0001 C CNN
	1    18075 4175
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AMS1117-3.3 U7
U 1 1 6546187A
P 18075 3875
F 0 "U7" H 18075 4093 39  0000 C CNN
F 1 "AMS1117-3.3" H 18075 4018 39  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 18075 4075 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 18175 3625 50  0001 C CNN
	1    18075 3875
	1    0    0    -1  
$EndComp
Wire Wire Line
	19625 2950 19225 2950
Wire Wire Line
	19225 2950 19225 3325
Connection ~ 19225 2950
Wire Wire Line
	20375 2950 19925 2950
Wire Wire Line
	20375 2950 20375 3325
Connection ~ 20375 2950
$Comp
L Device:CP C33
U 1 1 6140A164
P 20375 3525
F 0 "C33" H 20425 3625 39  0000 L CNN
F 1 "100u/25V" H 20400 3425 39  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 20413 3375 50  0001 C CNN
F 3 "~" H 20375 3525 50  0001 C CNN
	1    20375 3525
	1    0    0    -1  
$EndComp
Wire Wire Line
	20375 3675 20375 3725
Wire Wire Line
	20375 3375 20375 3325
Connection ~ 20375 3325
Wire Wire Line
	16275 3225 16275 3375
Wire Wire Line
	16275 3375 16825 3375
Connection ~ 16275 3225
Connection ~ 18550 2775
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 621D2ACE
P 17100 2775
F 0 "JP1" H 17100 2880 39  0000 C CNN
F 1 "SolderJumper_2_Open" H 17100 2889 39  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 17100 2775 50  0001 C CNN
F 3 "~" H 17100 2775 50  0001 C CNN
	1    17100 2775
	1    0    0    -1  
$EndComp
Wire Wire Line
	17250 2775 18550 2775
Wire Wire Line
	16750 2775 16825 2775
Connection ~ 16825 2775
Wire Wire Line
	16825 2775 16950 2775
Wire Wire Line
	19700 5275 19900 5275
Wire Wire Line
	19900 5275 20325 5275
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 5EA23742
P 17100 3375
F 0 "JP2" H 17100 3480 39  0000 C CNN
F 1 "SolderJumper_2_Open" H 17100 3489 39  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 17100 3375 50  0001 C CNN
F 3 "~" H 17100 3375 50  0001 C CNN
	1    17100 3375
	1    0    0    -1  
$EndComp
Wire Wire Line
	16950 3375 16825 3375
Connection ~ 16825 3375
Text Notes 15950 3875 0    39   ~ 0
For 5V power supply:\n- solder JP1, JP2\n- do not install D11, C34, C35, U6
Text Notes 21550 9975 0    39   ~ 0
one of J10 / J11
Text Notes 21125 3050 0    79   ~ 0
PORTS
Text Notes 15950 4125 0    39   ~ 0
If 1818VG19 isn't installed\n- do not install U7, D9, C38
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5E359868
P 17125 2975
F 0 "#FLG01" H 17125 3050 50  0001 C CNN
F 1 "PWR_FLAG" H 17125 3148 50  0001 C CNN
F 2 "" H 17125 2975 50  0001 C CNN
F 3 "~" H 17125 2975 50  0001 C CNN
	1    17125 2975
	1    0    0    -1  
$EndComp
Text Label 6525 7925 2    39   ~ 0
VD3
Text Label 6525 8425 2    39   ~ 0
VD2
Text Label 825  7300 0    39   ~ 0
VA12
Wire Wire Line
	1450 8600 825  8600
Text Label 825  8600 0    39   ~ 0
VA14
Wire Wire Line
	1450 7500 825  7500
Wire Wire Line
	1450 8000 825  8000
Wire Wire Line
	1450 8100 825  8100
Wire Wire Line
	1450 6600 825  6600
Wire Wire Line
	1450 8500 825  8500
Wire Wire Line
	1450 6900 825  6900
Wire Wire Line
	1450 7100 825  7100
Wire Wire Line
	1450 7200 825  7200
Wire Wire Line
	1450 7300 825  7300
Wire Wire Line
	1450 7400 825  7400
Wire Wire Line
	1450 7600 825  7600
Wire Wire Line
	1450 6500 825  6500
Wire Wire Line
	1450 6700 825  6700
Wire Wire Line
	1450 6800 825  6800
Wire Wire Line
	1450 7800 825  7800
Wire Wire Line
	1450 7900 825  7900
Wire Wire Line
	3850 11100 4475 11100
Wire Wire Line
	1450 8700 825  8700
Wire Wire Line
	3850 11000 4475 11000
Wire Wire Line
	1450 8900 825  8900
Wire Wire Line
	1450 8200 825  8200
Wire Wire Line
	1450 8800 825  8800
Wire Wire Line
	1450 8300 825  8300
Wire Wire Line
	1450 8400 825  8400
Wire Wire Line
	1450 7700 825  7700
Wire Wire Line
	1450 7000 825  7000
Text Label 825  8200 0    39   ~ 0
~RFSH
Text Label 825  8300 0    39   ~ 0
~MREQ
Text Label 825  8400 0    39   ~ 0
~IORQ
Text Label 825  6500 0    39   ~ 0
VA1
Text Label 825  7000 0    39   ~ 0
VA5
Text Label 825  8100 0    39   ~ 0
VA16
Text Label 825  7100 0    39   ~ 0
VA17
Text Label 825  7200 0    39   ~ 0
VA13
Text Label 825  6800 0    39   ~ 0
VA7
Text Label 825  8500 0    39   ~ 0
VA15
Text Label 825  7400 0    39   ~ 0
VA11
Text Label 825  7600 0    39   ~ 0
VA9
Text Label 825  8000 0    39   ~ 0
VA8
Text Label 825  6700 0    39   ~ 0
VA18
Text Label 825  6600 0    39   ~ 0
~VWR
Text Label 825  6900 0    39   ~ 0
VA6
Text Label 825  7500 0    39   ~ 0
VA10
Text Label 825  7700 0    39   ~ 0
RA15
Text Label 825  7800 0    39   ~ 0
RA16
Text Label 825  7900 0    39   ~ 0
RA14
Text Label 825  8800 0    39   ~ 0
VD3
Text Label 825  8700 0    39   ~ 0
VD1
Text Label 825  8900 0    39   ~ 0
VD5
Text Label 4475 11100 2    39   ~ 0
VD7
Text Label 4475 11000 2    39   ~ 0
VD6
Wire Wire Line
	1450 6400 825  6400
Wire Wire Line
	1450 6300 825  6300
Text Label 825  6400 0    39   ~ 0
VA0
Text Label 825  6300 0    39   ~ 0
VA2
Text Label 3400 1850 0    39   ~ 0
~RSTCPU
Wire Wire Line
	3400 1850 3675 1850
Entry Wire Line
	3300 1750 3400 1850
$Comp
L power:GND #PWR075
U 1 1 61100997
P 6250 8825
F 0 "#PWR075" H 6250 8575 50  0001 C CNN
F 1 "GND" H 6255 8652 39  0001 C CNN
F 2 "" H 6250 8825 50  0001 C CNN
F 3 "" H 6250 8825 50  0001 C CNN
	1    6250 8825
	0    -1   -1   0   
$EndComp
Text Label 4475 10400 2    39   ~ 0
A13
Wire Wire Line
	3850 10400 4475 10400
Entry Wire Line
	4475 10400 4575 10500
$Comp
L Device:C C36
U 1 1 5ED3DC34
P 12300 3100
F 0 "C36" V 12150 3100 39  0000 C CNN
F 1 "100n" V 12450 3100 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 12338 2950 50  0001 C CNN
F 3 "~" H 12300 3100 50  0001 C CNN
	1    12300 3100
	0    1    1    0   
$EndComp
Entry Wire Line
	11125 1500 11225 1600
Text Label 11225 1600 0    39   ~ 0
TAPE_IN
$Comp
L Device:Q_NPN_CBE Q1
U 1 1 5EEA38E6
P 13200 3100
F 0 "Q1" H 13400 3125 39  0000 L CNN
F 1 "BC547B" H 13391 3055 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 13400 3200 50  0001 C CNN
F 3 "~" H 13200 3100 50  0001 C CNN
	1    13200 3100
	1    0    0    -1  
$EndComp
Entry Wire Line
	14250 1600 14350 1700
Text Label 14250 1600 2    39   ~ 0
TAPE_IN0
$Comp
L power:GND #PWR036
U 1 1 5F443AE8
P 13300 3300
F 0 "#PWR036" H 13300 3050 50  0001 C CNN
F 1 "GND" H 13305 3127 39  0001 C CNN
F 2 "" H 13300 3300 50  0001 C CNN
F 3 "" H 13300 3300 50  0001 C CNN
	1    13300 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 5F5AAAF3
P 13000 2950
F 0 "R14" V 12925 2900 39  0000 L CNN
F 1 "220k" V 13000 2875 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12930 2950 50  0001 C CNN
F 3 "~" H 13000 2950 50  0001 C CNN
	1    13000 2950
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR027
U 1 1 5F5AB3BC
P 13000 2800
F 0 "#PWR027" H 13000 2650 50  0001 C CNN
F 1 "+5V" H 13000 2950 39  0000 C CNN
F 2 "" H 13000 2800 50  0001 C CNN
F 3 "" H 13000 2800 50  0001 C CNN
	1    13000 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D14
U 1 1 5F5AF4D9
P 12800 3250
F 0 "D14" V 12800 3350 39  0000 C CNN
F 1 "BAT85" H 12800 3367 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 12800 3250 50  0001 C CNN
F 3 "~" H 12800 3250 50  0001 C CNN
	1    12800 3250
	0    1    1    0   
$EndComp
Connection ~ 13000 3100
$Comp
L Device:C C37
U 1 1 5F5AE11E
P 12550 3250
F 0 "C37" H 12625 3175 39  0000 C CNN
F 1 "10n" H 12650 3325 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 12588 3100 50  0001 C CNN
F 3 "~" H 12550 3250 50  0001 C CNN
	1    12550 3250
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR039
U 1 1 5F88797C
P 12800 3400
F 0 "#PWR039" H 12800 3150 50  0001 C CNN
F 1 "GND" H 12805 3227 39  0001 C CNN
F 2 "" H 12800 3400 50  0001 C CNN
F 3 "" H 12800 3400 50  0001 C CNN
	1    12800 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR038
U 1 1 5F9F2A72
P 12550 3400
F 0 "#PWR038" H 12550 3150 50  0001 C CNN
F 1 "GND" H 12555 3227 39  0001 C CNN
F 2 "" H 12550 3400 50  0001 C CNN
F 3 "" H 12550 3400 50  0001 C CNN
	1    12550 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 5F9F2C8C
P 11975 3100
F 0 "R15" V 11900 3050 39  0000 L CNN
F 1 "1k" V 11975 3050 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 11905 3100 50  0001 C CNN
F 3 "~" H 11975 3100 50  0001 C CNN
	1    11975 3100
	0    -1   1    0   
$EndComp
Connection ~ 12800 3100
Wire Wire Line
	12800 3100 13000 3100
Connection ~ 12550 3100
Wire Wire Line
	12550 3100 12800 3100
Wire Wire Line
	12450 3100 12550 3100
Wire Wire Line
	12150 3100 12125 3100
$Comp
L Device:CP C23
U 1 1 5EDD4449
P 18775 1900
F 0 "C23" H 18900 1975 39  0000 R CNN
F 1 "220u/16V" H 18950 1825 39  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 18813 1750 50  0001 C CNN
F 3 "~" H 18775 1900 50  0001 C CNN
	1    18775 1900
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C24
U 1 1 5EDD5A80
P 19025 1900
F 0 "C24" H 18925 1825 39  0000 C CNN
F 1 "100n" H 18925 2000 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 19063 1750 50  0001 C CNN
F 3 "~" H 19025 1900 50  0001 C CNN
	1    19025 1900
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5F229864
P 18775 2050
F 0 "#PWR017" H 18775 1800 50  0001 C CNN
F 1 "GND" H 18780 1877 39  0001 C CNN
F 2 "" H 18775 2050 50  0001 C CNN
F 3 "" H 18775 2050 50  0001 C CNN
	1    18775 2050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR012
U 1 1 5EDD683E
P 18250 1675
F 0 "#PWR012" H 18250 1525 50  0001 C CNN
F 1 "+5V" H 18250 1825 39  0000 C CNN
F 2 "" H 18250 1675 50  0001 C CNN
F 3 "" H 18250 1675 50  0001 C CNN
	1    18250 1675
	1    0    0    -1  
$EndComp
Wire Wire Line
	14400 13175 14975 13175
Wire Wire Line
	14400 13075 15025 13075
Connection ~ 14700 12525
Text Label 14800 12700 0    39   ~ 0
AY_ABC
Entry Wire Line
	14700 12600 14800 12700
Entry Wire Line
	19175 14175 19275 14275
Entry Wire Line
	19175 13250 19275 13350
Text Label 19175 13250 2    39   ~ 0
SND_L
$Comp
L Device:CP C44
U 1 1 61F7E0AE
P 18525 13650
F 0 "C44" V 18650 13700 39  0000 R CNN
F 1 "10u/16V" V 18400 13775 39  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 18563 13500 50  0001 C CNN
F 3 "~" H 18525 13650 50  0001 C CNN
	1    18525 13650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R53
U 1 1 5DFA395B
P 16750 13650
F 0 "R53" V 16675 13600 39  0000 L CNN
F 1 "1k" V 16750 13625 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 16680 13650 50  0001 C CNN
F 3 "~" H 16750 13650 50  0001 C CNN
	1    16750 13650
	0    -1   1    0   
$EndComp
$Comp
L Device:R R50
U 1 1 5DFA3543
P 17000 13000
F 0 "R50" V 17075 12950 39  0000 L CNN
F 1 "2k" V 17000 12975 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 16930 13000 50  0001 C CNN
F 3 "~" H 17000 13000 50  0001 C CNN
	1    17000 13000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R52
U 1 1 5DFA313A
P 16750 13250
F 0 "R52" V 16675 13175 39  0000 L CNN
F 1 "1k" V 16750 13200 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 16680 13250 50  0001 C CNN
F 3 "~" H 16750 13250 50  0001 C CNN
	1    16750 13250
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 5FAA7E7C
P 13200 14275
F 0 "#PWR0104" H 13200 14125 50  0001 C CNN
F 1 "+5V" V 13200 14450 39  0000 C CNN
F 2 "" H 13200 14275 50  0001 C CNN
F 3 "" H 13200 14275 50  0001 C CNN
	1    13200 14275
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR092
U 1 1 5FAA7A42
P 14650 13375
F 0 "#PWR092" H 14650 13125 50  0001 C CNN
F 1 "GND" H 14655 13202 39  0001 C CNN
F 2 "" H 14650 13375 50  0001 C CNN
F 3 "" H 14650 13375 50  0001 C CNN
	1    14650 13375
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 5FAA76A3
P 14650 14275
F 0 "#PWR0105" H 14650 14125 50  0001 C CNN
F 1 "+5V" V 14650 14450 39  0000 C CNN
F 2 "" H 14650 14275 50  0001 C CNN
F 3 "" H 14650 14275 50  0001 C CNN
	1    14650 14275
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR095
U 1 1 5ABB2AE9
P 13200 13825
F 0 "#PWR095" H 13200 13675 50  0001 C CNN
F 1 "+5V" V 13200 14000 39  0000 C CNN
F 2 "" H 13200 13825 50  0001 C CNN
F 3 "" H 13200 13825 50  0001 C CNN
	1    13200 13825
	0    -1   -1   0   
$EndComp
Wire Wire Line
	14650 14175 14400 14175
Wire Wire Line
	14400 14075 14650 14075
Wire Wire Line
	14650 13975 14400 13975
Wire Wire Line
	14400 13875 14650 13875
Wire Wire Line
	14650 13775 14400 13775
Wire Wire Line
	14400 13675 14650 13675
Wire Wire Line
	14650 13575 14400 13575
Wire Wire Line
	14400 13475 14650 13475
$Comp
L Connector_Generic:Conn_01x10 J17
U 1 1 5F137689
P 14850 13775
F 0 "J17" H 14775 14275 39  0000 L CNN
F 1 "Conn_01x10" H 14930 13676 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 14850 13775 50  0001 C CNN
F 3 "~" H 14850 13775 50  0001 C CNN
F 4 "AY_IOA" H 14750 13150 39  0000 L CNN "Desc"
	1    14850 13775
	1    0    0    -1  
$EndComp
Entry Wire Line
	19175 13650 19275 13750
Text Label 19175 13650 2    39   ~ 0
SND_R
Text Label 19175 14175 2    39   ~ 0
SND_MONO
$Comp
L Device:Speaker LS1
U 1 1 61103EE0
P 18950 15075
F 0 "LS1" H 18875 15225 39  0000 L CNN
F 1 "WF-2" H 19120 14988 39  0001 L CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 18950 14875 50  0001 C CNN
F 3 "~" H 18940 15025 50  0001 C CNN
	1    18950 15075
	1    0    0    -1  
$EndComp
$Comp
L Device:C C42
U 1 1 5FC1E15F
P 17475 12850
F 0 "C42" V 17550 12950 39  0000 C CNN
F 1 "47n" V 17425 12950 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 17513 12700 50  0001 C CNN
F 3 "~" H 17475 12850 50  0001 C CNN
	1    17475 12850
	0    1    -1   0   
$EndComp
Text Label 16225 12850 0    39   ~ 0
SND_DAC
$Comp
L Device:R R49
U 1 1 5DFA5A0E
P 16750 12850
F 0 "R49" V 16825 12800 39  0000 L CNN
F 1 "270" V 16750 12800 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 16680 12850 50  0001 C CNN
F 3 "~" H 16750 12850 50  0001 C CNN
	1    16750 12850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR088
U 1 1 648731BC
P 17625 12850
F 0 "#PWR088" H 17625 12600 50  0001 C CNN
F 1 "GND" H 17630 12677 39  0001 C CNN
F 2 "" H 17625 12850 50  0001 C CNN
F 3 "" H 17625 12850 50  0001 C CNN
	1    17625 12850
	0    -1   -1   0   
$EndComp
Wire Bus Line
	12775 12525 14700 12525
Wire Wire Line
	12975 12975 13200 12975
Wire Wire Line
	12975 13075 13200 13075
Wire Wire Line
	13200 13175 12975 13175
Wire Wire Line
	12975 13275 13200 13275
Wire Wire Line
	13200 13375 12975 13375
Wire Wire Line
	12975 13475 13200 13475
Wire Wire Line
	12975 13575 13200 13575
Wire Wire Line
	13200 13675 12975 13675
Wire Wire Line
	12875 14525 13200 14525
Wire Wire Line
	13200 14425 12875 14425
Wire Wire Line
	12875 14175 13200 14175
Wire Wire Line
	13200 14075 12875 14075
$Comp
L power:+5V #PWR087
U 1 1 5AB361CA
P 13800 12725
F 0 "#PWR087" H 13800 12575 50  0001 C CNN
F 1 "+5V" H 13800 12875 39  0000 C CNN
F 2 "" H 13800 12725 50  0001 C CNN
F 3 "" H 13800 12725 50  0001 C CNN
	1    13800 12725
	1    0    0    -1  
$EndComp
Entry Wire Line
	12975 12975 12875 12875
Entry Wire Line
	12975 13075 12875 12975
Entry Wire Line
	12975 13175 12875 13075
Entry Wire Line
	12975 13275 12875 13175
Entry Wire Line
	12975 13375 12875 13275
Entry Wire Line
	12975 13475 12875 13375
Entry Wire Line
	12975 13575 12875 13475
Entry Wire Line
	12975 13675 12875 13575
Entry Bus Bus
	12775 12775 12875 12875
Entry Wire Line
	16125 12750 16225 12850
Text Label 12975 13675 0    39   ~ 0
D7
Text Label 12975 13575 0    39   ~ 0
D6
Text Label 12975 13475 0    39   ~ 0
D5
Text Label 12975 13375 0    39   ~ 0
D4
Text Label 12975 13275 0    39   ~ 0
D3
Text Label 12975 13175 0    39   ~ 0
D2
Text Label 12975 13075 0    39   ~ 0
D1
Text Label 12975 12975 0    39   ~ 0
D0
Text Label 12875 14525 0    39   ~ 0
AY_CLK
Text Label 12875 14425 0    39   ~ 0
~RSTCPU
Text Label 12875 14175 0    39   ~ 0
AY_BC1
Text Label 12875 14075 0    39   ~ 0
AY_BDIR
Entry Wire Line
	12775 13975 12875 14075
Entry Wire Line
	12775 14075 12875 14175
Entry Wire Line
	12775 14325 12875 14425
Entry Wire Line
	12775 14425 12875 14525
NoConn ~ 14400 14275
NoConn ~ 14400 14375
NoConn ~ 14400 14475
NoConn ~ 14400 14575
NoConn ~ 14400 14675
NoConn ~ 14400 14775
NoConn ~ 14400 14875
NoConn ~ 14400 14975
NoConn ~ 14400 13325
Text Notes 12825 12500 0    79   ~ 0
SOUND
$Comp
L power:GND #PWR099
U 1 1 5ABCEA74
P 13200 13925
F 0 "#PWR099" H 13200 13675 50  0001 C CNN
F 1 "GND" H 13205 13752 39  0001 C CNN
F 2 "" H 13200 13925 50  0001 C CNN
F 3 "" H 13200 13925 50  0001 C CNN
	1    13200 13925
	0    1    1    0   
$EndComp
NoConn ~ 13200 14625
$Comp
L power:GND #PWR0120
U 1 1 5AB364EB
P 13800 15225
F 0 "#PWR0120" H 13800 14975 50  0001 C CNN
F 1 "GND" H 13805 15052 39  0001 C CNN
F 2 "" H 13800 15225 50  0001 C CNN
F 3 "" H 13800 15225 50  0001 C CNN
	1    13800 15225
	1    0    0    -1  
$EndComp
$Comp
L my:YM2149 U14
U 1 1 5AB2C535
P 13800 14125
F 0 "U14" H 13400 15425 51  0000 C CNN
F 1 "AY-3-8310" H 14125 15425 51  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 13800 15725 39  0001 C CNN
F 3 "" H 13800 15725 39  0001 C CNN
	1    13800 14125
	1    0    0    -1  
$EndComp
$Comp
L power:+5VA #PWR013
U 1 1 5EDB34D4
P 19950 1675
F 0 "#PWR013" H 19950 1525 50  0001 C CNN
F 1 "+5VA" H 19950 1825 39  0000 C CNN
F 2 "" H 19950 1675 50  0001 C CNN
F 3 "" H 19950 1675 50  0001 C CNN
	1    19950 1675
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 5EDD91FA
P 18400 1750
F 0 "L1" V 18475 1800 39  0000 R CNN
F 1 "220u/0.2A" V 18350 1900 39  0000 R CNN
F 2 "Inductor_THT:L_Radial_D7.0mm_P3.00mm" H 18400 1750 50  0001 C CNN
F 3 "~" H 18400 1750 50  0001 C CNN
	1    18400 1750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	18250 1675 18250 1750
Wire Wire Line
	19950 1750 19950 1675
Connection ~ 18775 1750
Wire Wire Line
	18775 1750 19025 1750
Wire Wire Line
	18550 1750 18775 1750
Connection ~ 19025 1750
Wire Wire Line
	21175 925  21400 925 
Wire Wire Line
	21175 1225 21400 1225
Wire Wire Line
	18775 2050 19025 2050
Connection ~ 18775 2050
Connection ~ 19025 2050
Wire Wire Line
	19025 2050 19250 2050
Connection ~ 19250 2050
Wire Wire Line
	19250 2050 19475 2050
Wire Wire Line
	19025 1750 19250 1750
Connection ~ 19250 1750
Wire Wire Line
	19250 1750 19475 1750
Connection ~ 19475 1750
Wire Wire Line
	19475 1750 19700 1750
$Comp
L Device:R R51
U 1 1 5DFA281C
P 17175 13000
F 0 "R51" V 17250 12925 39  0000 L CNN
F 1 "2k" V 17175 12950 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 17105 13000 50  0001 C CNN
F 3 "~" H 17175 13000 50  0001 C CNN
	1    17175 13000
	-1   0    0    -1  
$EndComp
Text Label 825  5600 0    39   ~ 0
CLK14
$Comp
L Device:CP C30
U 1 1 61409C81
P 17325 3200
F 0 "C30" H 17350 3300 39  0000 L CNN
F 1 "100u/50V" H 17200 3100 39  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P2.50mm" H 17363 3050 50  0001 C CNN
F 3 "~" H 17325 3200 50  0001 C CNN
	1    17325 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	19000 3375 19000 3350
Wire Wire Line
	17250 3375 17325 3375
Connection ~ 18075 3375
Wire Wire Line
	18075 3375 18550 3375
Wire Wire Line
	18550 3375 18550 3350
Connection ~ 18550 3375
Wire Wire Line
	18550 3375 19000 3375
Wire Wire Line
	18550 3050 18550 3025
Wire Wire Line
	17325 3375 17325 3350
Connection ~ 17325 3375
Wire Wire Line
	17325 3375 17575 3375
Wire Wire Line
	17575 3350 17575 3375
Connection ~ 17575 3375
Wire Wire Line
	17575 3375 18075 3375
Wire Wire Line
	17125 3025 17325 3025
Connection ~ 17125 3025
Wire Wire Line
	17125 3025 17125 2975
Wire Wire Line
	17325 3050 17325 3025
Connection ~ 17325 3025
Wire Wire Line
	17325 3025 17575 3025
Wire Wire Line
	17575 3050 17575 3025
Connection ~ 17575 3025
Wire Wire Line
	17575 3025 17775 3025
Wire Wire Line
	18375 3025 18550 3025
Connection ~ 18550 3025
Wire Wire Line
	18550 2775 18550 3025
Wire Wire Line
	18550 3025 18625 3025
Wire Wire Line
	18925 3025 19000 3025
Wire Wire Line
	19000 3025 19000 3050
Wire Wire Line
	18075 3375 18075 3325
$Comp
L power:+5V #PWR074
U 1 1 61058EFE
P 22050 8700
F 0 "#PWR074" H 22050 8550 50  0001 C CNN
F 1 "+5V" V 22050 8875 39  0000 C CNN
F 2 "" H 22050 8700 50  0001 C CNN
F 3 "" H 22050 8700 50  0001 C CNN
	1    22050 8700
	0    -1   1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP6
U 1 1 619558A7
P 22200 8700
F 0 "JP6" H 22200 8775 39  0000 C CNN
F 1 "SolderJumper_2_Open" H 22200 8814 39  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 22200 8700 50  0001 C CNN
F 3 "~" H 22200 8700 50  0001 C CNN
	1    22200 8700
	1    0    0    -1  
$EndComp
Wire Wire Line
	22350 8550 22350 8700
Wire Wire Line
	22050 8550 22350 8550
$Comp
L Connector_Generic:Conn_01x04 J4
U 1 1 6720E1D9
P 21875 3500
F 0 "J4" H 21950 3450 50  0000 L CNN
F 1 "WF-4" H 21955 3401 50  0001 L CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-04A_1x04_P2.54mm_Vertical" H 21875 3500 50  0001 C CNN
F 3 "~" H 21875 3500 50  0001 C CNN
	1    21875 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C43
U 1 1 5D1A1953
P 18525 13250
F 0 "C43" V 18650 13300 39  0000 R CNN
F 1 "10u/16V" V 18400 13375 39  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 18563 13100 50  0001 C CNN
F 3 "~" H 18525 13250 50  0001 C CNN
	1    18525 13250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	21200 7325 21500 7325
Text Label 21200 7325 0    39   ~ 0
~JOY_B1
$Comp
L power:+5V #PWR066
U 1 1 5B8C405E
P 21500 7125
F 0 "#PWR066" H 21500 6975 50  0001 C CNN
F 1 "+5V" V 21500 7300 39  0000 C CNN
F 2 "" H 21500 7125 50  0001 C CNN
F 3 "" H 21500 7125 50  0001 C CNN
	1    21500 7125
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR064
U 1 1 5BA137C5
P 21500 6925
F 0 "#PWR064" H 21500 6675 50  0001 C CNN
F 1 "GND" V 21505 6752 39  0000 C CNN
F 2 "" H 21500 6925 50  0001 C CNN
F 3 "" H 21500 6925 50  0001 C CNN
	1    21500 6925
	0    1    1    0   
$EndComp
Wire Wire Line
	21500 6725 21200 6725
Text Label 21200 6725 0    39   ~ 0
~JOY_B2
Wire Wire Line
	21200 6625 21500 6625
Text Label 21200 6625 0    39   ~ 0
~JOY_B3
Wire Wire Line
	21200 6825 21500 6825
Text Label 21200 6825 0    39   ~ 0
~JOY_RIGHT
Wire Wire Line
	21500 7025 21200 7025
Text Label 21200 7025 0    39   ~ 0
~JOY_LEFT
Wire Wire Line
	21200 7225 21500 7225
Text Label 21200 7225 0    39   ~ 0
~JOY_DOWN
Wire Wire Line
	21500 7425 21200 7425
Text Label 21200 7425 0    39   ~ 0
~JOY_UP
Text Label 21200 5825 0    39   ~ 0
~JOY_DOWN
Wire Wire Line
	21200 5825 21525 5825
Text Label 21200 5925 0    39   ~ 0
~JOY_LEFT
$Comp
L power:+5V #PWR054
U 1 1 5D1A2EA5
P 22025 5825
F 0 "#PWR054" H 22025 5675 50  0001 C CNN
F 1 "+5V" V 22025 6000 39  0000 C CNN
F 2 "" H 22025 5825 50  0001 C CNN
F 3 "" H 22025 5825 50  0001 C CNN
	1    22025 5825
	0    1    1    0   
$EndComp
Wire Wire Line
	22025 5725 22400 5725
Entry Wire Line
	21100 5925 21200 6025
Wire Wire Line
	21200 6025 21525 6025
Entry Wire Line
	22400 6025 22500 6125
Wire Wire Line
	22025 6025 22400 6025
$Comp
L Device:D_Bridge_-AA+ D13
U 1 1 624DC962
P 16825 3075
F 0 "D13" H 16775 3075 39  0000 L CNN
F 1 "DB207" H 17169 3030 39  0001 L CNN
F 2 "my:DB-1" H 16825 3075 50  0001 C CNN
F 3 "~" H 16825 3075 50  0001 C CNN
	1    16825 3075
	1    0    0    -1  
$EndComp
$Comp
L my:Conn_FDC_IBM J9
U 1 1 60DCC0B8
P 13975 6600
F 0 "J9" H 13975 7625 50  0000 C CNN
F 1 "Conn_02x17_Odd_Even" H 13975 7534 50  0001 C CNN
F 2 "my:IDC-Header_2x17_P2.54mm_Horizontal_Mirrored" H 13725 6600 50  0001 C CNN
F 3 "~" H 13725 6600 50  0001 C CNN
F 4 "Conn_FDC" H 13975 7525 51  0000 C CNN "Desc"
	1    13975 6600
	-1   0    0    -1  
$EndComp
NoConn ~ 13525 5900
$Comp
L Regulator_Switching:LM2596T-ADJ U8
U 1 1 5E858378
P 17175 5125
F 0 "U8" H 17175 5475 39  0000 C CNN
F 1 "LM2596T-ADJ" H 17175 5401 39  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-5_Horizontal_TabDown" H 17225 4875 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2596.pdf" H 17175 5125 50  0001 C CNN
	1    17175 5125
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR049
U 1 1 5E859E15
P 17175 5425
F 0 "#PWR049" H 17175 5175 50  0001 C CNN
F 1 "GND" H 17180 5252 39  0001 C CNN
F 2 "" H 17175 5425 50  0001 C CNN
F 3 "" H 17175 5425 50  0001 C CNN
	1    17175 5425
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR048
U 1 1 5E85A27D
P 16675 5225
F 0 "#PWR048" H 16675 4975 50  0001 C CNN
F 1 "GND" H 16680 5052 39  0001 C CNN
F 2 "" H 16675 5225 50  0001 C CNN
F 3 "" H 16675 5225 50  0001 C CNN
	1    16675 5225
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR050
U 1 1 5E864B38
P 17775 5525
F 0 "#PWR050" H 17775 5275 50  0001 C CNN
F 1 "GND" H 17780 5352 39  0001 C CNN
F 2 "" H 17775 5525 50  0001 C CNN
F 3 "" H 17775 5525 50  0001 C CNN
	1    17775 5525
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 5E9BCEDA
P 18300 5050
F 0 "R19" V 18225 4975 39  0000 L CNN
F 1 "3.1k" V 18300 4975 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 18230 5050 50  0001 C CNN
F 3 "~" H 18300 5050 50  0001 C CNN
	1    18300 5050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	13050 5950 13050 6125
Wire Wire Line
	13525 6200 13150 6200
Wire Wire Line
	13150 6200 13150 6125
Wire Wire Line
	13150 6125 13050 6125
Connection ~ 13050 6125
Wire Wire Line
	13050 6125 13050 6500
Wire Bus Line
	14725 5475 14725 8825
Wire Bus Line
	13100 5475 14725 5475
$Comp
L Device:C C21
U 1 1 6544E5F0
P 21625 1075
F 0 "C21" H 21525 1000 39  0000 C CNN
F 1 "100n" H 21525 1175 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 21663 925 50  0001 C CNN
F 3 "~" H 21625 1075 50  0001 C CNN
	1    21625 1075
	-1   0    0    1   
$EndComp
Wire Wire Line
	21400 1225 21625 1225
Wire Wire Line
	21400 925  21625 925 
Entry Wire Line
	3300 1650 3400 1750
Wire Wire Line
	3400 1750 3675 1750
Text Label 3400 1750 0    39   ~ 0
~RD
$Comp
L 74xx:74HC04 U3
U 1 1 5EA1DC74
P 16775 15075
F 0 "U3" H 16775 15368 39  0000 C CNN
F 1 "74HCU04" H 16775 15293 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 16775 15075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 16775 15075 50  0001 C CNN
	1    16775 15075
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U3
U 2 1 5EA1EE52
P 17375 15075
F 0 "U3" H 17375 15368 39  0000 C CNN
F 1 "74HCU04" H 17375 15293 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 17375 15075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 17375 15075 50  0001 C CNN
	2    17375 15075
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U3
U 3 1 5EA1F7A0
P 17975 15075
F 0 "U3" H 17975 15368 39  0000 C CNN
F 1 "74HCU04" H 17975 15293 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 17975 15075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 17975 15075 50  0001 C CNN
	3    17975 15075
	1    0    0    -1  
$EndComp
$Comp
L Device:R R85
U 1 1 5EA20D55
P 17325 15400
F 0 "R85" V 17250 15350 39  0000 L CNN
F 1 "100k" V 17325 15325 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 17255 15400 50  0001 C CNN
F 3 "~" H 17325 15400 50  0001 C CNN
	1    17325 15400
	0    -1   1    0   
$EndComp
Wire Wire Line
	17475 15400 18275 15400
Wire Wire Line
	18275 15400 18275 15075
Wire Wire Line
	16475 15075 16475 15400
Wire Wire Line
	16475 15400 17175 15400
$Comp
L Device:C C50
U 1 1 5EDF4994
P 17700 14700
F 0 "C50" V 17575 14700 39  0000 C CNN
F 1 "100n" V 17825 14700 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 17738 14550 50  0001 C CNN
F 3 "~" H 17700 14700 50  0001 C CNN
	1    17700 14700
	0    -1   1    0   
$EndComp
Connection ~ 16475 15075
$Comp
L Device:CP C51
U 1 1 5F08D456
P 18450 15075
F 0 "C51" V 18575 15025 39  0000 L CNN
F 1 "220u/16V" V 18325 14925 39  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 18488 14925 50  0001 C CNN
F 3 "~" H 18450 15075 50  0001 C CNN
	1    18450 15075
	0    -1   -1   0   
$EndComp
Connection ~ 18275 15075
Text Label 4200 13475 0    39   ~ 0
Csync
Entry Wire Line
	4100 14750 4200 14850
Text Label 4200 14050 0    39   ~ 0
Red
Entry Wire Line
	4100 14350 4200 14450
Entry Wire Line
	4100 13375 4200 13475
Text Label 4200 14450 0    39   ~ 0
Green
Entry Wire Line
	4100 13950 4200 14050
Text Label 4200 14850 0    39   ~ 0
Blue
Text Label 4200 15250 0    39   ~ 0
Bright
Entry Wire Line
	4100 15150 4200 15250
Text Label 7675 14250 2    39   ~ 0
VID_R
Text Label 7675 15050 2    39   ~ 0
VID_B
Entry Wire Line
	7675 14250 7775 14350
Wire Bus Line
	7775 13000 4100 13000
Text Notes 4150 12975 0    79   ~ 0
ANALOG VIDEO OUTPUT
$Comp
L Device:R R68
U 1 1 68E90A04
P 4600 14050
F 0 "R68" V 4675 14000 39  0000 L CNN
F 1 "3.6k" V 4600 14000 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4530 14050 50  0001 C CNN
F 3 "~" H 4600 14050 50  0001 C CNN
	1    4600 14050
	0    -1   -1   0   
$EndComp
$Comp
L Device:Q_NPN_CBE Q3
U 1 1 68E91394
P 6550 14050
F 0 "Q3" H 6750 14075 39  0000 L CNN
F 1 "BC547C" H 6750 14000 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6750 14150 50  0001 C CNN
F 3 "~" H 6550 14050 50  0001 C CNN
	1    6550 14050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R70
U 1 1 68E91BA0
P 7175 14250
F 0 "R70" V 7250 14200 39  0000 L CNN
F 1 "68" V 7175 14200 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7105 14250 50  0001 C CNN
F 3 "~" H 7175 14250 50  0001 C CNN
	1    7175 14250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7325 14250 7675 14250
Entry Wire Line
	7675 14650 7775 14750
Text Label 7675 14650 2    39   ~ 0
VID_G
Wire Wire Line
	4200 14050 4450 14050
Wire Wire Line
	4750 14050 5175 14050
$Comp
L Device:Q_NPN_CBE Q5
U 1 1 699EBEC3
P 5950 14850
F 0 "Q5" H 6150 14875 39  0000 L CNN
F 1 "BC547C" H 6150 14800 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6150 14950 50  0001 C CNN
F 3 "~" H 5950 14850 50  0001 C CNN
	1    5950 14850
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_CBE Q4
U 1 1 699EB48B
P 6250 14450
F 0 "Q4" H 6450 14475 39  0000 L CNN
F 1 "BC547C" H 6450 14400 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6450 14550 50  0001 C CNN
F 3 "~" H 6250 14450 50  0001 C CNN
	1    6250 14450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R73
U 1 1 69DBFD2D
P 7175 14650
F 0 "R73" V 7250 14600 39  0000 L CNN
F 1 "68" V 7175 14600 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7105 14650 50  0001 C CNN
F 3 "~" H 7175 14650 50  0001 C CNN
	1    7175 14650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R75
U 1 1 69DC0076
P 7175 15050
F 0 "R75" V 7250 15000 39  0000 L CNN
F 1 "68" V 7175 15000 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7105 15050 50  0001 C CNN
F 3 "~" H 7175 15050 50  0001 C CNN
	1    7175 15050
	0    -1   -1   0   
$EndComp
Text Label 7675 13675 2    39   ~ 0
VID_SYNC
Entry Wire Line
	7675 15050 7775 15150
Entry Wire Line
	7675 13675 7775 13775
Wire Wire Line
	7675 15050 7325 15050
Wire Wire Line
	7325 14650 7675 14650
Wire Wire Line
	6050 14450 5525 14450
Wire Wire Line
	5750 14850 5350 14850
$Comp
L Device:R R72
U 1 1 6AD19095
P 4600 14450
F 0 "R72" V 4675 14400 39  0000 L CNN
F 1 "3.6k" V 4600 14400 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4530 14450 50  0001 C CNN
F 3 "~" H 4600 14450 50  0001 C CNN
	1    4600 14450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4450 14450 4200 14450
$Comp
L Device:R R74
U 1 1 6AE621E9
P 4600 14850
F 0 "R74" V 4675 14800 39  0000 L CNN
F 1 "3.6k" V 4600 14800 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4530 14850 50  0001 C CNN
F 3 "~" H 4600 14850 50  0001 C CNN
	1    4600 14850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4450 14850 4200 14850
$Comp
L Device:R R76
U 1 1 6AE624FD
P 4825 15100
F 0 "R76" V 4900 15050 39  0000 L CNN
F 1 "3.6k" V 4825 15050 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4755 15100 50  0001 C CNN
F 3 "~" H 4825 15100 50  0001 C CNN
	1    4825 15100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R77
U 1 1 6AE62B90
P 5000 15100
F 0 "R77" V 5075 15050 39  0000 L CNN
F 1 "3.6k" V 5000 15050 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4930 15100 50  0001 C CNN
F 3 "~" H 5000 15100 50  0001 C CNN
	1    5000 15100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R78
U 1 1 6AE63033
P 5175 15100
F 0 "R78" V 5250 15050 39  0000 L CNN
F 1 "3.6k" V 5175 15050 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5105 15100 50  0001 C CNN
F 3 "~" H 5175 15100 50  0001 C CNN
	1    5175 15100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R79
U 1 1 6AE63367
P 5350 15100
F 0 "R79" V 5425 15050 39  0000 L CNN
F 1 "3.6k" V 5350 15050 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5280 15100 50  0001 C CNN
F 3 "~" H 5350 15100 50  0001 C CNN
	1    5350 15100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R80
U 1 1 6AE636A4
P 5525 15100
F 0 "R80" V 5600 15050 39  0000 L CNN
F 1 "3.6k" V 5525 15050 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5455 15100 50  0001 C CNN
F 3 "~" H 5525 15100 50  0001 C CNN
	1    5525 15100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R81
U 1 1 6AE638B4
P 5700 15100
F 0 "R81" V 5775 15050 39  0000 L CNN
F 1 "3.6k" V 5700 15050 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5630 15100 50  0001 C CNN
F 3 "~" H 5700 15100 50  0001 C CNN
	1    5700 15100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4825 14950 4825 14850
Connection ~ 4825 14850
Wire Wire Line
	4825 14850 4750 14850
Wire Wire Line
	5000 14950 5000 14450
Connection ~ 5000 14450
Wire Wire Line
	5000 14450 4750 14450
Wire Wire Line
	5175 14950 5175 14050
Connection ~ 5175 14050
Wire Wire Line
	5350 14850 5350 14950
Connection ~ 5350 14850
Wire Wire Line
	5350 14850 4825 14850
Wire Wire Line
	5525 14950 5525 14450
Connection ~ 5525 14450
Wire Wire Line
	5525 14450 5000 14450
Wire Wire Line
	5700 14950 5700 14050
Wire Wire Line
	5175 14050 5700 14050
Connection ~ 5700 14050
Wire Wire Line
	5700 14050 6350 14050
$Comp
L power:GND #PWR0121
U 1 1 6B7859FF
P 5350 15250
F 0 "#PWR0121" H 5350 15000 50  0001 C CNN
F 1 "GND" H 5355 15077 39  0001 C CNN
F 2 "" H 5350 15250 50  0001 C CNN
F 3 "" H 5350 15250 50  0001 C CNN
	1    5350 15250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 6B785F25
P 5525 15250
F 0 "#PWR0122" H 5525 15000 50  0001 C CNN
F 1 "GND" H 5530 15077 39  0001 C CNN
F 2 "" H 5525 15250 50  0001 C CNN
F 3 "" H 5525 15250 50  0001 C CNN
	1    5525 15250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 6B786113
P 5700 15250
F 0 "#PWR0123" H 5700 15000 50  0001 C CNN
F 1 "GND" H 5705 15077 39  0001 C CNN
F 2 "" H 5700 15250 50  0001 C CNN
F 3 "" H 5700 15250 50  0001 C CNN
	1    5700 15250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5175 15250 5000 15250
Connection ~ 4825 15250
Wire Wire Line
	4825 15250 4200 15250
Connection ~ 5000 15250
Wire Wire Line
	5000 15250 4825 15250
$Comp
L Device:Q_NPN_CBE Q2
U 1 1 7241A3F7
P 6850 13475
F 0 "Q2" H 7050 13500 39  0000 L CNN
F 1 "BC547C" H 7050 13425 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7050 13575 50  0001 C CNN
F 3 "~" H 6850 13475 50  0001 C CNN
	1    6850 13475
	1    0    0    -1  
$EndComp
$Comp
L Device:R R54
U 1 1 7241ACE2
P 7175 13675
F 0 "R54" V 7250 13625 39  0000 L CNN
F 1 "270" V 7175 13625 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7105 13675 50  0001 C CNN
F 3 "~" H 7175 13675 50  0001 C CNN
	1    7175 13675
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R60
U 1 1 72573B34
P 7175 13850
F 0 "R60" V 7250 13800 39  0000 L CNN
F 1 "270" V 7175 13800 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7105 13850 50  0001 C CNN
F 3 "~" H 7175 13850 50  0001 C CNN
	1    7175 13850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6950 13675 7025 13675
Wire Wire Line
	7025 13850 6950 13850
Wire Wire Line
	6950 13850 6950 13675
Connection ~ 6950 13675
$Comp
L power:GND #PWR097
U 1 1 7298592F
P 7325 13850
F 0 "#PWR097" H 7325 13600 50  0001 C CNN
F 1 "GND" H 7330 13677 39  0001 C CNN
F 2 "" H 7325 13850 50  0001 C CNN
F 3 "" H 7325 13850 50  0001 C CNN
	1    7325 13850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7325 13675 7675 13675
Wire Wire Line
	6650 13475 4200 13475
Wire Wire Line
	10300 13675 10150 13675
NoConn ~ 11150 14225
NoConn ~ 11150 14025
Entry Wire Line
	7775 14425 7875 14525
Text Label 7875 14525 0    39   ~ 0
Csync
$Comp
L power:GND #PWR0108
U 1 1 603743C2
P 9350 14425
F 0 "#PWR0108" H 9350 14175 50  0001 C CNN
F 1 "GND" H 9355 14252 39  0001 C CNN
F 2 "" H 9350 14425 50  0001 C CNN
F 3 "" H 9350 14425 50  0001 C CNN
	1    9350 14425
	0    1    1    0   
$EndComp
$Comp
L Device:CP C49
U 1 1 5E81E8E8
P 11300 14425
F 0 "C49" V 11425 14375 39  0000 L CNN
F 1 "220u/16V" V 11175 14275 39  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 11338 14275 50  0001 C CNN
F 3 "~" H 11300 14425 50  0001 C CNN
	1    11300 14425
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R71
U 1 1 5E6B36FC
P 11600 14425
F 0 "R71" V 11675 14375 39  0000 L CNN
F 1 "75" V 11600 14375 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 11530 14425 50  0001 C CNN
F 3 "~" H 11600 14425 50  0001 C CNN
	1    11600 14425
	0    -1   -1   0   
$EndComp
Entry Wire Line
	12025 14425 12125 14525
Text Label 12025 14425 2    39   ~ 0
VID_COMP
Wire Wire Line
	11750 14425 12025 14425
$Comp
L power:GND #PWR0112
U 1 1 5E542D05
P 11150 14625
F 0 "#PWR0112" H 11150 14375 50  0001 C CNN
F 1 "GND" H 11155 14452 39  0001 C CNN
F 2 "" H 11150 14625 50  0001 C CNN
F 3 "" H 11150 14625 50  0001 C CNN
	1    11150 14625
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5E5422A8
P 10150 15025
F 0 "#PWR0116" H 10150 14775 50  0001 C CNN
F 1 "GND" H 10155 14852 39  0001 C CNN
F 2 "" H 10150 15025 50  0001 C CNN
F 3 "" H 10150 15025 50  0001 C CNN
	1    10150 15025
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5E54129E
P 10350 15025
F 0 "#PWR0117" H 10350 14775 50  0001 C CNN
F 1 "GND" H 10355 14852 39  0001 C CNN
F 2 "" H 10350 15025 50  0001 C CNN
F 3 "" H 10350 15025 50  0001 C CNN
	1    10350 15025
	1    0    0    -1  
$EndComp
$Comp
L power:+5VA #PWR094
U 1 1 60B4ED17
P 10150 13675
F 0 "#PWR094" H 10150 13525 50  0001 C CNN
F 1 "+5VA" H 10150 13825 39  0000 C CNN
F 2 "" H 10150 13675 50  0001 C CNN
F 3 "" H 10150 13675 50  0001 C CNN
	1    10150 13675
	1    0    0    -1  
$EndComp
$Comp
L power:+5VA #PWR0107
U 1 1 6147EB23
P 9350 14325
F 0 "#PWR0107" H 9350 14175 50  0001 C CNN
F 1 "+5VA" V 9350 14525 39  0000 C CNN
F 2 "" H 9350 14325 50  0001 C CNN
F 3 "" H 9350 14325 50  0001 C CNN
	1    9350 14325
	0    -1   -1   0   
$EndComp
$Comp
L power:+5VA #PWR0111
U 1 1 61481655
P 9350 14625
F 0 "#PWR0111" H 9350 14475 50  0001 C CNN
F 1 "+5VA" V 9350 14825 39  0000 C CNN
F 2 "" H 9350 14625 50  0001 C CNN
F 3 "" H 9350 14625 50  0001 C CNN
	1    9350 14625
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7875 14525 9350 14525
$Comp
L power:GND #PWR0126
U 1 1 642E2DC1
P 8650 15325
F 0 "#PWR0126" H 8650 15075 50  0001 C CNN
F 1 "GND" H 8655 15152 39  0001 C CNN
F 2 "" H 8650 15325 50  0001 C CNN
F 3 "" H 8650 15325 50  0001 C CNN
	1    8650 15325
	1    0    0    -1  
$EndComp
$Comp
L Device:R R84
U 1 1 63CF36E9
P 8650 15175
F 0 "R84" V 8725 15125 39  0000 L CNN
F 1 "75" V 8650 15125 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 8580 15175 50  0001 C CNN
F 3 "~" H 8650 15175 50  0001 C CNN
	1    8650 15175
	1    0    0    -1  
$EndComp
Text Label 7875 14725 0    39   ~ 0
CLK17
Entry Wire Line
	7775 14625 7875 14725
Wire Wire Line
	7875 14725 9350 14725
Connection ~ 6975 14250
Wire Wire Line
	6975 14250 7025 14250
Wire Wire Line
	6650 14250 6975 14250
Connection ~ 10150 13675
$Comp
L ad724:AD724 U15
U 1 1 5E532A93
P 10250 14325
F 0 "U15" H 10200 14400 50  0000 C CNN
F 1 "AD724" H 10200 14275 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_7.5x10.3mm_P1.27mm" H 10250 15075 50  0001 C CNN
F 3 "" H 10250 14325 50  0001 C CNN
	1    10250 14325
	1    0    0    -1  
$EndComp
Wire Wire Line
	6975 14250 6975 14050
Wire Wire Line
	6975 14050 8175 14050
Wire Wire Line
	6975 14650 6975 14375
Wire Wire Line
	6975 14375 8425 14375
Wire Wire Line
	6975 14900 8650 14900
Wire Bus Line
	7775 13000 12125 13000
Connection ~ 7775 13000
$Comp
L Device:R R83
U 1 1 63B7C123
P 8425 15175
F 0 "R83" V 8500 15125 39  0000 L CNN
F 1 "75" V 8425 15125 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 8355 15175 50  0001 C CNN
F 3 "~" H 8425 15175 50  0001 C CNN
	1    8425 15175
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 642E346F
P 8425 15325
F 0 "#PWR0125" H 8425 15075 50  0001 C CNN
F 1 "GND" H 8430 15152 39  0001 C CNN
F 2 "" H 8425 15325 50  0001 C CNN
F 3 "" H 8425 15325 50  0001 C CNN
	1    8425 15325
	1    0    0    -1  
$EndComp
$Comp
L Device:R R82
U 1 1 63CF339A
P 8175 15175
F 0 "R82" V 8250 15125 39  0000 L CNN
F 1 "75" V 8175 15125 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 8105 15175 50  0001 C CNN
F 3 "~" H 8175 15175 50  0001 C CNN
	1    8175 15175
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 642E3270
P 8175 15325
F 0 "#PWR0124" H 8175 15075 50  0001 C CNN
F 1 "GND" H 8180 15152 39  0001 C CNN
F 2 "" H 8175 15325 50  0001 C CNN
F 3 "" H 8175 15325 50  0001 C CNN
	1    8175 15325
	1    0    0    -1  
$EndComp
$Comp
L Device:R R69
U 1 1 63106C9B
P 8800 14125
F 0 "R69" V 8875 14050 39  0000 L CNN
F 1 "68" V 8800 14075 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 8730 14125 50  0001 C CNN
F 3 "~" H 8800 14125 50  0001 C CNN
	1    8800 14125
	0    -1   1    0   
$EndComp
$Comp
L Device:C C46
U 1 1 62CA0E9C
P 8875 13950
F 0 "C46" V 8925 13850 39  0000 C CNN
F 1 "100n" V 8825 13825 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8913 13800 50  0001 C CNN
F 3 "~" H 8875 13950 50  0001 C CNN
	1    8875 13950
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C47
U 1 1 62CA1138
P 9100 14125
F 0 "C47" V 9150 14025 39  0000 C CNN
F 1 "100n" V 9050 14000 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9138 13975 50  0001 C CNN
F 3 "~" H 9100 14125 50  0001 C CNN
	1    9100 14125
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C45
U 1 1 62CA04A1
P 8625 13775
F 0 "C45" V 8675 13675 39  0000 C CNN
F 1 "100n" V 8575 13650 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8663 13625 50  0001 C CNN
F 3 "~" H 8625 13775 50  0001 C CNN
	1    8625 13775
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8425 14375 8425 13950
$Comp
L Device:R R67
U 1 1 63107234
P 8575 13950
F 0 "R67" V 8650 13875 39  0000 L CNN
F 1 "68" V 8575 13900 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 8505 13950 50  0001 C CNN
F 3 "~" H 8575 13950 50  0001 C CNN
	1    8575 13950
	0    -1   1    0   
$EndComp
Wire Wire Line
	9250 14125 9350 14125
Wire Wire Line
	8175 14050 8175 13775
Wire Wire Line
	8775 13775 9350 13775
Wire Wire Line
	9350 13775 9350 13925
Wire Wire Line
	9350 14025 9275 14025
Wire Wire Line
	9275 14025 9275 13950
Wire Wire Line
	9275 13950 9025 13950
Wire Wire Line
	8425 15025 8425 14375
Connection ~ 8425 14375
Wire Wire Line
	8175 15025 8175 14050
Connection ~ 8175 14050
$Comp
L Device:R R59
U 1 1 63107561
P 8325 13775
F 0 "R59" V 8400 13700 39  0000 L CNN
F 1 "68" V 8325 13725 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 8255 13775 50  0001 C CNN
F 3 "~" H 8325 13775 50  0001 C CNN
	1    8325 13775
	0    -1   1    0   
$EndComp
Connection ~ 6975 14650
Wire Wire Line
	6975 14650 7025 14650
Wire Wire Line
	6350 14650 6975 14650
Connection ~ 6975 15050
Wire Wire Line
	6975 15050 7025 15050
Wire Wire Line
	6050 15050 6975 15050
Connection ~ 8650 14900
Wire Wire Line
	8650 14900 8650 14125
Wire Wire Line
	8650 14900 8650 15025
Wire Wire Line
	6975 14900 6975 15050
$Comp
L Mechanical:MountingHole H5
U 1 1 5E3124C4
P 20475 13450
F 0 "H5" H 20575 13450 50  0000 L CNN
F 1 "MountingHole" H 20575 13405 50  0001 L CNN
F 2 "MountingHole:MountingHole_3mm" H 20575 13359 50  0001 L CNN
F 3 "~" H 20475 13450 50  0001 C CNN
	1    20475 13450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5E312288
P 20475 13275
F 0 "H4" H 20575 13275 50  0000 L CNN
F 1 "MountingHole" H 20575 13230 50  0001 L CNN
F 2 "MountingHole:MountingHole_3mm" H 20575 13184 50  0001 L CNN
F 3 "~" H 20475 13275 50  0001 C CNN
	1    20475 13275
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5E30CA87
P 20475 13100
F 0 "H3" H 20575 13100 50  0000 L CNN
F 1 "MountingHole" H 20575 13055 50  0001 L CNN
F 2 "MountingHole:MountingHole_3mm" H 20575 13009 50  0001 L CNN
F 3 "~" H 20475 13100 50  0001 C CNN
	1    20475 13100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5E1A5D2A
P 20475 12750
F 0 "H1" H 20575 12750 50  0000 L CNN
F 1 "MountingHole" H 20575 12705 50  0001 L CNN
F 2 "MountingHole:MountingHole_5mm" H 20475 12750 50  0001 C CNN
F 3 "~" H 20475 12750 50  0001 C CNN
	1    20475 12750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5E19FA9B
P 20475 12925
F 0 "H2" H 20575 12925 50  0000 L CNN
F 1 "MountingHole" H 20575 12880 50  0001 L CNN
F 2 "MountingHole:MountingHole_5mm" H 20475 12925 50  0001 C CNN
F 3 "~" H 20475 12925 50  0001 C CNN
	1    20475 12925
	1    0    0    -1  
$EndComp
Wire Wire Line
	18675 13650 19175 13650
Wire Wire Line
	18675 13250 19175 13250
Wire Wire Line
	18750 15075 18600 15075
$Comp
L power:GND #PWR0118
U 1 1 6902DF34
P 18750 15175
F 0 "#PWR0118" H 18750 14925 50  0001 C CNN
F 1 "GND" H 18755 15002 39  0001 C CNN
F 2 "" H 18750 15175 50  0001 C CNN
F 3 "" H 18750 15175 50  0001 C CNN
	1    18750 15175
	0    1    1    0   
$EndComp
Wire Wire Line
	16475 15075 16475 14700
Wire Wire Line
	16475 14700 17550 14700
Wire Wire Line
	16900 12850 17000 12850
$Comp
L Device:R R61
U 1 1 616E6721
P 17000 13900
F 0 "R61" V 17075 13850 39  0000 L CNN
F 1 "2k" V 17000 13875 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 16930 13900 50  0001 C CNN
F 3 "~" H 17000 13900 50  0001 C CNN
	1    17000 13900
	-1   0    0    1   
$EndComp
Wire Wire Line
	17175 13250 17175 13150
Wire Wire Line
	16900 13250 17175 13250
Wire Wire Line
	16225 12850 16600 12850
Wire Wire Line
	17000 13150 17000 13650
Connection ~ 18275 14175
Connection ~ 16125 12525
Wire Bus Line
	16125 12525 19275 12525
Wire Bus Line
	14700 12525 16125 12525
Wire Wire Line
	18275 14550 18275 14175
$Comp
L power:GND #PWR0114
U 1 1 6EE73DB7
P 18425 14700
F 0 "#PWR0114" H 18425 14450 50  0001 C CNN
F 1 "GND" H 18430 14527 39  0001 C CNN
F 2 "" H 18425 14700 50  0001 C CNN
F 3 "" H 18425 14700 50  0001 C CNN
	1    18425 14700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 6EE72B66
P 18275 14700
F 0 "RV1" V 18175 14700 39  0000 C CNN
F 1 "47k" V 18275 14700 39  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Runtron_RM-063_Horizontal" H 18275 14700 50  0001 C CNN
F 3 "~" H 18275 14700 50  0001 C CNN
	1    18275 14700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R62
U 1 1 616E6A21
P 17175 13900
F 0 "R62" V 17250 13825 39  0000 L CNN
F 1 "2k" V 17175 13850 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 17105 13900 50  0001 C CNN
F 3 "~" H 17175 13900 50  0001 C CNN
	1    17175 13900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	18075 14175 18075 14050
Wire Wire Line
	18275 14175 18075 14175
$Comp
L Device:R R66
U 1 1 61F7E0B5
P 18075 13900
F 0 "R66" V 18000 13825 39  0000 L CNN
F 1 "4.7k" V 18075 13850 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 18005 13900 50  0001 C CNN
F 3 "~" H 18075 13900 50  0001 C CNN
	1    18075 13900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R63
U 1 1 635C1F2F
P 17500 13900
F 0 "R63" V 17425 13825 39  0000 L CNN
F 1 "1k" V 17500 13850 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 17430 13900 50  0001 C CNN
F 3 "~" H 17500 13900 50  0001 C CNN
	1    17500 13900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R64
U 1 1 635C2531
P 17675 13900
F 0 "R64" V 17600 13825 39  0000 L CNN
F 1 "1k" V 17675 13850 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 17605 13900 50  0001 C CNN
F 3 "~" H 17675 13900 50  0001 C CNN
	1    17675 13900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 61F7E0BC
P 17675 14050
F 0 "#PWR0101" H 17675 13800 50  0001 C CNN
F 1 "GND" H 17680 13877 39  0001 C CNN
F 2 "" H 17675 14050 50  0001 C CNN
F 3 "" H 17675 14050 50  0001 C CNN
	1    17675 14050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0100
U 1 1 5FAD4AEB
P 17500 14050
F 0 "#PWR0100" H 17500 13800 50  0001 C CNN
F 1 "GND" H 17505 13877 39  0001 C CNN
F 2 "" H 17500 14050 50  0001 C CNN
F 3 "" H 17500 14050 50  0001 C CNN
	1    17500 14050
	1    0    0    -1  
$EndComp
Wire Wire Line
	17000 13750 17000 13650
Wire Wire Line
	17175 13750 17175 13250
Wire Wire Line
	18075 13750 18075 13250
Connection ~ 18075 13250
Wire Wire Line
	18075 13250 18375 13250
Wire Wire Line
	17675 13750 17675 13250
Wire Wire Line
	17500 13750 17500 13650
Wire Wire Line
	16900 13650 17000 13650
$Comp
L power:GND #PWR0109
U 1 1 627AFB9F
P 15775 14650
F 0 "#PWR0109" H 15775 14400 50  0001 C CNN
F 1 "GND" H 15780 14477 39  0001 C CNN
F 2 "" H 15775 14650 50  0001 C CNN
F 3 "" H 15775 14650 50  0001 C CNN
	1    15775 14650
	1    0    0    -1  
$EndComp
Wire Wire Line
	15675 14650 15775 14650
Connection ~ 16575 13750
Wire Wire Line
	16575 13650 16600 13650
Wire Wire Line
	16575 13750 16575 13650
Wire Wire Line
	15200 13450 15200 13550
Wire Wire Line
	15200 13550 15275 13550
Wire Wire Line
	16575 13750 16575 14150
$Comp
L power:GND #PWR0106
U 1 1 67F91597
P 15275 14450
F 0 "#PWR0106" H 15275 14200 50  0001 C CNN
F 1 "GND" H 15280 14277 39  0001 C CNN
F 2 "" H 15275 14450 50  0001 C CNN
F 3 "" H 15275 14450 50  0001 C CNN
	1    15275 14450
	0    1    1    0   
$EndComp
Wire Wire Line
	16275 13750 16575 13750
Wire Wire Line
	16275 14150 16575 14150
Wire Wire Line
	16600 13250 16575 13250
$Comp
L power:+5V #PWR089
U 1 1 627B00F1
P 15875 13250
F 0 "#PWR089" H 15875 13100 50  0001 C CNN
F 1 "+5V" H 15875 13400 39  0000 C CNN
F 2 "" H 15875 13250 50  0001 C CNN
F 3 "" H 15875 13250 50  0001 C CNN
	1    15875 13250
	1    0    0    -1  
$EndComp
Wire Wire Line
	16275 13850 16500 13850
Wire Wire Line
	16500 13850 16500 14050
Text Notes 15050 12700 0    39   ~ 0
0 - ACB\n1 - ABC\n
Text Label 7875 1900 2    39   ~ 0
CLKCPU
Entry Wire Line
	7875 1900 7975 2000
Wire Wire Line
	7875 1900 7650 1900
Entry Wire Line
	6700 1800 6800 1900
Text Label 6800 1900 0    39   ~ 0
~CLKCPU
Wire Wire Line
	6800 1900 7050 1900
$Comp
L 74xx:74HC04 U3
U 7 1 74A3E237
P 15725 1450
F 0 "U3" H 15950 1500 50  0000 L CNN
F 1 "74HCU04" H 15950 1400 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 15725 1450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 15725 1450 50  0001 C CNN
	7    15725 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 74A410EF
P 15725 1950
F 0 "#PWR016" H 15725 1700 50  0001 C CNN
F 1 "GND" H 15730 1777 39  0001 C CNN
F 2 "" H 15725 1950 50  0001 C CNN
F 3 "" H 15725 1950 50  0001 C CNN
	1    15725 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+5VA #PWR05
U 1 1 74A43EA9
P 15725 950
F 0 "#PWR05" H 15725 800 50  0001 C CNN
F 1 "+5VA" H 15725 1100 39  0000 C CNN
F 2 "" H 15725 950 50  0001 C CNN
F 3 "" H 15725 950 50  0001 C CNN
	1    15725 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C27
U 1 1 74B87CAF
P 19700 1900
F 0 "C27" H 19600 1825 39  0000 C CNN
F 1 "100n" H 19600 2000 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 19738 1750 50  0001 C CNN
F 3 "~" H 19700 1900 50  0001 C CNN
	1    19700 1900
	-1   0    0    1   
$EndComp
Connection ~ 19700 1750
Wire Wire Line
	19700 1750 19950 1750
Wire Wire Line
	19700 2050 19475 2050
Connection ~ 19475 2050
Wire Wire Line
	11225 1600 11475 1600
$Comp
L Device:R R6
U 1 1 5F1D65FC
P 11625 1600
F 0 "R6" V 11550 1550 39  0000 L CNN
F 1 "1k" V 11625 1550 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 11555 1600 50  0001 C CNN
F 3 "~" H 11625 1600 50  0001 C CNN
	1    11625 1600
	0    -1   1    0   
$EndComp
Connection ~ 12150 1600
$Comp
L power:GND #PWR014
U 1 1 75D71BBB
P 12150 1950
F 0 "#PWR014" H 12150 1700 50  0001 C CNN
F 1 "GND" H 12155 1777 39  0001 C CNN
F 2 "" H 12150 1950 50  0001 C CNN
F 3 "" H 12150 1950 50  0001 C CNN
	1    12150 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	12900 1150 12750 1150
Connection ~ 13350 1600
Wire Wire Line
	13350 1150 13350 1600
Wire Wire Line
	13200 1150 13350 1150
$Comp
L Device:D D2
U 1 1 5F1D6E77
P 12450 1150
F 0 "D2" H 12575 1200 39  0000 C CNN
F 1 "1N4148" H 12450 1267 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 12450 1150 50  0001 C CNN
F 3 "~" H 12450 1150 50  0001 C CNN
	1    12450 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	12300 1150 12150 1150
Wire Wire Line
	12600 1150 12750 1150
Wire Wire Line
	12150 1150 12150 1600
Connection ~ 12150 1150
Wire Wire Line
	12750 1150 12750 1000
Connection ~ 12750 1150
Connection ~ 12750 1600
Wire Wire Line
	12750 1000 12600 1000
Wire Wire Line
	12750 1600 12750 1150
Wire Wire Line
	12150 1000 12150 1150
Wire Wire Line
	12300 1000 12150 1000
$Comp
L Device:R R2
U 1 1 5F1D7EA3
P 13050 1150
F 0 "R2" V 12975 1100 39  0000 L CNN
F 1 "47k" V 13050 1100 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12980 1150 50  0001 C CNN
F 3 "~" H 13050 1150 50  0001 C CNN
	1    13050 1150
	0    -1   1    0   
$EndComp
$Comp
L Device:D D1
U 1 1 5F1D7B08
P 12450 1000
F 0 "D1" H 12325 950 39  0000 C CNN
F 1 "1N4148" H 12450 1117 39  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P2.54mm_Vertical_AnodeUp" H 12450 1000 50  0001 C CNN
F 3 "~" H 12450 1000 50  0001 C CNN
	1    12450 1000
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C22
U 1 1 5F08E530
P 11925 1600
F 0 "C22" V 12050 1650 39  0000 R CNN
F 1 "10u/16V" V 11800 1725 39  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 11963 1450 50  0001 C CNN
F 3 "~" H 11925 1600 50  0001 C CNN
	1    11925 1600
	0    1    -1   0   
$EndComp
$Comp
L 74xx:74HC04 U3
U 6 1 5EF45D70
P 13650 1600
F 0 "U3" H 13650 1893 39  0000 C CNN
F 1 "74HCU04" H 13650 1818 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 13650 1600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 13650 1600 50  0001 C CNN
	6    13650 1600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U3
U 5 1 5EF44461
P 13050 1600
F 0 "U3" H 13050 1893 39  0000 C CNN
F 1 "74HCU04" H 13050 1818 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 13050 1600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 13050 1600 50  0001 C CNN
	5    13050 1600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U3
U 4 1 5EF422D2
P 12450 1600
F 0 "U3" H 12450 1893 39  0000 C CNN
F 1 "74HCU04" H 12450 1818 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 12450 1600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 12450 1600 50  0001 C CNN
	4    12450 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	13950 1600 14250 1600
Wire Wire Line
	12150 1650 12150 1600
Wire Wire Line
	12150 1600 12075 1600
$Comp
L Device:R R10
U 1 1 5F1D5B47
P 12150 1800
F 0 "R10" V 12075 1750 39  0000 L CNN
F 1 "47k" V 12150 1750 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 12080 1800 50  0001 C CNN
F 3 "~" H 12150 1800 50  0001 C CNN
	1    12150 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	21600 11400 21600 11500
Connection ~ 21600 11500
$Comp
L Connector_Generic:Conn_01x02 J6
U 1 1 78F2607E
P 20700 5425
F 0 "J6" H 20780 5371 50  0000 L CNN
F 1 "Conn_01x02" H 20780 5326 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 20700 5425 50  0001 C CNN
F 3 "~" H 20700 5425 50  0001 C CNN
	1    20700 5425
	1    0    0    -1  
$EndComp
Wire Wire Line
	20500 5425 20500 5275
Wire Wire Line
	20500 5275 20325 5275
Connection ~ 20325 5275
Wire Wire Line
	20500 5525 20500 5675
Wire Wire Line
	20500 5675 20325 5675
$Comp
L Connector_Generic:Conn_01x02 J8
U 1 1 792F23A2
P 20700 6425
F 0 "J8" H 20780 6371 50  0000 L CNN
F 1 "Conn_01x02" H 20780 6326 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 20700 6425 50  0001 C CNN
F 3 "~" H 20700 6425 50  0001 C CNN
	1    20700 6425
	1    0    0    -1  
$EndComp
Wire Wire Line
	20325 6275 20500 6275
Wire Wire Line
	20500 6275 20500 6425
Connection ~ 20325 6275
Wire Wire Line
	20325 6675 20500 6675
Wire Wire Line
	20500 6675 20500 6525
Connection ~ 20325 6675
Text Notes 5525 6725 1    39   Italic 0
connect to VCC for DIP28
Wire Wire Line
	17675 5225 17775 5225
Connection ~ 17775 5225
Wire Wire Line
	17775 5225 17875 5225
$Comp
L Device:D D15
U 1 1 5E8642B6
P 17775 5375
F 0 "D15" V 17729 5454 39  0000 L CNN
F 1 "1N5820" V 17820 5454 39  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P5.08mm_Vertical_AnodeUp" H 17775 5375 50  0001 C CNN
F 3 "~" H 17775 5375 50  0001 C CNN
	1    17775 5375
	0    1    1    0   
$EndComp
Wire Wire Line
	18300 5200 18300 5225
Connection ~ 18300 5225
Wire Wire Line
	18300 5225 18550 5225
Wire Wire Line
	18550 5225 18550 5200
$Comp
L power:GND #PWR045
U 1 1 5F0AE54C
P 17875 4900
F 0 "#PWR045" H 17875 4650 50  0001 C CNN
F 1 "GND" H 17880 4727 39  0001 C CNN
F 2 "" H 17875 4900 50  0001 C CNN
F 3 "" H 17875 4900 50  0001 C CNN
	1    17875 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	18300 4900 18550 4900
Wire Wire Line
	18175 4900 18200 4900
Connection ~ 18300 4900
Wire Wire Line
	18550 5225 18700 5225
Connection ~ 18550 5225
Wire Wire Line
	18175 5225 18300 5225
Wire Wire Line
	17675 5025 18200 5025
Wire Wire Line
	18200 5025 18200 4900
Connection ~ 18200 4900
Wire Wire Line
	18200 4900 18300 4900
$Comp
L Device:R R18
U 1 1 5E9BD48A
P 18025 4900
F 0 "R18" V 17950 4850 39  0000 L CNN
F 1 "1.0k" V 18025 4850 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 17955 4900 50  0001 C CNN
F 3 "~" H 18025 4900 50  0001 C CNN
	1    18025 4900
	0    -1   1    0   
$EndComp
Wire Wire Line
	13775 8625 13200 8625
Text Label 13200 8625 0    39   ~ 0
FD_DISK0
$Comp
L Device:L L2
U 1 1 5E85C867
P 18025 5225
F 0 "L2" V 18100 5225 39  0000 C CNN
F 1 "L" V 17950 5225 50  0000 C CNN
F 2 "Inductor_THT:L_Radial_D8.7mm_P5.00mm_Fastron_07HCP" H 18025 5225 50  0001 C CNN
F 3 "~" H 18025 5225 50  0001 C CNN
	1    18025 5225
	0    -1   -1   0   
$EndComp
Text Label 11800 7100 2    39   ~ 0
VG_DRQ
$Comp
L Device:C C40
U 1 1 5E9BC7F4
P 18550 5050
F 0 "C40" H 18475 4975 39  0000 C CNN
F 1 "15n" H 18450 5150 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 18588 4900 50  0001 C CNN
F 3 "~" H 18550 5050 50  0001 C CNN
	1    18550 5050
	-1   0    0    1   
$EndComp
Text Notes 14675 15025 0    39   ~ 0
AY Serial:\nIO2 - RTS (out)\nIO3 - TX (out)\nIO6 - DTR (in)\nIO7 - RX (in)\n
$Comp
L power:+5V #PWR0103
U 1 1 5EBED0DD
P 6950 13275
F 0 "#PWR0103" H 6950 13125 50  0001 C CNN
F 1 "+5V" H 6950 13425 39  0000 C CNN
F 2 "" H 6950 13275 50  0001 C CNN
F 3 "" H 6950 13275 50  0001 C CNN
	1    6950 13275
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0113
U 1 1 5EBEECF4
P 6650 13850
F 0 "#PWR0113" H 6650 13700 50  0001 C CNN
F 1 "+5V" H 6650 14000 39  0000 C CNN
F 2 "" H 6650 13850 50  0001 C CNN
F 3 "" H 6650 13850 50  0001 C CNN
	1    6650 13850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0127
U 1 1 5EBEF322
P 6350 14250
F 0 "#PWR0127" H 6350 14100 50  0001 C CNN
F 1 "+5V" H 6350 14400 39  0000 C CNN
F 2 "" H 6350 14250 50  0001 C CNN
F 3 "" H 6350 14250 50  0001 C CNN
	1    6350 14250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0128
U 1 1 5EBEF8BD
P 6050 14650
F 0 "#PWR0128" H 6050 14500 50  0001 C CNN
F 1 "+5V" H 6050 14800 39  0000 C CNN
F 2 "" H 6050 14650 50  0001 C CNN
F 3 "" H 6050 14650 50  0001 C CNN
	1    6050 14650
	1    0    0    -1  
$EndComp
Wire Wire Line
	16575 12975 16575 13250
Wire Wire Line
	14400 12975 16575 12975
Wire Wire Line
	17000 14050 17175 14050
Wire Wire Line
	15025 13075 15025 13750
Connection ~ 17000 14050
Wire Wire Line
	15275 13450 15200 13450
Wire Wire Line
	14800 12700 15200 12700
Wire Wire Line
	15200 12700 15200 13450
Connection ~ 15200 13450
Text Label 14800 12875 0    39   ~ 0
AY_MONO
Entry Wire Line
	14700 12775 14800 12875
Wire Wire Line
	14800 12875 15125 12875
Wire Wire Line
	15125 12875 15125 13650
Wire Wire Line
	15125 13650 15275 13650
Wire Wire Line
	15125 14350 15275 14350
Connection ~ 17500 13650
Connection ~ 17675 13250
Wire Wire Line
	17675 13250 18075 13250
Wire Wire Line
	17350 13250 17350 14500
Wire Wire Line
	17300 13650 17300 14450
Wire Wire Line
	17350 14500 16350 14500
Connection ~ 17300 13650
Connection ~ 17350 13250
Wire Wire Line
	17350 13250 17675 13250
Wire Wire Line
	17300 13650 17500 13650
Connection ~ 17000 13650
Connection ~ 17175 13250
Wire Wire Line
	16500 14050 17000 14050
Connection ~ 17000 12850
Connection ~ 17175 12850
Wire Wire Line
	17000 12850 17175 12850
Wire Wire Line
	17175 12850 17325 12850
Wire Wire Line
	17000 13650 17300 13650
Wire Wire Line
	17175 13250 17350 13250
Wire Wire Line
	16350 14500 16350 14800
Wire Wire Line
	16350 14800 15125 14800
Wire Wire Line
	15125 14350 15125 14800
Wire Wire Line
	16500 14050 16275 14050
Connection ~ 16500 14050
Connection ~ 15775 14650
Wire Wire Line
	16275 14450 17300 14450
$Comp
L my:CD4053B U13
U 1 1 666CC360
P 15775 13950
F 0 "U13" H 15425 14600 50  0000 C CNN
F 1 "74HCT4053D" H 16150 14600 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 15925 13200 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd4052b.pdf" H 15755 14150 50  0001 C CNN
	1    15775 13950
	1    0    0    -1  
$EndComp
NoConn ~ 16275 14350
Text Label 825  9600 0    39   ~ 0
AY_MONO
Entry Wire Line
	725  9500 825  9600
Wire Wire Line
	825  9600 1450 9600
Wire Wire Line
	17850 14700 18125 14700
Wire Wire Line
	18275 14175 18375 14175
Wire Wire Line
	18675 14175 19175 14175
Wire Wire Line
	17500 13650 17900 13650
Wire Wire Line
	17900 13650 18375 13650
Connection ~ 17900 13650
Wire Wire Line
	17900 13750 17900 13650
Connection ~ 18075 14175
Wire Wire Line
	18075 14175 17900 14175
Wire Wire Line
	17900 14175 17900 14050
$Comp
L Device:R R65
U 1 1 5FAD403F
P 17900 13900
F 0 "R65" V 17975 13850 39  0000 L CNN
F 1 "4.7k" V 17900 13825 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 17830 13900 50  0001 C CNN
F 3 "~" H 17900 13900 50  0001 C CNN
	1    17900 13900
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C48
U 1 1 688C6C4A
P 18525 14175
F 0 "C48" V 18650 14225 39  0000 R CNN
F 1 "10u/16V" V 18400 14300 39  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 18563 14025 50  0001 C CNN
F 3 "~" H 18525 14175 50  0001 C CNN
	1    18525 14175
	0    -1   -1   0   
$EndComp
Wire Wire Line
	18300 15075 18275 15075
Wire Wire Line
	15275 13750 15025 13750
Wire Wire Line
	14975 13175 14975 14050
Wire Wire Line
	14975 14050 15275 14050
Wire Wire Line
	7225 9775 7425 9775
Wire Wire Line
	7725 9775 8025 9775
$Comp
L Device:R R39
U 1 1 5ED59939
P 7575 9775
F 0 "R39" V 7525 9550 39  0000 L CNN
F 1 "1k" V 7575 9725 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 9775 50  0001 C CNN
F 3 "~" H 7575 9775 50  0001 C CNN
	1    7575 9775
	0    -1   1    0   
$EndComp
Text Label 7225 9775 0    39   ~ 0
A12
Entry Wire Line
	7125 9675 7225 9775
Text Label 8025 9775 2    39   ~ 0
VA12
Wire Wire Line
	7225 9375 7425 9375
Wire Wire Line
	7225 9475 7425 9475
Wire Wire Line
	7225 9575 7425 9575
Wire Wire Line
	7225 9675 7425 9675
Wire Wire Line
	7725 9675 8025 9675
Wire Wire Line
	7725 9575 8025 9575
Wire Wire Line
	7725 9475 8025 9475
Wire Wire Line
	7725 9375 8025 9375
$Comp
L Device:R R38
U 1 1 5EC02305
P 7575 9675
F 0 "R38" V 7525 9450 39  0000 L CNN
F 1 "1k" V 7575 9625 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 9675 50  0001 C CNN
F 3 "~" H 7575 9675 50  0001 C CNN
	1    7575 9675
	0    -1   1    0   
$EndComp
$Comp
L Device:R R37
U 1 1 5EC022FF
P 7575 9575
F 0 "R37" V 7525 9350 39  0000 L CNN
F 1 "1k" V 7575 9525 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 9575 50  0001 C CNN
F 3 "~" H 7575 9575 50  0001 C CNN
	1    7575 9575
	0    -1   1    0   
$EndComp
$Comp
L Device:R R36
U 1 1 5EC022F9
P 7575 9475
F 0 "R36" V 7525 9250 39  0000 L CNN
F 1 "1k" V 7575 9425 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 9475 50  0001 C CNN
F 3 "~" H 7575 9475 50  0001 C CNN
	1    7575 9475
	0    -1   1    0   
$EndComp
$Comp
L Device:R R35
U 1 1 5EC022F3
P 7575 9375
F 0 "R35" V 7525 9150 39  0000 L CNN
F 1 "1k" V 7575 9325 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 9375 50  0001 C CNN
F 3 "~" H 7575 9375 50  0001 C CNN
	1    7575 9375
	0    -1   1    0   
$EndComp
Text Label 7225 9675 0    39   ~ 0
A11
Text Label 7225 9575 0    39   ~ 0
A10
Text Label 7225 9475 0    39   ~ 0
A9
Text Label 7225 9375 0    39   ~ 0
A8
Entry Wire Line
	7125 9575 7225 9675
Entry Wire Line
	7125 9475 7225 9575
Entry Wire Line
	7125 9375 7225 9475
Entry Wire Line
	7125 9275 7225 9375
Text Label 8025 9375 2    39   ~ 0
VA8
Text Label 8025 9475 2    39   ~ 0
VA9
Text Label 8025 9575 2    39   ~ 0
VA10
Text Label 8025 9675 2    39   ~ 0
VA11
Entry Wire Line
	8025 9275 8125 9375
Entry Wire Line
	8025 8575 8125 8675
Text Label 8025 8575 2    39   ~ 0
VA0
Entry Wire Line
	7125 8475 7225 8575
Text Label 7225 8575 0    39   ~ 0
A0
$Comp
L Device:R R27
U 1 1 5F192E53
P 7575 8575
F 0 "R27" V 7525 8350 39  0000 L CNN
F 1 "1k" V 7575 8525 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 8575 50  0001 C CNN
F 3 "~" H 7575 8575 50  0001 C CNN
	1    7575 8575
	0    -1   1    0   
$EndComp
Wire Wire Line
	7725 8575 8025 8575
Wire Wire Line
	7225 8575 7425 8575
Entry Wire Line
	8025 8675 8125 8775
Text Label 8025 8675 2    39   ~ 0
VA1
Entry Wire Line
	7125 8575 7225 8675
Text Label 7225 8675 0    39   ~ 0
A1
$Comp
L Device:R R28
U 1 1 5F0614A9
P 7575 8675
F 0 "R28" V 7525 8450 39  0000 L CNN
F 1 "1k" V 7575 8625 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 8675 50  0001 C CNN
F 3 "~" H 7575 8675 50  0001 C CNN
	1    7575 8675
	0    -1   1    0   
$EndComp
Wire Wire Line
	7725 8675 8025 8675
Wire Wire Line
	7225 8675 7425 8675
Wire Wire Line
	7225 8775 7425 8775
Wire Wire Line
	7225 8875 7425 8875
Wire Wire Line
	7225 8975 7425 8975
Wire Wire Line
	7225 9075 7425 9075
Wire Wire Line
	7225 9175 7425 9175
Wire Wire Line
	7225 9275 7425 9275
Wire Wire Line
	7725 9275 8025 9275
Wire Wire Line
	7725 9175 8025 9175
Wire Wire Line
	7725 9075 8025 9075
Wire Wire Line
	7725 8975 8025 8975
Wire Wire Line
	7725 8875 8025 8875
Wire Wire Line
	7725 8775 8025 8775
$Comp
L Device:R R34
U 1 1 62BF8D4E
P 7575 9275
F 0 "R34" V 7525 9050 39  0000 L CNN
F 1 "1k" V 7575 9225 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 9275 50  0001 C CNN
F 3 "~" H 7575 9275 50  0001 C CNN
	1    7575 9275
	0    -1   1    0   
$EndComp
$Comp
L Device:R R33
U 1 1 62BF8D54
P 7575 9175
F 0 "R33" V 7525 8950 39  0000 L CNN
F 1 "1k" V 7575 9125 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 9175 50  0001 C CNN
F 3 "~" H 7575 9175 50  0001 C CNN
	1    7575 9175
	0    -1   1    0   
$EndComp
$Comp
L Device:R R32
U 1 1 62BF8D5A
P 7575 9075
F 0 "R32" V 7525 8850 39  0000 L CNN
F 1 "1k" V 7575 9025 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 9075 50  0001 C CNN
F 3 "~" H 7575 9075 50  0001 C CNN
	1    7575 9075
	0    -1   1    0   
$EndComp
$Comp
L Device:R R31
U 1 1 62BF8D60
P 7575 8975
F 0 "R31" V 7525 8750 39  0000 L CNN
F 1 "1k" V 7575 8925 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 8975 50  0001 C CNN
F 3 "~" H 7575 8975 50  0001 C CNN
	1    7575 8975
	0    -1   1    0   
$EndComp
$Comp
L Device:R R30
U 1 1 62BF8D66
P 7575 8875
F 0 "R30" V 7525 8650 39  0000 L CNN
F 1 "1k" V 7575 8825 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 8875 50  0001 C CNN
F 3 "~" H 7575 8875 50  0001 C CNN
	1    7575 8875
	0    -1   1    0   
$EndComp
$Comp
L Device:R R29
U 1 1 62BF8D6C
P 7575 8775
F 0 "R29" V 7525 8550 39  0000 L CNN
F 1 "1k" V 7575 8725 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7505 8775 50  0001 C CNN
F 3 "~" H 7575 8775 50  0001 C CNN
	1    7575 8775
	0    -1   1    0   
$EndComp
Text Label 7225 9275 0    39   ~ 0
A7
Text Label 7225 9175 0    39   ~ 0
A6
Text Label 7225 9075 0    39   ~ 0
A5
Text Label 7225 8975 0    39   ~ 0
A4
Text Label 7225 8875 0    39   ~ 0
A3
Text Label 7225 8775 0    39   ~ 0
A2
Entry Wire Line
	7125 9175 7225 9275
Entry Wire Line
	7125 9075 7225 9175
Entry Wire Line
	7125 8975 7225 9075
Entry Wire Line
	7125 8875 7225 8975
Entry Wire Line
	7125 8775 7225 8875
Entry Wire Line
	7125 8675 7225 8775
Text Label 8025 8775 2    39   ~ 0
VA2
Text Label 8025 8875 2    39   ~ 0
VA3
Text Label 8025 8975 2    39   ~ 0
VA4
Text Label 8025 9075 2    39   ~ 0
VA5
Text Label 8025 9175 2    39   ~ 0
VA6
Text Label 8025 9275 2    39   ~ 0
VA7
Entry Wire Line
	8025 9175 8125 9275
Entry Wire Line
	8025 9075 8125 9175
Entry Wire Line
	8025 8975 8125 9075
Entry Wire Line
	8025 8875 8125 8975
Entry Wire Line
	8025 8775 8125 8875
Entry Wire Line
	8025 9775 8125 9875
Entry Wire Line
	8025 9675 8125 9775
Entry Wire Line
	8025 9575 8125 9675
Entry Wire Line
	8025 9475 8125 9575
Entry Wire Line
	8025 9375 8125 9475
$Comp
L 74xx:74HC245 U17
U 1 1 5F67DED5
P 10250 10975
F 0 "U17" H 10250 11956 50  0000 C CNN
F 1 "74HC245" H 10250 11865 50  0000 C CNN
F 2 "Package_SO:TSSOP-20_4.4x6.5mm_P0.65mm" H 10250 10975 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 10250 10975 50  0001 C CNN
	1    10250 10975
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC245 U16
U 1 1 5EF8E1DF
P 9075 10975
F 0 "U16" H 9075 11956 50  0000 C CNN
F 1 "74HC245" H 9075 11865 50  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 9075 10975 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 9075 10975 50  0001 C CNN
	1    9075 10975
	1    0    0    -1  
$EndComp
Wire Bus Line
	12125 13000 12125 15550
Wire Bus Line
	16125 12525 16125 12850
Wire Bus Line
	14350 825  14350 2200
Wire Bus Line
	11125 825  11125 2200
Wire Wire Line
	12975 6900 13525 6900
Wire Bus Line
	7975 825  7975 3900
Wire Bus Line
	14700 12525 14700 12850
Wire Bus Line
	19275 12525 19275 15575
Wire Bus Line
	9625 6000 9625 6450
Wire Bus Line
	6700 825  6700 3125
Wire Bus Line
	750  13250 750  15425
Wire Bus Line
	12775 12525 12775 15575
Wire Bus Line
	4100 13000 4100 15550
Wire Bus Line
	7775 13000 7775 15550
Wire Bus Line
	12875 12875 12875 13675
Wire Bus Line
	11800 6150 11800 6950
Wire Bus Line
	6625 7325 6625 9175
Wire Bus Line
	8125 4650 8125 6500
Wire Bus Line
	9525 5475 9525 8825
Wire Bus Line
	11900 5475 11900 8550
Wire Bus Line
	13100 5475 13100 8325
Wire Bus Line
	8350 825  8350 3125
Wire Bus Line
	10150 825  10150 2800
Wire Bus Line
	9050 825  9050 3125
Wire Bus Line
	4750 7325 4750 10000
Wire Bus Line
	5625 4650 5625 6675
Wire Bus Line
	8125 7325 8125 10025
Wire Bus Line
	3300 825  3300 3925
Wire Bus Line
	750  825  750  4175
Wire Bus Line
	7125 7325 7125 9825
Wire Bus Line
	725  4650 725  12450
Wire Bus Line
	22500 3100 22500 14825
Wire Bus Line
	21100 3100 21100 14775
Wire Bus Line
	4575 4650 4575 12450
$EndSCHEMATC
