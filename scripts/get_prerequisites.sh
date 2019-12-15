#!/bin/bash
# Gets the pre-requisites required for this build

source /tmp/scripts/variables.sh

$APT_GET
$APT_INSTALL git equivs python3 packaging-dev wget

# LLVM
$WGET -O - https://apt.llvm.org/llvm-snapshot.gpg.key | $APT_KEY -
$APT_GET
$APT_INSTALL clang-8 llvm-8
