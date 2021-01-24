library('tidyverse')
library('data.table')

# SC rotation A

path_SCrotoA <- '/Users/barilari/Desktop/GuessMeaning_final-data/reshape/gorilla/SC_rotation-A'

allfiles <- list.files(path_SCrotoA, pattern = ".csv")

source_SCrotA <- lapply(paste(path_SCrotoA, allfiles, sep ='/'), read.csv, sep ='\t') %>% 
  rbindlist() 

SCrotA <- source_SCrotA %>% 
  filter(Screen.Name == "Response") %>% 
  select(Participant.Public.ID, Response, word_code, stimulus, category, meaning, value) %>% 
  set_names(c("pseudoID", "response", "wordCode", "stimulus", "category", "meaning", "value")) %>% 
  add_column(group = "SC", rotation = "A", session = 'gorilla') %>% 
  relocate("pseudoID", 'group', 'rotation', 'session', "category", "wordCode", "stimulus", "meaning", "value", 'response')

head(SCrotA)

levels(SCrotA$pseudoID)

# 5f436ce58b19385b6c0880ac "19810729MRBR"
# 
# 5f3d21ecbbc7710380d2015d "19930322ATBA"
# 
# 5f44015cc9cc9f324a7d6b02 "19880218PTFR"

SCrotA$pseudoID <- as.character(SCrotA$pseudoID)

SCrotA$pseudoID[which(SCrotA$pseudoID == "5f3d21ecbbc7710380d2015d")] = "19930322ATBA"

SCrotA$pseudoID[which(SCrotA$pseudoID == "5f436ce58b19385b6c0880ac")] = "19810729MRBR"

SCrotA$pseudoID[which(SCrotA$pseudoID == "5f44015cc9cc9f324a7d6b02")] = "19880218PTFR"

unique(SCrotA$pseudoID)

# check nb of trilas per participant
trialCount_SCrotA <- SCrotA %>% 
  group_by(pseudoID, category) %>% 
  count() %>% 
  pivot_wider(names_from = category, values_from = n)

# SC rotation B

path_SCrotoB <- '/Users/barilari/Desktop/GuessMeaning_final-data/reshape/gorilla/SC_rotation-B'

allfiles <- list.files(path_SCrotoB, pattern = ".csv")

source_SCrotB <- lapply(paste(path_SCrotoB, allfiles, sep ='/'), read.csv, sep ='\t') %>% 
  rbindlist() 

SCrotB <- source_SCrotB %>% 
  filter(Screen.Name == "Response") %>% 
  select(Participant.Public.ID, Response, word_code, stimulus, category, meaning, value) %>% 
  set_names(c("pseudoID", "response", "wordCode", "stimulus", "category", "meaning", "value")) %>% 
  add_column(group = "SC", rotation = "B", session = 'gorilla') %>% 
  relocate("pseudoID", 'group', 'rotation', 'session', "category", "wordCode", "stimulus", "meaning", "value", 'response')

head(SCrotB)

levels(SCrotB$pseudoID)

SCrotB$pseudoID <- as.character(SCrotB$pseudoID)

unique(SCrotB$pseudoID)

# check nb of trilas per participant
trialCount_SCrotB <- SCrotB %>% 
  group_by(pseudoID, category) %>% 
  count() %>% 
  pivot_wider(names_from = category, values_from = n)

SCrotB <- SCrotB %>% 
  filter(!pseudoID %in% c('19921108GBCC', '19930322ATBA'))

# EB rotation A

path_EBrotoA <- '/Users/barilari/Desktop/GuessMeaning_final-data/reshape/gorilla/EB_rotation-A'

allfiles <- list.files(path_EBrotoA, pattern = ".csv")

source_EBrotA <- lapply(paste(path_EBrotoA, allfiles, sep ='/'), read.csv, sep ='\t') %>% 
  rbindlist() 

EBrotA <- source_EBrotA %>% 
  filter(Screen.Name == "Response") %>% 
  select(Participant.Public.ID, Response, word_code, stimulus, category, meaning, value) %>% 
  set_names(c("pseudoID", "response", "wordCode", "stimulus", "category", "meaning", "value")) %>% 
  add_column(group = "EB", rotation = "A", session = 'gorilla') %>% 
  relocate("pseudoID", 'group', 'rotation', 'session', "category", "wordCode", "stimulus", "meaning", "value", 'response')

head(EBrotA)

levels(EBrotA$pseudoID)

EBrotA$pseudoID <- as.character(EBrotA$pseudoID)

unique(EBrotA$pseudoID)

# check nb of trilas per participant
trialCount_EBrotA <- EBrotA %>% 
  group_by(pseudoID, category) %>% 
  count() %>% 
  pivot_wider(names_from = category, values_from = n)

# EB rotation A

path_EBrotoB <- '/Users/barilari/Desktop/GuessMeaning_final-data/reshape/gorilla/EB_rotation-B'

allfiles <- list.files(path_EBrotoB, pattern = ".csv")

source_EBrotB <- lapply(paste(path_EBrotoB, allfiles, sep ='/'), read.csv, sep ='\t') %>% 
  rbindlist() 

EBrotB <- source_EBrotB %>% 
  filter(Screen.Name == "Response") %>% 
  select(Participant.Public.ID, Response, word_code, stimulus, category, meaning, value) %>% 
  set_names(c("pseudoID", "response", "wordCode", "stimulus", "category", "meaning", "value")) %>% 
  add_column(group = "EB", rotation = "B", session = 'gorilla') %>% 
  relocate("pseudoID", 'group', 'rotation', 'session', "category", "wordCode", "stimulus", "meaning", "value", 'response')

head(EBrotB)

levels(EBrotB$pseudoID)

EBrotB$pseudoID <- as.character(EBrotB$pseudoID)

unique(EBrotB$pseudoID)

# check nb of trilas per participant
trialCount_EBrotB <- EBrotB %>% 
  group_by(pseudoID, category) %>% 
  count() %>% 
  pivot_wider(names_from = category, values_from = n)

EBrotB <- EBrotB %>%
  filter(pseudoID != "19911015RTFA")

EBrotB$pseudoID[which(EBrotB$pseudoID == "2nd19911015RTFA")] = "19911015RTFA"

EBrotB$pseudoID[which(EBrotB$pseudoID == "19820723cics")] = "19820723CICS"

EBrotB$pseudoID[which(EBrotB$pseudoID == "19690929dadi")] = "19690929DADI"

EBrotB$group[which(EBrotB$pseudoID == "19861221LIMZ")] = "SC"

unique(EBrotB$pseudoID)

# check nb of trilas per participant
trialCount_EBrotB <- EBrotB %>% 
  group_by(pseudoID, category) %>% 
  count() %>% 
  pivot_wider(names_from = category, values_from = n)

raw_allGorilla <- bind_rows(SCrotA, SCrotB, EBrotA, EBrotB)

trialCount_raw_allGorilla <- raw_allGorilla %>% 
  group_by(pseudoID, group, rotation, category) %>% 
  count() %>% 
  pivot_wider(names_from = category, values_from = n)

write.table(raw_allGorilla, 
            '/Users/barilari/Desktop/GuessMeaning_final-data/raw/raw_allGorilla.tsv',
            sep = '\t',
            row.names=FALSE)
