# anonymize data

#         EB                     SC
# 
# EB01 	19720829RNGA  |	 SC01  19661130POST
# EB02  19870513RNGA  |  SC02  19901209MRLC
# EB03  19870129LCMR  |  SC03  19851030GBGL
# EB04  19860126GOAR  |  SC04  19900126MRTV
# EB05  19890429RSPO  |	 SC05  19921118GOFT
# EB06  19900609ANDL  |	 SC06  19920717LOMN
# EB07  19790108PTCC  |	 SC07  19810809SLCS
# EB08  19910714AGLO  |	 SC08  19891130ARMR
# EB09  19890126ARPS  |	 SC09  19940921BRFL
# EB10  19640823GUBG  |	 SC10  19670526ILPN
# EB11  19811112MRLM  |	 SC11  19830606MRZN
# EB12  19680710MDNC  |	 SC12  19730317NDGA
# EB13  19890517AGRG  |	 SC13  19930322ATBA
# EB14  19911015RTFA  |	 SC14  19880701PTCR
# EB15  19720428VLML  |	 SC15  19810729MRBR
# EB16  19891214ATBS  |	 SC16  19880218PTFR
# EB17  19960222ANGL  |	 SC17  19961014GOPA
# EB18  19920128SMBT  |	 SC18  19930318ANMS
# EB19  19820723CICS  |	 SC19  19861221LIMZ
# EB20  19861002MLCP  |	 SC20  19910811ARBL
# EB21  19690929DADI  |	 SC21  19670618TSNL
# EB22  19810605PTCN  |	 SC22  19850724IDCV
# EB23  19890321POCC  |	 SC23  19921108GBCC

allData$subID <- rep("sub", nrow(allData)) 

allData$pseudoid <- as.character(allData$pseudoid) 
 
# EB01 	19720829RNGA
allData$subID[which(allData$pseudoid == "19720829RNGA")] = "EB01"
# EB02  19870513RNGA  
allData$subID[which(allData$pseudoid == "19870513RNGA")] = "EB02"
# EB03  19870129LCMR
allData$subID[which(allData$pseudoid == "19870129LCMR")] = "EB03"
# EB04  19860126GOAR  
allData$subID[which(allData$pseudoid == "19860126GOAR")] = "EB04"
# EB05  19890429RSPO  
allData$subID[which(allData$pseudoid == "19890429RSPO")] = "EB05"
# EB06  19900609ANDL  
allData$subID[which(allData$pseudoid == "19900609ANDL")] = "EB06"
# EB07  19790108PTCC 
allData$subID[which(allData$pseudoid == "19790108PTCC")] = "EB07"
# EB08  19910714AGLO 
allData$subID[which(allData$pseudoid == "19910714AGLO")] = "EB08"
# EB09  19890126ARPS  
allData$subID[which(allData$pseudoid == "19890126ARPS")] = "EB09"
# EB10  19640823GUBG  
allData$subID[which(allData$pseudoid == "19640823GUBG")] = "EB10"
# EB11  19811112MRLM 
allData$subID[which(allData$pseudoid == "19811112MRLM")] = "EB11"
# EB12  19680710MDNC  
allData$subID[which(allData$pseudoid == "19680710MDNC")] = "EB12"
# EB13  19890517AGRG
allData$subID[which(allData$pseudoid == "19890517AGRG")] = "EB13"
# EB14  19911015RTFA  
allData$subID[which(allData$pseudoid == "19911015RTFA")] = "EB14"
# EB15  19720428VLML  
allData$subID[which(allData$pseudoid == "19720428VLML")] = "EB15"
# EB16  19891214ATBS  
allData$subID[which(allData$pseudoid == "19891214ATBS")] = "EB16"
# EB17  19960222ANGL  
allData$subID[which(allData$pseudoid == "19960222ANGL")] = "EB17"
# EB18  19920128SMBT  
allData$subID[which(allData$pseudoid == "19920128SMBT")] = "EB18"
# EB19  19820723CICS  
allData$subID[which(allData$pseudoid == "19820723CICS")] = "EB19"
# EB20  19861002MLCP  
allData$subID[which(allData$pseudoid == "19861002MLCP")] = "EB20"
# EB21  19690929DADI 
allData$subID[which(allData$pseudoid == "19690929DADI")] = "EB21"
# EB22  19810605PTCN 
allData$subID[which(allData$pseudoid == "19810605PTCN")] = "EB22"
# EB23  19890321POCC  
allData$subID[which(allData$pseudoid == "19890321POCC")] = "EB23"
 

# SC01  19661130POST
allData$subID[which(allData$pseudoid == "19661130POST")] = "SC01"
# SC02  19901209MRLC
allData$subID[which(allData$pseudoid == "19901209MRLC")] = "SC02"
# SC03  19851030GBGL
allData$subID[which(allData$pseudoid == "19851030GBGL")] = "SC03"
# SC04  19900126MRTV
allData$subID[which(allData$pseudoid == "19900126MRTV")] = "SC04"
# SC05  19921118GOFT
allData$subID[which(allData$pseudoid == "19921118GOFT")] = "SC05"
# SC06  19920717LOMN
allData$subID[which(allData$pseudoid == "19920717LOMN")] = "SC06"
# SC07  19810809SLCS
allData$subID[which(allData$pseudoid == "19810809SLCS")] = "SC07"
# SC08  19891130ARMR
allData$subID[which(allData$pseudoid == "19891130ARMR")] = "SC08"
# SC09  19940921BRFL
allData$subID[which(allData$pseudoid == "19940921BRFL")] = "SC09"
# SC10  19670526ILPN
allData$subID[which(allData$pseudoid == "19670526ILPN")] = "SC10"
# SC11  19830606MRZN
allData$subID[which(allData$pseudoid == "19830606MRZN")] = "SC11"
# SC12  19730317NDGA
allData$subID[which(allData$pseudoid == "19730317NDGA")] = "SC12"
# SC13  19930322ATBA
allData$subID[which(allData$pseudoid == "19930322ATBA")] = "SC13"
# SC14  19880701PTCR
allData$subID[which(allData$pseudoid == "19880701PTCR")] = "SC14"
# SC15  19810729MRBR
allData$subID[which(allData$pseudoid == "19810729MRBR")] = "SC15"
# SC16  19880218PTFR
allData$subID[which(allData$pseudoid == "19880218PTFR")] = "SC16"
# SC17  19961014GOPA
allData$subID[which(allData$pseudoid == "19961014GOPA")] = "SC17"
# SC18  19930318ANMS
allData$subID[which(allData$pseudoid == "19930318ANMS")] = "SC18"
# SC19  19861221LIMZ
allData$subID[which(allData$pseudoid == "19861221LIMZ")] = "SC19"
# SC20  19910811ARBL
allData$subID[which(allData$pseudoid == "19910811ARBL")] = "SC20"
# SC21  19670618TSNL
allData$subID[which(allData$pseudoid == "19670618TSNL")] = "SC21"
# SC22  19850724IDCV
allData$subID[which(allData$pseudoid == "19850724IDCV")] = "SC22"
# SC23  19921108GBCC
allData$subID[which(allData$pseudoid == "19921108GBCC")] = "SC23"
 
subj_table <- allData %>% 
        group_by(pseudoid, group, subID) %>% 
        count() %>% 
        pivot_wider(names_from = category, values_from = n) %>% 
        print(n = 46)
 
allData <- allData %>%
        select(-1) %>%
        relocate(subID)

head(allData)

write.csv(allData, 
          "allData.csv",
          row.names = F)


 





 
 
 
 
 
 




