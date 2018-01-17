# Installer
[Link](https://www.paulfurley.com/packaging-python-for-windows-pyinstaller-wine/) to doc

cmd :
```
apt-get install git -y && apt-get install wine -y && apt-get install wget -y
git clone https://github.com/paulfurley/python-windows-packager
cd ~/python-windows-packager
wget "http://www.python.org/ftp/python/2.7.3/python-2.7.3.msi"
wget "http://nchc.dl.sourceforge.net/project/pywin32/pywin32/Build%20218/pywin32-218.win32-py2.7.exe"
dpkg --add-architecture i386 && apt-get update && apt-get install wine32
build_environment/create.sh
export WINEPREFIX=/tmp/path-outputted-from-create
wine start python-2.7.3.msi
wine pywin32-218.win32-py2.7.exe
build_environment/freeze.sh
./package sample-application/src/main.py MySampleProgram
./package.sh /path/to/my/main.py MyProjectName
```
