
# Séquence 09 - Réaliser des traitements statistiques

# Exercice 9

chemin <- "U:/Mes documents/Kit formation R/"
setwd(chemin)

ra2010 <- readRDS(file="RData/ra2010lib.rds")
#install.packages("dplyr")
#install.packages("skimr")
library(dplyr)
library(skimr)

library(DT)

ra2010 %>% skim %>% datatable

ra2010[is.na(ra2010$dep),]

ra2010 %>%  group_by(dep) %>% skim(pop,chom_fem)

stat <- ra2010 %>% group_by(dep) %>% skim(pop) %>% 
  as.data.frame() %>% filter(dep %in% c("07","69") & stat %in% c("n","p50","p100") )  %>% 
  select(dep,variable,stat,value)
                             
saveRDS(stat,file=paste0(chemin,"Sortie_donnees/stat_pop.rds"))                             

# Exercice 10

ra2010 %>% group_by(dep) %>%  
  summarise(nbcom = n() ) %>% 
  arrange(desc(nbcom)) %>% 
  mutate(cumul = cumsum(nbcom))

ra2010 %>% group_by(dep) %>%  
  summarise(nbcom = n()) %>% 
  mutate(pour_com = nbcom / sum(nbcom) * 100)

# ou avec prop.table
table(ra2010$dep) %>% 
  prop.table %>% 
  addmargins %>% 
  round(2) %>% 
  paste("%") # attention le paste transforme le type en character

# Exercice 11
table(ra2010$dep,ra2010$categorie_com,useNA="ifany",dnn=c("Département","Catégorie commune") ) %>% addmargins()

table(ra2010$dep,ra2010$categorie_com,useNA="ifany",dnn=c("Département","Catégorie commune") ) %>% 
prop.table(1) 

# Exercice 12
givors <- readRDS(file=paste0(chemin,"RData/givors.rds"))
lib_tact <- readRDS(file=paste0(chemin,"RData/lib_tact.rds"))

#install.packages("Hmisc")
library(Hmisc)

givors %>% group_by(tact) %>%  summarise(pop = sum(bulletin * poids_ind,na.rm=T),
                                        age_moy = wtd.mean(age,w=poids_ind,na.rm=T) ,
                                        age_med  = wtd.quantile(age,w=poids_ind,probs=0.5,na.rm=T)) %>% 
          left_join(lib_tact,by=c("tact"="code")) %>% 
          select(tact,intitule,pop,age_moy,age_med)
