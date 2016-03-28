setwd(myDir)
getwd()

dirList = list.dirs("FRC 2016 Organized Teams", recursive = FALSE, full.names = FALSE)
DLLength = length(dirList)

ShotsVDefences <- as.data.frame("", stringsAsFactors=F)
ShotsVDefences[1, 1] = 0
ShotsVDefences[1,2] = 0
ShotsVDefences[1,3] = 0

colnames(ShotsVDefences)[1] = "Teams"
colnames(ShotsVDefences)[2] = "Defences"
colnames(ShotsVDefences)[3] = "Shots"

for(dirNum in 1:DLLength){
  currentDir = paste(dirList[dirNum], "/", sep = "")

  
  setwd(myDir)
  setwd("FRC 2016 Organized Teams/")
  
  fileList = list.files(currentDir)
  FLLength = length(fileList)
  
  setwd(currentDir)
  getwd()
  
  defVarCounter = 0
  defTruthTable = c(0, 0, 0, 0, 0, 0, 0, 0, 0)
  
  allPoints = 0
  
  for(fileNum in 1:FLLength){
    currentFile = csvFile = read.csv(fileList[fileNum], sep = ",", stringsAsFactors = FALSE, header = FALSE, fill = TRUE, quote = "")
    
    print(to.numbers(currentFile[10,2]))
    
    LGPoints = (to.numbers(currentFile[10, 2])) * 2
    HGPoints = (to.numbers(currentFile[11, 2])) * 5
    totalPoints = LGPoints + HGPoints
    
    allPoints = allPoints + totalPoints
    
    for(truthNum in 12:20){
      defence = to.numbers(gsub("\"|\\s|/" ,"", currentFile[truthNum, 2]))
      if(defence > 0){
        defTruthTable[(truthNum - 11)] = 1
      }
    }
  }
  
  averagePoints = allPoints/FLLength
  
  for(num in 1:9){
    if(defTruthTable[num] == 1){
      defVarCounter = defVarCounter + 1
    }
  }
 
  ShotsVDefences[(dirNum), 1] = dirList[dirNum]
  ShotsVDefences[(dirNum), 2] = defVarCounter
  ShotsVDefences[(dirNum), 3] = averagePoints
}

setwd(myDir)

write.table(ShotsVDefences, file = "Shots vs Defences.csv", row.names = FALSE, sep = ",", quote = FALSE)

library(calibrate)
attach(ShotsVDefences)
plot(Defences, Shots,  main = "Defensive capabilities vs Average Shooting pts per match", xlab = "Defenses", ylab = "Shots")
textxy(Defences, Shots, labs = Teams, offset = -0.7)

