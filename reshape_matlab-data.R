library('tidyverse')
library('data.table')

path_source <- '/Volumes/GoogleDrive/.shortcut-targets-by-id/1IN8WlMOMmKzHIuD1QgPCA_Go9KpiWozm/Guess_Meaning_Experiment(Roberto,Marco,Christian)/data/reshape/matlab_reshape'

allfiles <- list.files(path_source, pattern = ".tsv")

source_matlab <- lapply(paste(path_source, allfiles, sep ='/'), read.table, sep ='\t', header = T) %>% 
  rbindlist() 

raw_allMatlab <- source_matlab %>% 
  select(-expID) %>% 
  set_names('pseudoID', 'subjNb', 'group', 'expTrialNb', 'category', 'buttonOrder', 'categoryTrialNb', 'wordCode', 'stimulus', 'meaning', 'value', 'response') %>% 
  add_column(session = 'matlab') %>% 
  relocate('pseudoID', 'subjNb', 'group', 'session', 'expTrialNb', 'category', 'buttonOrder', 'categoryTrialNb', 'wordCode', 'stimulus', 'meaning', 'value', 'response')

head(raw_allMatlab)

raw_allMatlab$pseudoID <- as.character(raw_allMatlab$pseudoID)

unique(raw_allMatlab$pseudoID)

raw_allMatlab$pseudoID[which(raw_allMatlab$pseudoID == '19780909____')] = '19780909ANMN'
raw_allMatlab$pseudoID[which(raw_allMatlab$pseudoID == '19920215____')] = '19920215AGMC'
raw_allMatlab$pseudoID[which(raw_allMatlab$pseudoID == '19900126____')] = '19900126MRTV'
raw_allMatlab$pseudoID[which(raw_allMatlab$pseudoID == '19891130____')] = '19891130ARMR'
raw_allMatlab$pseudoID[which(raw_allMatlab$pseudoID == '19661130____')] = '19661130POST'
raw_allMatlab$pseudoID[which(raw_allMatlab$pseudoID == '19810809____')] = '19810809SLCS'
raw_allMatlab$pseudoID[which(raw_allMatlab$pseudoID == '19930320____')] = '19930320GOSC'
raw_allMatlab$pseudoID[which(raw_allMatlab$pseudoID == '19920717____')] = '19920717LOMN'
raw_allMatlab$pseudoID[which(raw_allMatlab$pseudoID == '19851030____')] = '19851030GBGL'
raw_allMatlab$pseudoID[which(raw_allMatlab$pseudoID == '2911987LCMR')] = '19870129LCMR'

# discard unmatched subjects

# 19780909ANMN
# 19890803ABBN
# 19920215AGMC
# 19930320GOSC

raw_allMatlab <- raw_allMatlab %>%
  filter(!pseudoID  %in% c("19780909ANMN",
                           "19890803ABBN",
                           "19920215AGMC",
                           "19930320GOSC")) 

# check nb of trilas per participant
trialCount_raw_allMatlab <- raw_allMatlab %>% 
  group_by(pseudoID, group, category) %>% 
  count() %>% 
  pivot_wider(names_from = category, values_from = n)

print(trialCount_raw_allMatlab, n = Inf)

write.table(raw_allMatlab, 
            '/Volumes/GoogleDrive/.shortcut-targets-by-id/1IN8WlMOMmKzHIuD1QgPCA_Go9KpiWozm/Guess_Meaning_Experiment(Roberto,Marco,Christian)/data/raw/raw_allMatlab.tsv',
            sep = '\t',
            row.names=FALSE)
