## Sizif-512
Another CPLD-based ZX Spectrum clone for 48K rubber case with some sweet features.
[![photo](https://cloud.err200.net/index.php/s/73TR85tYZkMm8Ax/download?path=/&files=sizif-512-d.small.jpg)](https://cloud.err200.net/index.php/apps/files_sharing/publicpreview/73TR85tYZkMm8Ax?fileId=50629&file=/sizif-512-d.png&x=-1&y=-1)

### Tech specs
* Half-sized PCB for 48K rubber case, case modifications isn't necessary
* Pentagon, Spectrum 128K and Spectrum 48K timings
* Altera EPM1270 CPLD
* Real Z80 in 3.5MHz, 7MHz (no-wait turbo) and 14MHz (turbo with wait-states) modes
* Switchable 128K / +3e-divmmc ROM
* 512K RAM
* Real AY-8910 with switchable stereo ABC/ACB/mono output
* Sega 6-button joystick input; Kempston/Sinclair modes
* Integrated DivMMC, 1x microSD socket
* PAL and RGB video out (Sega Mini-DIN/9 connector)
* Digital video out for EGA monitors
* ULAplus
* Mono covox (Pentagon standard)
* SounDrive (4-channel stereo covox)
* WiFi
* Tape input via 3.5" jack and Bluetooth
* 9-12V power supply with any polarity
* Reset and Magic buttons and , header for power button

### Demonstration
Running Pentagon 128 and Spectrum 128 demos: [link](https://www.youtube.com/watch?v=_RoLKcfJSTY)  
Playing music from SD: [link](https://www.youtube.com/watch?v=TmikKD3yqOU)  
Some photos: [link](https://cloud.err200.net/index.php/s/73TR85tYZkMm8Ax?path=%2Fsizif-512)

### Magic button
Sizif have some configurable things which you may change at any moment and that's doesn't require reboot.
To do this there is a Magic button: just hold it and press key on keyboard:
| Key | Function |
| - | - |
| 1 | Switch to Pentagon timings (by default) |
| 2 | Switch to Spectrum 128K timings |
| 3 | Switch to Spectrum 48K timings |
| 4 | Switch to 3.5 MHz (normal) mode (by default) |
| 5 | Switch to 7 MHz (turbo) mode |
| 6 | Switch to 14 MHz (turbo) mode |
| 7 | Switch to ABC stereo (by default) |
| 8 | Switch to ACB stereo |
| 9 | Switch to mono |
| Q | Use default 48K BASIC |
| W | Use alternative 48K BASIC (OpenSE) |
| E | Use default 128K ROM |
| R | Use +3e-divmmc ROM |
| U | Use joystick in kempston mode (default) |
| I | Use joystick in sinclair mode |
| O | Enable all additional features: DivMMC, 512K RAM, Kempston, Covox (by default) |
| P | Disable all additional features |
| Space | Jump to #0 address (useful for ROM switching) |

If you press Magic button and didn't change something, standard NMI handler 'll be called on button release.

### Sega gamepad buttons
Sega gamepad support will be available starting from PCB rev.D (or Rev.C with slight modifications).
| Button | Function in Kempston mode | Function in Sinclair mode |
| - | - | - |
| Up | Up | 9 |
| Down | Down | 8 |
| Left | Left | 6 |
| Right | Right | 7 |
| A | Button 3 | N |
| B | Button 1 | 0 |
| C | Button 2 | M |
| X | Turbo Button 3 | Turbo N |
| Y | Turbo Button 1 | Turbo 0 |
| Z | Turbo Button 2 | Turbo M |
| Start | Pause | Pause |
| Mode | Magic/NMI | Magic/NMI |

### RAM
Sizif contains 512K RAM. There are two cases how to access it:
1. DivMMC enabled (SD card insert) - 128K available via 7FFDh port, 128K via DFFDh (Profi standart, most compatible with old 128K software) and 128K reserved for DivMMC.
2. No SD card present - 128K available via 7FFDh and 384K via DFFDh. Please note: ULAplus and Magic button shares one page of memory with DFFD port. If you run 512K-software, it's good idea not to use ULAplus and Magic.

### Strange lines on border and creaky sounds on SD card access
It's not a bug, it's a feature ;)

### WiFi module
It's possible to connect to internet with additional [WiFi module](https://github.com/UzixLS/zx-sizif-512-wifi).

### Tested addons
* AYX-32 - OK
* BDI-ZX ver 2.0 MVcomp - OK (if SD card isn't insert)
* ZX Dandanator! Mini 2.1 - OK (if SD card isn't insert)
* ZX TSid - OK
* Multiface 128 1.00 by Steve Smith - OK (if SD card isn't insert)
* Noname +3DOS floppy controller - OK (since rev.D)

### Changelog & current status
* Rev.A - first release. Please note the [errata](pcb/rev.A/ERRATA.ru.txt) (in russian).
* Rev.B - abandoned. Files kept for historical reason.
* Rev.C - BDI has been removed; improved video circuit; more capable CPLD; better power circuit; add mono AY mode. [Errata](pcb/rev.C/ERRATA.txt).
* Rev.C1 - fixed incorrect JTAG pinout; fixed incorrect silkscreen for power connector J3, tuned some circuit values. Everything seems to work. [Errata](pcb/rev.C1/ERRATA.txt).
* Rev.D:
    * added zxbus connector for in-case addons
    * added support for +3DOS floppy controller
    * added support for Sega 3/6-button gamepad
    * added PS/2 (TODO: check)
    * added Bluetooth tape input (via M18 module)
    * added alternative microSD card socket footprint
    * fixed compatibility with some keyboards
* Rev.D1: minor changes in pcb layout

### Roadmap
PCB:
* create in-case addon with General Sound, TurboSound FM, SAA1099, MIDI etc

Firmware:
* add OSD for Magic button
* improve 48K/128K timings for 100% compatibility
* implement PS/2

### Acknowledgments
This work is based on a lot of other projects and would hardly have been successful without them.
* Harlequin (no official link?)
* Karabas-128 ([link](https://github.com/andykarpov/karabas-128))
* ZX Evolution ([link](http://nedopc.com/zxevo/zxevo.php))
* zx_ula verilog implementation ([link](https://opencores.org/projects/zx_ula))
