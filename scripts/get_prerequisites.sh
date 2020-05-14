#!/bin/bash
# Gets the pre-requisites required for this build

source /tmp/scripts/variables.sh

$APT_GET
$APT_INSTALL git equivs python3 packaging-dev wget software-properties-common

# LLVM (When ungoogled-chormium still used the latest version)
# $WGET https://apt.llvm.org/llvm.sh
# $CHMOD +x llvm.sh
# ./llvm.sh 9

# LLVM
CLANG_PACKAGES=($($APT_SEARCH clang | grep -oE "^clang-[0-9]+\s"))
HIGHEST_INDEX=0
for ((i=0;i<${#CLANG_PACKAGES[@]};i++));
do
	HIGHEST_VERSION=$(echo ${CLANG_PACKAGES[$HIGHEST_INDEX]} | grep -oE "[0-9]+")
	CURRENT_VERSION=$(echo ${CLANG_PACKAGES[$i]} | grep -oE "[0-9]+")
	if [[ "$CURRENT_VERSION" -ge "$HIGHEST_VERISON" ]]; then
		HIGHEST_INDEX=$i  
	fi
done

$APT_INSTALL ${CLANG_PACKAGES[$HIGHEST_INDEX]}
