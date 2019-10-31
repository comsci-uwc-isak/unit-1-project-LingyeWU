![CarRental](logo.png)

Car Rental Minimal App
===========================

A car rental management minimal app in Bash.

Contents
-----
  1. [Planning](#planning)
  1. [Design](#design)
  1. [Development](#development)
  1. [Evalution](#evaluation)

Planning
----------
**Defining the problem (Tpoic 1.1.1)** 

A computer program for purpose of recording information about their orders is needed by a car rental office. The company is specifically interested in building a program to collect basic information about the distance driven for each car. Stakeholders in this process include hardware, software, people working with it or using it and the immediate environment. In this case specially, the problem accompanies with client reqiurements including a simple terminal based program; a simple and transparent installation, etc. 

**Solution proposed**

In order to meet clients' expectation of an easy, terminal-based system that enables the company a sufficient and effective way of better recording the data of their orders, I chose BASH as the language to code the project. Considering that these data are transferred from a manual record to a local system, I added functionalities such as backup and summary to complete the project and better meet users' needs.

- Github
All scripts and documentation are stored in Github, making it easy to contribute to this open source projects, provide a clear documentation for the users, and showcase the project to our clients.

- BASH
BASH is the language I used to code the project. Advantages of using Bash is that it can run most sh scripts without modification. Like the other GNU projects, the bash initiative was started to preserve, protect and promote the freedom to use, study, copy, modify and redistribute software, which perfectly falls in our clients' expectation on the project.

**Success criteria**

Expected measureable outcomes by the client includes:
1. A car can be created and stored in the database
1. A car information can be edited
1. A car can be deleted from the database
1. The installation is ***simple-> one step process*
1. A summary (total/average distance traveled) can be generated for a particular car
1. Trips can be recorded and stored for an existing car
1. A simple, accessible database
1. A backup system is considered during the process of designing


Design
---------
### First sketch of the system
![Diagram](CarRental1.jpg)

**Fig.1** This is a first sketch of the system considering three factors: input, processing, and output.

### Test Plan


Development
--------
### Development of the function: Create a new car.
The following steps summarize the algorithm to create a new car in the system.
1. get inputs (Plate, Model, Color, Passenger number)
2. Check number of arguments. If 4 then continue, if not exit message.
3. Write it to the main file with on eextra line. Not erasing other entries.
4. Create car trip file with license plate.txt.

### Development of the function: Record a new car.
The following steps summarize the algorithm to record a new car in the system.
1. Check arguments (Plate, km, Dateout, Datein)
2. Check that the car exists 
```sh
if test[-f "$file"]; 
	then
```
3. If the car exists , then write the trip info in the $plate.txt file, without erasing previous trips.


Evaluation
-----------



