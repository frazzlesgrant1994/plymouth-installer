#!/bin/bash
# plymouth Install
# Author: Frazer Grant
# Version: 1.0


## Check for root 
clear
if [[ $(/usr/bin/id -u) -eq 0 ]]; then
	echo ""
	echo ""
	echo "	You can't run this script with sudo or with root
    It will ask you to login when required."
	echo ""
	echo "	Setup will now close	"
	echo "	Press any key to continue"
	read -n 1 -s -r -p ""
	clear
	exit 1
fi

## Warning 
      clear 
  read -r -p "  This installer comes with NO warranties, I am NOT responsible if you break your linux install. 
  Would you like to continue with the installation  [Y/n] " response
  response=${response,,} # tolower
  if [[ $response =~ ^((yes|y| )) ]] || [[ -z $response ]]; then
	    clear 
  else 
      clear
    exit 1
  fi

   read -n 1 -s -r -p '   This script will create a copy of "mkinitcpio.conf: /etc/mkinitcpio_backup.conf" and "Grub: /etc/default/grub_backup" before any modifications take place
  ....Press any key to continue'
      clear

##### Creating a backup of grub and mkinitcpio config files.

  sudo cp /etc/mkinitcpio.conf /etc/mkinitcpio_backup.conf
  sudo cp /etc/default/grub /etc/default/grub_backup


## Makes the plymouth package
  git clone https://github.com/frazzlesgrant1994/plymouth.git
  cd plymouth
  makepkg -si 
  cd ..




## Adds plymouth hook  to mkinitcpio.conf
  sudo sed -i -e 's/HOOKS=(base udev autodetect keyboard keymap modconf block filesystems fsck)/HOOKS=(base udev autodetect keyboard keymap modconf block filesystems fsck plymouth)/g' /etc/mkinitcpio.conf




## Prepare for inition copy in/out
  sudo mkinitcpio -p linux

## Add plymout hook to grub
  sudo sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet splash plymouth"/g' /etc/default/grub

## Generate grub config
  sudo grub-mkconfig -o /boot/grub/grub.cfg

##### CONFIGURE PLYMOUTH


## Copy theme
  sudo tar -vxf sweet-arch.tar.gz -C /usr/share/plymouth/themes/


## Set theme
  sudo plymouth-set-default-theme -R sweet-arch

read -r -p "	Instalation compleate. Would you like to restart? [Y/n] " response
 response=${response,,} # tolower
 if [[ $response =~ ^((yes|y| )) ]] || [[ -z $response ]]; then
	reboot
 else 
 clear
   exit 1
 fi


