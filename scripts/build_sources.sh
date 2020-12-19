#!/bin/bash
# Builds sources

source /tmp/scripts/variables.sh

change_directory $ROOT_DIRECTORY/ungoogled-chromium-debian

$DPKG_BUILDPACKAGE
