#!/bin/bash

DIR=$(pwd)
SUB_DIR="$(pwd)/sub"

mkdir -p /mnt/archlinux-utils
cp -R $DIR/* /mnt/archlinux-utils
cp -R $DIR/.* /mnt/archlinux-utils
chmod -x -R /mnt/archlinux-utils

clear

error () { clear

read -p "

Input yang anda masukkan salah !

" input
	case $input in
		*) return
		;;
	esac
}

echo "
################################################################################
##                   ARCH LINUX UTILITIES script by Reddof                    ##
################################################################################
##                                  MAIN MENU                                 ##
##                                                                            ##
##  1. Install Arch Linux ke UEFI System                                      ##
##  2. Package Management                                                     ##
##  3. Remove                                                                 ##
##  4. README                                                                 ##
##  q. Keluar                                                                 ##
##                                                                            ##
##                                                                            ##
################################################################################
"

read -p "

Silakan masukkan pilihan anda :

" mm
	case $mm in
		1) $SUB_DIR/./inst
		;;
		2) $SUB_DIR/./pac-man
		;;
		3) $SUB_DIR/./remove
		;;
		4) vim $DIR/README.md
		;;
		[Qq]*) clear
		exit
		;;
		*) error
		;;
	esac

$DIR/./start.sh
