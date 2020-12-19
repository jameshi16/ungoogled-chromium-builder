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
$GIT_SUBMODULE_UPDATE_INIT

./debian/scripts/setup debian

$GIT_AM /tmp/scripts/0001-fix-unicode.patch

$YES | $MK_BUILD_DEPS -i debian/control
$RM ungoogled-chromium-build-deps_*.deb

./debian/scripts/setup local-src
