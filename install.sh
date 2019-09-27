#!/bin/bash

#This file creates the folder structure for the
#minimal Car Rental App

echo "starting the installation"
echo "Enter the path where you want to install. Press ENTER"
read path

# moving to the desired location
cd $path
echo "moving to" $path
echo $pwd

#check for correct change directory
if [ $path != $pwd ];
then
	echo "Error creating the folder structure"
	exit
fi

#Create App folder
mkdir RentalCarApp
cd RentalCarApp

#create folder for database and scripts
mkdir DataBase
mkdir Scripts

echo "structure created successfully"
