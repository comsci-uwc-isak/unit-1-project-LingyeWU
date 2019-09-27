#!/bin/bash
#This program installs the application under a default path
#to the user's desktop for Windows user

echo "starting the installation"
echo "This app will be installed on Disc C"

# moving to the desired location
cd ~/Desktop
echo "moving to" ~/Desktop
echo $PWD

#Create App folder
mkdir RentalCarApp
cd RentalCarApp

#create folder for database and scripts
mkdir DataBase
mkdir Scripts

echo "structure created successfully"
