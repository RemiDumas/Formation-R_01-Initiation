
# Séquence 06 - Statistiques par modalité

# Exercice 7

chemin <- "U:/Mes documents/Kit formation R/"
setwd(chemin)

ra2010 <- readRDS(file="RData/ra2010lib.rds")


#install.packages("dplyr")
library(dplyr)

ra2010 %>% group_by(dep) %>% count()  
ra2010 %>% group_by(dep) %>% summarise(popdep = sum(pop,na.rm=T) ) 
ra2010 %>% group_by(dep,academie) %>% summarise(popdep = sum(pop,na.rm=T),
                                                pophomdep = sum(pophom,na.rm=T)) 
ra2010 %>% group_by (dep) %>%  filter (max(pop,na.rm=T)==pop) %>% select (libgeo, pop,depcom) %>%  arrange (pop)
ra2010 %>% select (dep, depcom,libgeo,pop) %>%  
  arrange(dep,desc(pop)) %>%
  group_by(dep) %>% 
  top_n(3)


  



