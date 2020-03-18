
# Séquence 07 - Combiner plusieurs tables

# Exercice 8

chemin <- "U:/Mes documents/Kit formation R/"
setwd(chemin)

ra2010 <- readRDS(file="RData/ra2010lib.rds")
ra2008 <- readRDS(file="RData/ra2008lib.rds")

#install.packages("dplyr")
library(dplyr)

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




