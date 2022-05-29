# 17 JUN 2020 - 00 28
# Be sure to change the name of the program here
FILE_NAME=
CPPFLAGS=-arch x86_64 -m64
PATH=/usr/local/bin:/opt/local/bin:/usr/bin:./
INCLUDE=-I/usr/local/include/c++/10.1.0/
XINCLUDE=-I/opt/X11/include
XLIBS=-L/opt/X11/lib/ -lX11
DEBUG=-g -DDEBUG
OPT=-O3
CXX=/opt/local/bin/g++-10.1.0
CC=/opt/local/bin/gcc-10.1.0

BIN_DIR=./
LIB_DIR=./
LST_DIR=./

video2	:
	ffmpeg -framerate 2 -i track%04d.png -c:v copy track-2fps.mkv

video15	:
	ffmpeg -framerate 15 -i track%04d.png -c:v copy track-15fps.mkv

video30	:
	ffmpeg -framerate 30 -i track%04d.png -c:v copy track-30fps.mkv

videomp4:
	ffmpeg -framerate 15 -i track%04d.png -vcodec mpeg4 track-wicked-lo-res.mp4
