#!/bin/bash
#This program is to remove the app under the default path on Windows system

#Send out a meesage
echo "Are you sure you want to uninstall RentalCarApp?(Enter Y or N)"
read answer

  if [ $answer = "Y" ];
  then
    cd ~/Desktop
    rm -R RentalCarApp
    echo "Thank you for using RentalCarApp"
  elif [[ $answer = "N" ]];
  then
    echo "Exiting"
    Exit
  else
    Exit
  fi
