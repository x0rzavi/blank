#!/usr/bin/env bash

# Exit mechanism
trap "exit" INT
set -e

# Author: https://github.com/x0rzavi
# Description: Build xanmod kernel on gentoo
# Dependencies: 7z, lz4

package_setup () {
    emerge sys-kernel/xanmod-sources --noreplace
    eselect kernel set 1
    ls -l /usr/src/linux
    echo -e "\nKernel Package Setup Completed Successfully\n"
}

kernel_prepare () {
    cd /usr/src/linux
    make -j$(nproc) mrproper
    #cp CONFIGS/xanmod/gcc/config .config
    wget -O .config https://raw.githubusercontent.com/x0rzavi/gentoo-bits/main/config-5.16.14-gentoo-x0rzavi
    make -j$(nproc) olddefconfig
    echo -e "\nKernel Preparation Completed Successfully\n"
}

kernel_build () {
    make -j$(nproc) nconfig
    time make -j$(nproc)
    echo -e "\nKernel Build Completed Successfully\n"
}

package_setup
kernel_prepare
kernel_build