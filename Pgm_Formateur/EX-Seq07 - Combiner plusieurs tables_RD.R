
# Séquence 07 - Combiner plusieurs tables

# Exercice 8

#install.packages("dplyr")
library(dplyr)

chemin <- "U:/Mes documents/[DEV] Kit formation R/"
setwd(chemin)

load("./RData/fillesgarcons.RData")

bind_rows(filles,garcons)

ensemble <- garcons %>% rename(poids = poid) %>% bind_rows(filles)

colnames(garcons)
colnames(filles)

vec_alea <- data.frame(alea=runif(nrow(ensemble)+1,1,10)) 
bind_cols(ensemble, vec_alea)


personnes <- data.frame(
  nom = c("Sylvie", "Sylvie", "Monique", "Gunter","Rayan", "Rayan"),
  voiture = c("Twingo", "Ferrari", "Scenic", "Lada","Twingo","Clio"))
voitures <- data.frame(bagnole = c("Ferrari", "Clio", "Lada", "208"), 
                       vitesse = c("280", "160", "85", "160"),
                       stringsAsFactors = F)

personnes <- personnes %>% mutate_if(is.factor,as.character)

full_join(personnes,voitures, by = c("voiture" = "bagnole")) %>% 
  filter(!is.na(nom))


ra2010 <- readRDS(file="RData/ra2010lib.rds")
ra2008 <- readRDS(file="RData/ra2008lib.rds")



evol <- ra2010 %>% select(depcom,libgeo,pop) %>% 
  rename(Codgeo = depcom) %>% right_join(ra2008)

evol <- ra2010 %>% select(depcom,libgeo,pop) %>% 
  inner_join(ra2008, by=c("depcom"="Codgeo"))
  
evol <- ra2010 %>% select(depcom,libgeo,pop) %>% 
                  left_join(ra2008,by=c("depcom"="Codgeo")) %>% 
                  mutate(evol=pop - pop2008,
                         evol_pour = round(100 *evol/pop2008, 2),
                         evol_abs = abs(evol)) %>% 
                  arrange(desc(evol_abs)) %>% 
                  select(-evol_abs) %>% 
                   head(15)

ra2010 %>% anti_join(ra2008,by=c("depcom"="Codgeo"))
ra2008 %>% anti_join(ra2010,by=c("Codgeo"="depcom"))




