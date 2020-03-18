
# Demo 07 - Combiner plusieurs tables

chemin <- "F:/Kit formation R/"
# chemin <- "U:/FormationR/"
# chemin <- "D:"

gars <- readRDS(file=paste0(chemin,"RData/garcons.rds"))
filles <- readRDS(file=paste0(chemin,"RData/filles.rds"))
ra2010 <- readRDS(file=paste0(chemin,"RData/ra2010lib.rds"))

#install.packages("dplyr")
library(dplyr)

# empilement de lignes
gars %>% bind_rows(filles)

# empilement de colonnes
ra2010 <-  readRDS(file=paste0(chemin,"RData/ra2010lib.rds"))

hom <- ra2010 %>% group_by(dep) %>% summarise(homdep = sum(pophom,na.rm=T))
fem <- ra2010 %>% group_by(dep) %>% summarise(femdep = sum(popfem,na.rm=T)) 
hom %>% bind_cols(fem)

fem <- ra2010 %>% group_by(dep) %>% summarise(femdep = sum(popfem,na.rm=T)) %>%  arrange(femdep)
hom %>% bind_cols(fem)

fem <- ra2010 %>% group_by(dep) %>% summarise(femdep = sum(popfem,na.rm=T)) %>%  filter (femdep >200000)
hom %>% bind_cols(fem)

# Fusion de tables
fem <- ra2010 %>% group_by(dep) %>% summarise(femdep = sum(popfem,na.rm=T)) %>%  filter (femdep >200000) %>% 
  mutate(dep=ifelse(dep=="01","75",dep) ) %>% 
  mutate(dep=ifelse(dep=="73","74",dep) ) 

hom %>%  inner_join(fem)
hom %>%  inner_join(fem,by="dep")

fem <- fem %>% rename(d=dep)
hom %>%  inner_join(fem)
hom %>%  inner_join(fem,by=c("dep"="d"))

hom <- ra2010 %>% group_by(dep,categorie_com) %>% summarise(homtot = sum(pophom,na.rm=T))
fem <- ra2010 %>% group_by(dep,categorie_com) %>% summarise(femtot = sum(popfem,na.rm=T)) %>%
  rename(d=dep, cat=categorie_com )
hom %>%  inner_join(fem,by=c("dep"="d","categorie_com"="cat") )


# full_join left_join right_join
hom <- ra2010 %>% group_by(dep) %>% summarise(homdep = sum(pophom,na.rm=T))
fem <- ra2010 %>% group_by(dep) %>% summarise(femdep = sum(popfem,na.rm=T)) %>%  filter (femdep >200000) %>% 
  mutate(dep=ifelse(dep=="01","75",dep) ) %>% 
  mutate(dep=ifelse(dep=="73","74",dep) ) 

hom %>%  full_join(fem,by="dep")

hom %>%  left_join(fem,by="dep")
hom %>%  right_join(fem,by="dep")

hom %>% anti_join(fem,by="dep")
fem %>% anti_join(hom,by="dep")



