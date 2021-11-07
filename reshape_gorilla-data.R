library('tidyverse')
library('data.table')

## SC rotation A

# set te path to the task folder
path_SCrotA <- '/Users/barilari/Desktop/Gorilla/reshape/SC_rotation-A/task'

# read all the files 
allfiles <- list.files(path_SCrotA, pattern = ".csv")

source_SCrotA <- lapply(paste(path_SCrotA, allfiles, sep ='/'), read.csv, sep ='\t') %>% 
  rbindlist() 

# filter the relevant infomration and add new headers and relevant columns
SCrotA <- source_SCrotA %>% 
  filter(Screen.Name == "Response") %>% 
  select(Participant.Public.ID, Response, word_code, stimulus, category, meaning, value) %>% 
  set_names(c("pseudoID", "response", "wordCode", "stimulus", "category", "meaning", "value")) %>% 
  add_column(group = "SC", rotation = "A", session = 'gorilla') %>% 
  relocate("pseudoID", 'group', 'rotation', 'session', "category", "wordCode", "stimulus", "meaning", "value", 'response')

# check that the headers are ok
head(SCrotA)

# check particpants names 
levels(SCrotA$pseudoID)

# rename those who particpated via prolific and have strange names

# 5f436ce58b19385b6c0880ac "19810729MRBR"
# 5f3d21ecbbc7710380d2015d "19930322ATBA"
# 5f44015cc9cc9f324a7d6b02 "19880218PTFR"

SCrotA$pseudoID <- as.character(SCrotA$pseudoID)

SCrotA$pseudoID[which(SCrotA$pseudoID == "5f3d21ecbbc7710380d2015d")] = "19930322ATBA"

SCrotA$pseudoID[which(SCrotA$pseudoID == "5f436ce58b19385b6c0880ac")] = "19810729MRBR"

SCrotA$pseudoID[which(SCrotA$pseudoID == "5f44015cc9cc9f324a7d6b02")] = "19880218PTFR"

unique(SCrotA$pseudoID)

# discard unmatched subject

# 19880227DNTM unmatched

SCrotA <- SCrotA %>% 
  filter(!pseudoID %in% '19880227DNTM')

# check nb of trilas per participant
trialCount_SCrotA <- SCrotA %>% 
  group_by(pseudoID, category) %>% 
  count() %>% 
  pivot_wider(names_from = category, values_from = n)

trialCount_SCrotA

## SC rotation B

# set te path to the task folder
path_SCrotB <- '/Users/barilari/Desktop/Gorilla/reshape/SC_rotation-B/task'

# read all the files 
allfiles <- list.files(path_SCrotB, pattern = ".csv")

source_SCrotB <- lapply(paste(path_SCrotB, allfiles, sep ='/'), read.csv, sep ='\t') %>% 
  rbindlist() 

# filter the relevant infomration and add new headers and relevant columns
SCrotB <- source_SCrotB %>% 
  filter(Screen.Name == "Response") %>% 
  select(Participant.Public.ID, Response, word_code, stimulus, category, meaning, value) %>% 
  set_names(c("pseudoID", "response", "wordCode", "stimulus", "category", "meaning", "value")) %>% 
  add_column(group = "SC", rotation = "B", session = 'gorilla') %>% 
  relocate("pseudoID", 'group', 'rotation', 'session', "category", "wordCode", "stimulus", "meaning", "value", 'response')

# check that the headers are ok
head(SCrotB)

# check particpants names 
levels(SCrotB$pseudoID)

SCrotB$pseudoID <- as.character(SCrotB$pseudoID)

unique(SCrotB$pseudoID)

# discard unmatched subject

# 19921108GBCC started rotation B by error but then moved to A
# 19930322ATBA tested twice, the first time was with rotation A and we keep that one

SCrotB <- SCrotB %>% 
  filter(!pseudoID %in% c('19921108GBCC', 
                          '19930322ATBA'))

# check nb of trilas per participant
trialCount_SCrotB <- SCrotB %>% 
  group_by(pseudoID, category) %>% 
  count() %>% 
  pivot_wider(names_from = category, values_from = n)

trialCount_SCrotB

## EB rotation A

# set te path to the task folder
path_EBrotA <- '/Users/barilari/Desktop/Gorilla/reshape/EB_rotation-A/task'

