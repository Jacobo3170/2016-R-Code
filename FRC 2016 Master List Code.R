setwd(myDir)
getwd()

dirList = list.dirs("FRC 2016 Organized Teams", recursive = FALSE, full.names = FALSE)
DLLength = length(dirList)

MasterList <- as.data.frame("", stringsAsFactors=F)

for(int in 1:27){
  MasterList[1, int] = 0
}

colnames(MasterList)[1] = "Teams"
colnames(MasterList)[2] = "Avr. AUTO HG "
colnames(MasterList)[3] = "Avr. AUTO LG "
colnames(MasterList)[4] = "AUTO Portcullis Xings"
colnames(MasterList)[5] = "AUTO Cheval De Frise Xings"
colnames(MasterList)[6] = "AUTO Moat Xings"
colnames(MasterList)[7] = "AUTO Ramparts Xings"
colnames(MasterList)[8] = "AUTO Drawbridge Xings"
colnames(MasterList)[9] = "AUTO Sally Port Xings"
colnames(MasterList)[10] = "AUTO Rock Wall Xings"
colnames(MasterList)[11] = "AUTO Rough Terrain Xings"
colnames(MasterList)[12] = "AUTO Low Bar Xings"
colnames(MasterList)[13] = "Avr. High Goals"
colnames(MasterList)[14] = "Avr. Low Goals "
colnames(MasterList)[15] = "Portcullis Xings"
colnames(MasterList)[16] = "Cheval De Frise Xings"
colnames(MasterList)[17] = "Moat Xings"
colnames(MasterList)[18] = "Ramparts Xings"
colnames(MasterList)[19] = "Drawbridge Xings"
colnames(MasterList)[20] = "Sally Port Xings"
colnames(MasterList)[21] = "Rock Wall Xings"
colnames(MasterList)[22] = "Rough Terrain Xings"
colnames(MasterList)[23] = "Low Bar Xings"
colnames(MasterList)[24] = "Robots Blocked"
colnames(MasterList)[25] = "Shots Blocked"
colnames(MasterList)[26] = "Challenges"
colnames(MasterList)[27] = "Scales"

