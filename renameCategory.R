# rename categories

print(levels(allData$category))

# category 1: size       >> 1
# category 3: brightness >> 2
# category 4: loudness   >> 3
# category 6: velocity   >> 4
# category 7: movement   >> 5
# category 8: space      >> 6
# category 9: distance   >> 7

allData$cat_temp <- rep(0 , nrow(allData)) 

# category 1: size       >> 1
allData$cat_temp[which(allData$category == 1)] = 1
# category 3: brightness >> 2
allData$cat_temp[which(allData$category == 3)] = 2
# category 4: loudness   >> 3
allData$cat_temp[which(allData$category == 4)] = 3
# category 6: velocity   >> 4
allData$cat_temp[which(allData$category == 6)] = 4
# category 7: movement   >> 5
allData$cat_temp[which(allData$category == 7)] = 5
# category 8: space      >> 6
allData$cat_temp[which(allData$category == 8)] = 6
# category 9: distance   >> 7
allData$cat_temp[which(allData$category == 9)] = 7

print(unique(allData$cat_temp))

allData$category <- allData$cat_temp

allData <- allData[-12]

write.csv(allData, 
          "allData.csv",
          row.names = F)
