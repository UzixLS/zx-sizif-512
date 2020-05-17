 ## Sizif-512

Another CPLD-based ZX Spectrum clone for 48K rubber case with additional features.
**Please note: work in progress, not all things implemented at the moment**

### Features
* Half-sized PCB for 48K rubber case, no case modifications necessary
* Pentagon 128 and Spectrum 128 timings
* Real Z80 in 3.5MHz and 7MHz (no-wait turbo) mode
* 512K RAM
* Kempston Joystick
* Integrated Beta Disk Interface
* Integrated DivMMC
* PAL and RGB video out (Sega Mini-DIN/9 connector)
* Digital video out (EGA header ;))
* Switchable stereo ABC/ACB
* Mono covox

### Magic button
Sizif have some configurable things which you may change at any moment and that's doesn't require reboot.
To do this there is a Magic button: just hold it and press key on keyboard:
Key | Function
- | -
1 | Switch to Pentagon 128 timings (by default)
2 | Switch to Spectrum 128 timings
3 | Switch to 3.5 MHz (normal) mode (by default)
4 | Switch to 7 MHz (turbo) mode
5 | Switch to ABC stereo (by default)
6 | Switch to ACB stereo
9 | Enable all additional features: DivMMC, 512K RAM, Kempston, Covox (by default)
0 | Disable all additional features
If you press Magic button and didn't change something, standard NMI handler 'll be called on button release.

### RAM
The board contains 512K RAM. There are two cases how to access it:
1. DivMMC enabled (SD card insert) - 128K available via 7FFDh port, 128K via DFFDh and 256K reserved for DivMMC.
2. No SD card present - 128K available via 7FFDh and 384K via DFFDh

### DivMMC and BDI coexistence
DivMMC can't be property used with BDI by it's design. So when SD card insert, BDI goes into inactive state.

### Strange lines on border and creaky sounds on SD card access
It's not a bug, it's a feature ;)

### Changelog & current status
* Rev.A - first release. Done. Please see [errata](pcb/rev.A/ERRATA.ru.txt) (in russian)
* Rev.B - abandoned. Files keep for historical reason.
* Rev.C - BDI has been removed. Work in progress.

### Acknowledgments
This work is based on a lot of other projects and would hardly have been successful without them.
* Harlequin (no link?)
* Karabas-128 ([link](https://github.com/andykarpov/karabas-128))
* zx_ula verilog implementation ([link](https://opencores.org/projects/zx_ula))
* Робик АЛУ ([link](https://zx-pk.ru/threads/19862-robik-alu-modul-rasshireniya.html))
* fbas_encoder ([link](https://opencores.org/projects/fbas_encoder))
