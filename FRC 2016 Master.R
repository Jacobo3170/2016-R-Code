#Master code for FRC 2016 Scouting:
#Before running:
#1. Load function "to.numbers" into R environment
#2. Place all raw data csv files (from ss16 app) into "FRC 2016 All Raw Data" Folder

#(Windows example: "C:/Users/Jacobostein/Desktop/")
myDir = "/Users/Jacobostein/Desktop"

setwd(myDir)

dir.create("FRC 2016 Organized Teams")
dir.create("FRC 2016 Team Progression")

#If "myDir" is not your Desktop, change the following code to your respective location:

#(Windows example: 'C:/Users/Jacobostein/Desktop/2016 R Code...')
source('~/Desktop/2016 R Code/FRC 2016 Organize (Teams).R')

source('~/Desktop/2016 R Code/FRC 2016 Shots vs Defences.R')

source('~/Desktop/2016 R Code/FRC 2016 Master List Code.R')