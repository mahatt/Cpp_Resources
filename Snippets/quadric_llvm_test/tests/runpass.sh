
#! /bin/bash 
src=$1
CLANG=clang
#OPT=/mnt/c/UbuntuWork/Projects/repo/llvm/build/bin/opt 
OPT=opt  
clang -c -emit-llvm -S $src -o $src.ll
$OPT -S -enable-new-pm=0 -load=../LoopMetadataPass.so  -Qloop $src.ll  -o $src.final.ll  