for(dirNum in 1:DLLength){
  currentDir = paste(dirList[dirNum], "/", sep = "")
 
  setwd(myDir)
  setwd("FRC 2016 Organized Teams/")
  
  fileList = list.files(currentDir)
  FLLength = length(fileList)
  
  setwd(currentDir)
  getwd()
  
  teamNumber = to.numbers(gsub("\\s", "", dirList[dirNum]))
  autoAverageHG = 0
  autoAverageLG = 0
  autoPortcullis = 0
  autoChevalDeFrise = 0
  autoMoat = 0
  autoRamparts = 0
  autoDrawbridge = 0
  autoSallyPort = 0
  autoRockWall = 0
  autoRoughTerrain = 0
  autoLowBar = 0
  averageHG = 0
  averageLG = 0
  portcullis = 0
  chevalDeFrise = 0
  moat = 0
  ramparts = 0
  drawbridge = 0
  sallyPort = 0
  rockWall = 0
  roughTerrain = 0
  lowBar = 0
  robotsBlocked = 0
  shotsBlocked = 0
  challenges = 0
  scales = 0
  
  allAutoLG = 0
  allAutoHG = 0
  
  allLG = 0
  allHG = 0
  
  for(fileNum in 1:FLLength){
    currentFile = csvFile = read.csv(fileList[fileNum], sep = ",", stringsAsFactors = FALSE, header = FALSE, fill = TRUE, quote = "")  
    
    matchNumber = to.numbers(currentFile[3,2])
    
    autoLGRaw = gsub("\\s", "", currentFile[7,2])
    autoHGRaw = gsub("\\s", "", currentFile[8,2])
    
    autoCrossedDefRaw = gsub("\\s", "", currentFile[6,2])
    
    LG = (to.numbers(currentFile[10, 2])) 
    HG = (to.numbers(currentFile[11, 2])) 
    
    allLG = allLG + LG
    allHG = allHG + HG

    portcullisDef = (to.numbers(currentFile[12, 2]))
    chevalDeFriseDef = (to.numbers(currentFile[13, 2]))
    moatDef = (to.numbers(currentFile[14, 2]))
    rampartsDef = (to.numbers(currentFile[15, 2]))
    drawbridgeDef = (to.numbers(currentFile[16, 2]))
    sallyPortDef = (to.numbers(currentFile[17, 2]))
    rockWallDef = (to.numbers(currentFile[18, 2]))
    roughTerrainDef = (to.numbers(currentFile[19, 2]))
    lowBarDef = (to.numbers(currentFile[20, 2]))
    
    
    robotsBlockedDef = (to.numbers(currentFile[21, 2]))
    shotsBlockedDef = (to.numbers(currentFile[22, 2]))
    towerChallengesRaw = gsub("\\s" ,"", currentFile[23, 2])
    towerScalesRaw = gsub("\\s" ,"", currentFile[24, 2])

    if(is.na(robotsBlockedDef)){
      print("BREAK")
      
      cat(paste("Team number: ", teamNumber, "\n", "Match number: ", matchNumber, sep = ""))
      
      break
    }
    
    if(autoLGRaw == "Y"){
      allAutoLG = allAutoLG + 1
    }
    
    if(autoHGRaw == "Y"){
      allAutoHG = allAutoHG + 1
    }
    
    if(autoCrossedDefRaw == "Portcullis"){
      autoPortcullis = autoPortcullis + 1
    }else if(autoCrossedDefRaw == "ChevalDeFrise"){
      autoChevalDeFrise = autoChevalDeFrise + 1
    }else if(autoCrossedDefRaw == "Moat"){
      autoMoat = autoMoat + 1
    }else if(autoCrossedDefRaw == "Ramparts"){
      autoRamparts = autoRamparts + 1
    }else if(autoCrossedDefRaw == "Drawbridge"){
      autoDrawbridge = autoDrawbridge + 1
    }else if(autoCrossedDefRaw == "SallyPort"){
      autoSallyPort = autoSallyPort + 1
    }else if(autoCrossedDefRaw == "RockWall"){
      autoRockWall = autoRockWall + 1
    }else if(autoCrossedDefRaw == "RoughTerrain"){
      autoRoughTerrain = autoRoughTerrain + 1
    }else if(autoCrossedDefRaw == "LowBar"){
      autoLowBar = autoLowBar + 1
    }
    
    
    if(towerChallengesRaw == "Y"){
      towerChallenges = 1
    }else{
      towerChallenges = 0
    }
    
    if(towerScalesRaw == "Y"){
      towerScales = 1
    }else{
      towerScales = 0
    }
    
    portcullis = portcullis + portcullisDef
    chevalDeFrise = chevalDeFrise + chevalDeFriseDef
    moat = moat + moatDef
    ramparts = ramparts + rampartsDef
    drawbridge = drawbridge + drawbridgeDef
    sallyPort = sallyPort + sallyPortDef
    rockWall = rockWall + rockWallDef
    roughTerrain = roughTerrain + roughTerrainDef
    lowBar = lowBar + lowBarDef
    
    
      robotsBlocked = robotsBlocked + robotsBlockedDef
    
  
    
      shotsBlocked = shotsBlocked + shotsBlockedDef
    
    
    challenges = challenges + towerChallenges
    scales = scales + towerScales
    
  }    
  
  autoAverageLG = allAutoLG/FLLength
  autoAverageHG = allAutoHG/FLLength
  
  averageHG = allHG/FLLength
  averageLG = allLG/FLLength
  
  MasterList[dirNum, 1] = teamNumber
  MasterList[dirNum, 2] = autoAverageHG
  MasterList[dirNum, 3] = autoAverageLG
  MasterList[dirNum, 4] = autoPortcullis
  MasterList[dirNum, 5] = autoChevalDeFrise
  MasterList[dirNum, 6] = autoMoat
  MasterList[dirNum, 7] = autoRamparts
  MasterList[dirNum, 8] = autoDrawbridge
  MasterList[dirNum, 9] = autoSallyPort
  MasterList[dirNum, 10] = autoRockWall
  MasterList[dirNum, 11] = autoRoughTerrain
  MasterList[dirNum, 12] = autoLowBar
  MasterList[dirNum, 13] = averageHG
  MasterList[dirNum, 14] = averageLG
  MasterList[dirNum, 15] = portcullis
  MasterList[dirNum, 16] = chevalDeFrise
  MasterList[dirNum, 17] = moat
  MasterList[dirNum, 18] = ramparts
  MasterList[dirNum, 19] = drawbridge
  MasterList[dirNum, 20] = sallyPort
  MasterList[dirNum, 21] = rockWall
  MasterList[dirNum, 22] = roughTerrain
  MasterList[dirNum, 23] = lowBar
  MasterList[dirNum, 24] = robotsBlocked
  MasterList[dirNum, 25] = shotsBlocked
  MasterList[dirNum, 26] = challenges
  MasterList[dirNum, 27] = scales
  
  
}  

setwd(myDir)

write.table(MasterList, file = "FRC_2016_MasterList.csv", row.names = FALSE, sep = ",", quote = FALSE)

