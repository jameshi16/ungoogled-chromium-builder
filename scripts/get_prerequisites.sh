#!/bin/bash
# Gets the pre-requisites required for this build

source /tmp/scripts/variables.sh

$APT_GET
$APT_INSTALL git equivs python3 packaging-dev wget software-properties-common uuid-dev

# LLVM
# $WGET https://apt.llvm.org/llvm.sh
# $CHMOD +x llvm.sh
# ./llvm.sh 9
bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

# $APT_INSTALL ${CLANG_PACKAGES[$HIGHEST_INDEX]}
