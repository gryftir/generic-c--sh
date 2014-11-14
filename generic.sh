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
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
cp ${SCRIPT_DIR}/Makefile Makefile
cp ${SCRIPT_DIR}/GENERIC.c $1.c
cp ${SCRIPT_DIR}/GENERIC-lib.c $1-lib.c
cp ${SCRIPT_DIR}/GENERIC-lib.h $1-lib.h
cp ${SCRIPT_DIR}/.ycm_extra_conf.py .ycm_extra_conf.py
cp ${SCRIPT_DIR}/.gitignore .gitignore
sed -i "s/GENERIC/$1/g" Makefile
sed -i "s/GENERIC-lib/$1-lib/g" $1-lib.c
sed -i "s/GENERIC-lib/$1-lib/g" $1-lib.h
sed -i "s/GENERIC/$1/g" $1.c
echo "created folder $1"
echo "current directory: `pwd`"













