#!/bin/bash

DIR=$(pwd)
SUB_DIR="$(pwd)/sub"
MY_CHROOT=/mnt

FN_DIR=$(ls -a $MY_CHROOT | grep archlinux-utils)
if [ "$FN_DIR" = "archlinux-utils" ];
	then
		sudo mv $MY_CHROOT/arch* $MY_CHROOT/archlinux-utils.bak
		sudo chmod +x -R $DIR/*
		sudo mkdir -p $MY_CHROOT/archlinux-utils
		sudo cp -R $DIR/* $MY_CHROOT/archlinux-utils
		sudo cp -R $DIR/.* $MY_CHROOT/archlinux-utils
	else
		sudo chmod +x -R $DIR/*
		sudo mkdir -p $MY_CHROOT/archlinux-utils
		sudo cp -R $DIR/* $MY_CHROOT/archlinux-utils
		sudo cp -R $DIR/.* $MY_CHROOT/archlinux-utils
fi

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
		[Qq]*) sudo rm -rf $MY_CHROOT/archlinux-utils.bak
		clear
		exit
		;;
		*) error
		;;
	esac

$DIR/./start.sh
