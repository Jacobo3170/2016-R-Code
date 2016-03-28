setwd(myDir)
getwd()

dirList = list.dirs("FRC 2016 Organized Teams", recursive = FALSE, full.names = FALSE)
DLLength = length(dirList)

for(dirNum in 1:DLLength){
  currentDir = paste(dirList[dirNum], "/", sep = "")
  
  teamNumber = dirList[dirNum]
  
  setwd(myDir)
  setwd("FRC 2016 Organized Teams/")
  
  fileList = list.files(currentDir)
  FLLength = length(fileList)
  
  
  setwd(currentDir)
  getwd()
  
  progressionFile = as.data.frame("", stringsAsFactors=F)
  
  for(otherInt in 1:20){
    progressionFile[1, otherInt] = 0
  }
  
  colnames(progressionFile)[1] = "Match"
  colnames(progressionFile)[2] = "AUTO Def. Reached"
  colnames(progressionFile)[3] = "AUTO Def. Crossed"
  colnames(progressionFile)[4] = "AUTO LG" 
  colnames(progressionFile)[5] = "AUTO HG" 
  colnames(progressionFile)[6] = "Low Goals"
  colnames(progressionFile)[7] = "High Goals"
  colnames(progressionFile)[8] = "Portcullis"
  colnames(progressionFile)[9] = "Cheval De Frise"
  colnames(progressionFile)[10] = "Moat"
  colnames(progressionFile)[11] = "Ramparts"
  colnames(progressionFile)[12] = "Drawbridge"
  colnames(progressionFile)[13] = "Sally Port"
  colnames(progressionFile)[14] = "Rock Wall"
  colnames(progressionFile)[15] = "Rough Terrain"
  colnames(progressionFile)[16] = "Low Bar"
  colnames(progressionFile)[17] = "Robots Blocked"
  colnames(progressionFile)[18] = "Shots Blocked"
  colnames(progressionFile)[19] = "Challenged"
  colnames(progressionFile)[20] = "Scaled"
  
  
  
  for(fileNum in 1:FLLength){
    
    
    setwd(myDir)
    setwd("FRC 2016 All Raw Data/")
    
    rawCSV = read.csv(fileList[fileNum], sep = ",", fill = TRUE, stringsAsFactors = FALSE, header = FALSE, fileEncoding = "macroman", quote = "")
    
    
    
    progressionFile[fileNum, 1] = to.numbers(rawCSV[3, 2])
    progressionFile[fileNum, 2] = gsub("\\s", "", rawCSV[5, 2])
    progressionFile[fileNum, 3] = gsub("\\s", "", rawCSV[6, 2])
    progressionFile[fileNum, 4] = gsub("\\s", "", rawCSV[7, 2])
    progressionFile[fileNum, 5] = gsub("\\s", "", rawCSV[8, 2])
    progressionFile[fileNum, 6] = to.numbers(rawCSV[10, 2])
    progressionFile[fileNum, 7] = to.numbers(rawCSV[11, 2])
    progressionFile[fileNum, 8] = to.numbers(rawCSV[12, 2])
    progressionFile[fileNum, 9] = to.numbers(rawCSV[13, 2])
    progressionFile[fileNum, 10] = to.numbers(rawCSV[14, 2])
    progressionFile[fileNum, 11] = to.numbers(rawCSV[15, 2])
    progressionFile[fileNum, 12] = to.numbers(rawCSV[16, 2])
    progressionFile[fileNum, 13] = to.numbers(rawCSV[17, 2])
    progressionFile[fileNum, 14] = to.numbers(rawCSV[18, 2])
    progressionFile[fileNum, 15] = to.numbers(rawCSV[19, 2])
    progressionFile[fileNum, 16] = to.numbers(rawCSV[20, 2])
    progressionFile[fileNum, 17] = to.numbers(rawCSV[21, 2])
    progressionFile[fileNum, 18] = to.numbers(rawCSV[22, 2])
    progressionFile[fileNum, 19] = gsub("\\s", "", rawCSV[23, 2])
    progressionFile[fileNum, 20] = gsub("\\s", "", rawCSV[24, 2])
    
  }
  
  setwd(myDir)
  setwd("FRC 2016 Team Progression/")
  write.table(progressionFile, file = paste(teamNumber, ".csv", sep = ""), row.names = FALSE, sep = ",", quote = FALSE)
}
