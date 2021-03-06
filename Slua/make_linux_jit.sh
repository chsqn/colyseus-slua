#!/usr/bin/env bash

# if Centos 6.x: need glibc-devel.i686
# see more on http://stackoverflow.com/questions/7412548/error-gnu-stubs-32-h-no-such-file-or-directory-while-compiling-nachos-source check development lib

cd "$( dirname "${BASH_SOURCE[0]}" )"
cp slua.c luasocket/* luajit/src/

echo "Building Slua-Linux-32...."
cd luajit
make clean
make CC="gcc -m32" BUILDMODE=dynamic
cp src/libluajit.so ../../Assets/Plugins/Slua/x86/slua.so


echo "Building SLua-Linux-64....."
make clean
make CC="gcc" BUILDMODE=dynamic
cp src/libluajit.so ../../Assets/Plugins/Slua/x64/slua.so
echo "Build Slua Linux success!"
