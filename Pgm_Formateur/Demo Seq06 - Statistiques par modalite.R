
# Demo 06 - Statistiques par modalité

chemin <- "U:/2_Formation R Prise en main rapide de donnees/Malette/"
# chemin <- "U:/FormationR/"
# chemin <- "D:"

popleg <- readRDS(file=paste0(chemin,"RData/pop_legale.rds"))
ra2010 <-  readRDS(file=paste0(chemin,"RData/ra2010lib.rds"))

#install.packages("dplyr")
library(dplyr)

popleg %>% group_by(REGION) %>% count()
popleg %>% group_by(REGION) %>% summarise(pop15 = sum(PMUN15,na.rm=T) ) 
popleg %>% mutate(DEP=substr(DC,1,2)) %>% filter (REGION %in% c("82","83")) %>% 
                     group_by(REGION,DEP) %>% summarise(pop15 = sum(PMUN15,na.rm=T) ) 

popleg %>% group_by(REGION) %>% filter(max(PMUN15,na.rm=T) == PMUN15) %>% select (REGION,NCC,PMUN15) %>% arrange(REGION)
popleg %>% group_by(REGION) %>% mutate(maxpop15 = max(PMUN15,na.rm=T) )  %>% 
                filter(maxpop15 == PMUN15)  %>% arrange(REGION)
popleg %>% arrange (REGION,desc(PMUN15)) %>% group_by(REGION) %>% filter(row_number() == 1)

res1 <- popleg %>% mutate(DEP=substr(DC,1,2)) %>% 
            group_by(REGION,DEP) %>% summarise(popdep = sum(PMUN15,na.rm=T))
res1 %>% filter(popdep == max(popdep))
res1 %>% ungroup() %>% filter(popdep == max(popdep))



