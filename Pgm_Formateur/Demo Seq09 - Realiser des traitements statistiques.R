
# Demo 09 - Réaliser des traitements statistiques

chemin <- "U:/2_Formation R Prise en main rapide de donnees/Malette/"
# chemin <- "U:/FormationR/"
# chemin <- "D:"


nais16 <- readRDS(file=paste0(chemin,"RData/naissances2016.rds"))
givors <- readRDS(file=paste0(chemin,"RData/givors.rds"))

#install.packages("dplyr")
library(dplyr)
library(skimr)
library(knitr)
library(tidyr)

iris <- iris
#Fonction skim
nais16 %>% skim
iris %>% skim
iris %>% skim %>% kable

iris %>% skim(Sepal.Length)
iris %>% group_by(Species) %>% skim(Sepal.Length)

iris %>% skim(Species)

iris %>% group_by(Species)%>% skim(Sepal.Length) %>% 
         as.data.frame() %>% filter(stat %in% c("mean","p50")) %>% select(Species,variable,stat,value)

#Tri a plat 
nais16 %>% group_by(regnais) %>%  count()
nais16 %>% group_by(regnais) %>%  summarise(nbnais = n() ) %>% mutate(cumul_nais = cumsum(nbnais))

table(nais16$regnais,useNA="ifany")
cumsum(table(nais16$regnais,useNA="ifany"))

# Frequence
nais16 %>% group_by(regnais) %>%  summarise(nbnais = n()) %>% ungroup() %>% 
  mutate(pour_nais = nbnais / sum(nbnais) * 100)

nais16 %>% group_by(regnais) %>%  summarise(nbnais = n()) %>%  mutate(cumul_nais = cumsum(nbnais)) %>% 
  ungroup() %>% 
  mutate(pour_nais = nbnais / sum(nbnais) * 100) %>% 
  mutate(pour_nais_cum = cumsum(pour_nais))

prop.table(table(nais16$regnais,useNA="ifany")) * 100
cumsum(prop.table(table(nais16$regnais,useNA="ifany")) * 100)

# Tableau de contingence
table(nais16$regnais,nais16$sexe,useNA="ifany",dnn=c("Region","Sexe") ) 

table(nais16$regnais,nais16$sexe,useNA="ifany",dnn=c("Region","Sexe") ) %>% 
  addmargins(2) 

table(nais16$regnais,nais16$sexe,useNA="ifany",dnn=c("Region","Sexe") ) %>% 
  prop.table() %>% addmargins()

table(nais16$regnais,nais16$sexe,useNA="ifany",dnn=c("Region","Sexe") ) %>% 
  prop.table(1) %>% addmargins(2)

# FICHIERS PONDERES


#Somme avec pondération
# faux
givors %>% group_by(sexe) %>%  summarise(pop = sum(bulletin,na.rm=T))
# juste
givors %>% group_by(sexe) %>%  summarise(pop = sum(bulletin * poids_ind,na.rm=T))

library(Hmisc)
givors %>%  summarise(age_moy_sanspond = mean(age,na.rm=T) ,
                      age_moy_avecpond = wtd.mean(age,w=poids_ind,na.rm=T) )

#Autres stats avec pondération
givors %>% summarise(moyen = wtd.mean(age,w=poids_ind,na.rm=T),
                     med  = wtd.quantile(age,w=poids_ind,probs=0.5,na.rm=T) ,
                     p25  = wtd.quantile(age,w=poids_ind,probs=0.25,na.rm=T) ,
                     p75  = wtd.quantile(age,w=poids_ind,probs=0.75,na.rm=T) ,
                     p10  = wtd.quantile(age,w=poids_ind,probs=0.1,na.rm=T) ,                                  
                     p90  = wtd.quantile(age,w=poids_ind,probs=0.9,na.rm=T) )

# faux
givors %>% group_by(sexe) %>%  summarise(var = var(age,na.rm=T),
                                         sd = sd(age,na.rm=T) )
# juste
givors %>% group_by(sexe) %>%  summarise(var_pond = wtd.var(age,w=poids_ind,na.rm=T),
                                         sd_pond = sqrt(var_pond),na.rm=T)

