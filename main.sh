#!/bin/bash

echo "Bash to Windows CMD ver. 0.1"
echo "This script will make all cmd (ms-dos) commands work properly on Linux command line interface. Perfect for people who is very new to Linux and just switched from Windows"
sleep 1s
echo "Please note that some commands like cd and rm are already built into bash and still have the same uses."
echo ' '

echo "Checking if wget is installed..."

if [ -e /usr/bin/wget ]; then
   echo "yes"
else
   echo "Warning: Wget is needed to download necessary additional components."
   sleep 1s
   read "Install wget? (yes/cancel/skip)" YN3
   if [ $YN3 = yes ]; then
      echo "Finding installed package manager... (I dont want to give you too much prompt)"
      echo "apt (Debian)... "
      if [ -e /usr/bin/apt ]; then
         echo "yes. Executing apt environment..."
         apt install wget -y
         sudo apt install wget -y
      else
         echo "no."
      fi
      echo "dnf (Fedora)..."
      if [ -e /usr/bin/dnf ]; then
         echo "yes. Executing dnf environment... "
         sudo dnf install wget -y
      else
         echo "no."
         echo "pacman (Arch)..."
         if [ -e /usr/bin/pacman ]; then
            echo "yes. Executing pacman environment... "
            echo "Making sure sudo is installed... (Just in case)"
            if [ -e /usr/local/bin/sudo ]; then
               echo "yes. Continuing installation..."
               sudo pacman -Syu wget
            else
               read "Looks like you forgot to install sudo! What now? (skip/exit)" YN4
               if [ $YN4 = "exit" ]; then
                  exit
               else
                  if [ $YN4 = skip ]; then
                     return
                  fi
               fi
            fi
         fi

         echo "Precaution: Once you execute this command, you need to reboot to revert this system to normal."

         read "Proceed? yes/no (Answer exactly as written in the bracket since this is case sensitive )" YN1

         if [ $YN2 = "yes" ]; then
            read "Which part of the system you want to change? 1: Command line  2: Desktop Environment (GUI)" YN2

            if [ $YN2 = "1" ]; then
               sh cli/clicmd.sh
            fi
         fi

      fi
   fi
fi
