allData<-read.csv("allData.csv", header = TRUE)

library(dplyr)

languages <- unique(allData$language)

languageTable <- allData %>% 
  group_by(language) %>% 
  count() 

languageTable$proportion <- languageTable$n/sum(languageTable$n)

languageTable$percent <- round(languageTable$proportion*100)

# install.packages("lessR")
library(lessR)


# Categorical data
cat_var <- factor(c(rep("Group 1", 10),
                    rep("Group 2", 15),
                    rep("Group 3", 30),
                    rep("Group 4", 20)))

# Store the variable as data frame
cat <- data.frame(cat_var)

install.packages("Hmisc")
library(Hmisc)

allData$language <- capitalize(allData$language)

languageTable$language <- capitalize(languageTable$language)

allData$language <- as.factor(allData$language)

# Pie
cols <-  hcl.colors(length(levels(allData$language)), "Fall")
PieChart(language, data = allData, 
         hole = 0.5,
         fill = cols,
         color="white",
         labels_cex = 1,
         values_size = 1,
         main = '',
         clockwise = F,
         pdf = 'pie.pdf')

languageTable <- languageTable[order("proportion"),]


pie(languageTable$proportion,
    labels = paste(languageTable$language, sep = " ", languageTable$percent, "%"),
    col = hcl.colors(length(levels(allData$language)), "Fall"), 
    main = "")


