#!/bin/bash
# This downloads and verifies source packags

source /tmp/scripts/variables.sh

if [[ "$1" == "" ]]; then
	exit 1
fi

change_directory $ROOT_DIRECTORY/src
change_directory $ROOT_DIRECTORY

$GIT_CLONE https://github.com/ungoogled-software/ungoogled-chromium-debian.git
change_directory ungoogled-chromium-debian
$GIT_CHECKOUT $1
change_directory ..
$CP ungoogled-chromium-debian/debian $ROOT_DIRECTORY/src/
change_directory $ROOT_DIRECTORY/src

./debian/rules setup-debian

$YES | $MK_BUILD_DEPS -i debian/control
$RM ungoogled-chromium-build-deps_*.deb

$GIT_AM /tmp/scripts/0001-fix-unicode.patch
./debian/rules setup-local-src
