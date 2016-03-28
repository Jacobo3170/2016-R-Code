setwd(myDir)
getwd()

fileList = list.files("FRC 2016 All Raw Data/")
FLLength = length(fileList)



for(fileNum in 1:FLLength){
  setwd(myDir)
  setwd("FRC 2016 All Raw Data/")
  
  csvFile = read.csv(fileList[fileNum], sep = ",", fill = TRUE, stringsAsFactors = FALSE, header = FALSE, fileEncoding = "macroman", quote = "")
  
  #gsub( ) removes spaces added to values in the read csv file
  teamNumber = gsub("\\s" ,"", csvFile[1,2])
  matchNumber = gsub("\\s" ,"", csvFile[3,2])
  
  setwd(myDir)
  setwd("FRC 2016 Organized Teams/")
  
  dir.create(teamNumber)
  setwd(teamNumber)
  
  fileName = paste(teamNumber, "_", matchNumber, ".csv", sep = "")
  
  print(csvFile)
  
  write.table(csvFile, file = fileName, row.names = FALSE, col.names = FALSE, sep = ",", quote = FALSE)
  
}
