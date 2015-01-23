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
test_exists "${1}.c"
test_exists "${1}.h"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
cp ${SCRIPT_DIR}/Makefile Makefile
cp ${SCRIPT_DIR}/GENERIC.c "${1}.c"
cp ${SCRIPT_DIR}/GENERIC-lib.c "${1}-lib.c"
cp ${SCRIPT_DIR}/GENERIC-lib.h "${1}-lib.h"
cp ${SCRIPT_DIR}/GENERIC_LICENSE LICENSE
cp ${SCRIPT_DIR}/.ycm_extra_conf.py .ycm_extra_conf.py
cp ${SCRIPT_DIR}/.gitignore .gitignore
mkdir test
cp ${SCRIPT_DIR}/test.c "test/${1}-test.c"
sed -i "s/GENERIC/$1/g" Makefile "$1-lib.c" "$1-lib.h" "$1.c" "test/${1}-test.c"
sed -i "s/YEAR/`date +%Y`/" LICENSE
echo "created folder $1"
echo "current directory: `pwd`"