# read all the files 
allfiles <- list.files(path_EBrotA, pattern = ".csv")

source_EBrotA <- lapply(paste(path_EBrotA, allfiles, sep ='/'), read.csv, sep ='\t') %>% 
  rbindlist() 

# filter the relevant infomration and add new headers and relevant columns
EBrotA <- source_EBrotA %>% 
  filter(Screen.Name == "Response") %>% 
  select(Participant.Public.ID, Response, word_code, stimulus, category, meaning, value) %>% 
  set_names(c("pseudoID", "response", "wordCode", "stimulus", "category", "meaning", "value")) %>% 
  add_column(group = "EB", rotation = "A", session = 'gorilla') %>% 
  relocate("pseudoID", 'group', 'rotation', 'session', "category", "wordCode", "stimulus", "meaning", "value", 'response')

# check that the headers are ok
head(EBrotA)

# check particpants names 
levels(EBrotA$pseudoID)

EBrotA$pseudoID <- as.character(EBrotA$pseudoID)

unique(EBrotA$pseudoID)

# check nb of trilas per participant
trialCount_EBrotA <- EBrotA %>% 
  group_by(pseudoID, category) %>% 
  count() %>% 
  pivot_wider(names_from = category, values_from = n)

trialCount_EBrotA

## EB rotation B

# set te path to the task folder
path_EBrotB <- '/Users/barilari/Desktop/Gorilla/reshape/EB_rotation-B/task'

# read all the files
allfiles <- list.files(path_EBrotB, pattern = ".csv")

source_EBrotB <- lapply(paste(path_EBrotB, allfiles, sep ='/'), read.csv, sep ='\t') %>% 
  rbindlist() 

# filter the relevant infomration and add new headers and relevant columns
EBrotB <- source_EBrotB %>% 
  filter(Screen.Name == "Response") %>% 
  select(Participant.Public.ID, Response, word_code, stimulus, category, meaning, value) %>% 
  set_names(c("pseudoID", "response", "wordCode", "stimulus", "category", "meaning", "value")) %>% 
  add_column(group = "EB", rotation = "B", session = 'gorilla') %>% 
  relocate("pseudoID", 'group', 'rotation', 'session', "category", "wordCode", "stimulus", "meaning", "value", 'response')

# check that the headers are ok
head(EBrotB)

# check particpants names
levels(EBrotB$pseudoID)

EBrotB$pseudoID <- as.character(EBrotB$pseudoID)

# discard subjects

# 19911015RTFA has done a false start, we keep the data under the name 2nd19911015RTFA

EBrotB <- EBrotB %>%
  filter(!pseudoID  %in% "19911015RTFA")

# unmatched participants
EBrotB <- EBrotB %>%
  filter(!pseudoID  %in% c("19700823EICS",
                       "19871012MIFR",
                       "19970409MRML")) 

# reanme 19911015RTFA
EBrotB$pseudoID[which(EBrotB$pseudoID == "2nd19911015RTFA")] = "19911015RTFA"

# rename those who put lower case character in the name 
EBrotB$pseudoID[which(EBrotB$pseudoID == "19820723cics")] = "19820723CICS"

EBrotB$pseudoID[which(EBrotB$pseudoID == "19690929dadi")] = "19690929DADI"

# Assign 19861221LIMZ to the correct group
EBrotB$group[which(EBrotB$pseudoID == "19861221LIMZ")] = "SC"

unique(EBrotB$pseudoID)

# check nb of trilas per participant
trialCount_EBrotB <- EBrotB %>% 
  group_by(pseudoID, category) %>% 
  count() %>% 
  pivot_wider(names_from = category, values_from = n)

trialCount_EBrotB

# put everything together and save the raw file
raw_allGorilla <- bind_rows(SCrotA, SCrotB, EBrotA, EBrotB)

# last check that all the particpiants are there and they have the same nb of trials per block
trialCount_raw_allGorilla <- raw_allGorilla %>% 
  group_by(pseudoID, group, rotation, category) %>% 
  count() %>% 
  pivot_wider(names_from = category, values_from = n)

print(trialCount_raw_allGorilla, n = Inf)

# save the raw file
write.table(raw_allGorilla, 
            '/Users/barilari/Desktop/Gorilla/raw/raw_allGorilla.tsv',
            sep = '\t',
            row.names=FALSE)
