#!/bin/bash
#This program installs the application under a default path
#to the user's desktop for Windows user
#also creates folder structure for CarRental App

echo "starting the installation"
echo "This app will be installed in desktop. Press enter."
read

# moving to the desired location
cd ~/Desktop
echo "moving to" ~/Desktop
echo $PWD

#Create App folder
mkdir RentalCarApp
cd RentalCarApp

#create folder for database and scripts
mkdir dB
mkdir scripts

echo "structure created successfully"
cp -r ~/desktop/Carapp/scripts/ ~/desktop/RentalCarApp/scripts/
