# PyInstaller
*PyInstaller* requires the `ldd` terminal application to discover the shared libraries required by each program or shared library. It is typically found in the distribution-package `glibc` or `libc-bin`.

It also requires the `objdump` terminal application to extract information from object files and the `objcopy` terminal application to append data to the bootloader. These are typically found in the distribution-package `binutils`.
```
apt-get install [glibc / libc-bin]
apt-get install binutils
```
The easiest way to install *PyInstaller* is by using `pip`
```
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
```
Now that you have `pip` use the following command to install pyinstaller
```
pip install pyinstaller
```
For upgrade use :
```
pip install --upgrade pyinstaller
```
