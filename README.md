## Sizif-512
Another CPLD-based ZX Spectrum clone for 48K rubber case with some sweet features.
[![photo](https://cloud.err200.net/index.php/s/73TR85tYZkMm8Ax/download?path=/&files=sizif-512-c.small.jpg)](https://cloud.err200.net/index.php/apps/files_sharing/publicpreview/73TR85tYZkMm8Ax?fileId=50629&file=/sizif-512-c.png&x=-1&y=-1)

### Features
* Half-sized PCB for 48K rubber case, no case modifications necessary
* Pentagon 128 and Spectrum 128 timings
* Real Z80 in 3.5MHz and 7MHz (no-wait turbo) mode
* 512K RAM
* Real AY with switchable stereo ABC/ACB/mono
* Kempston Joystick
* Integrated DivMMC
* PAL and RGB video out (Sega Mini-DIN/9 connector)
* Digital video out (with EGA header ;))
* ULAplus
* Mono covox (Pentagon standart)
* SounDrive (4-channel stereo covox)
* WiFi

### Demonstration
Running Pentagon 128 and Spectrum 128 demos: [link](https://www.youtube.com/watch?v=_RoLKcfJSTY)  
Playing music from SD: [link](https://www.youtube.com/watch?v=TmikKD3yqOU)  
Some photos: [link](https://cloud.err200.net/index.php/s/73TR85tYZkMm8Ax?path=%2Fsizif-512)


### Magic button
Sizif have some configurable things which you may change at any moment and that's doesn't require reboot.
To do this there is a Magic button: just hold it and press key on keyboard:
| Key | Function |
| - | - |
| 1 | Switch to Pentagon 128 timings (by default) |
| 2 | Switch to Spectrum 128 timings |
| 3 | Switch to 3.5 MHz (normal) mode (by default) |
| 4 | Switch to 7 MHz (turbo) mode |
| 5 | Switch to ABC stereo (by default) |
| 6 | Switch to ACB stereo |
| 9 | Enable all additional features: DivMMC, 512K RAM, Kempston, Covox (by default) |
| 0 | Disable all additional features |

If you press Magic button and didn't change something, standard NMI handler 'll be called on button release.

### RAM
The board contains 512K RAM. There are two cases how to access it:
1. DivMMC enabled (SD card insert) - 128K available via 7FFDh port, 128K via DFFDh and 256K reserved for DivMMC.
2. No SD card present - 128K available via 7FFDh and 384K via DFFDh

### Strange lines on border and creaky sounds on SD card access
It's not a bug, it's a feature ;)

### WiFi module
It's possible to connect to internet with additional [WiFi module](https://github.com/UzixLS/zx-sizif-512-wifi).

### Changelog & current status
* Rev.A - first release. Please see [errata](pcb/rev.A/ERRATA.ru.txt) (in russian).
* Rev.B - abandoned. Files keep for historical reason.
* Rev.C - BDI has been removed; improved video circuit; more capable CPLD; better power circuit; add mono AY mode. [Errata](pcb/rev.C/ERRATA.txt).
* Rev.C1 - fixed incorrect JTAG pinout; fixed incorrect silkscreen for power connector J3, tuned some circuit values. Everything seems to work. [Errata](pcb/rev.C1/ERRATA.txt).

### Roadmap
PCB rev.D (not soon):
* add zxbus connector for in-case addons
* add support for +3DOS floppy controller
* improve tapein circuit to handle super-turbo loaders
* improve video circuit for ulaplus (?)

Firmware:
* add optional Magic-button's OSD menu
* add support for MegaDrive 6-button gamepad
* add ability to map kempston to any keyboard button
* add ROM banks switching menu
* add +3 ports
* add 48K timings
* improve 128K timings for 100% compatibility

### Acknowledgments
This work is based on a lot of other projects and would hardly have been successful without them.
* Harlequin (no official link?)
* Karabas-128 ([link](https://github.com/andykarpov/karabas-128))
* ZX Evolution ([link](http://nedopc.com/zxevo/zxevo.php))
* zx_ula verilog implementation ([link](https://opencores.org/projects/zx_ula))
* Робик АЛУ ([link](https://zx-pk.ru/threads/19862-robik-alu-modul-rasshireniya.html))
* fbas_encoder ([link](https://opencores.org/projects/fbas_encoder))
