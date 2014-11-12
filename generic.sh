#!/bin/bash
test_exists() {
    if [ -e $1 ]; then
        echo "$1 $2 already exists"
        exit 1
    fi
    return 0
}
test_exists $1 "folder"
mkdir $1
cd $1
test_exists $1.c
test_exists $1.h
cp /home/lawrence/workspace/c/generic/Makefile Makefile
cp /home/lawrence/workspace/c/generic/GENERIC.c $1.c
cp /home/lawrence/workspace/c/generic/GENERIC-lib.c $1-lib.c
cp /home/lawrence/workspace/c/generic/GENERIC-lib.h $1-lib.h
cp /home/lawrence/workspace/c/generic/.ycm_extra_conf.py .ycm_extra_conf.py
cp /home/lawrence/workspace/c/generic/.gitignore .gitignore
sed -i "s/GENERIC/$1/g" Makefile
sed -i "s/GENERIC-lib/$1-lib/g" $1-lib.c
sed -i "s/GENERIC-lib/$1-lib/g" $1-lib.h
sed -i "s/GENERIC/$1/g" $1.c
echo "created folder $1"













