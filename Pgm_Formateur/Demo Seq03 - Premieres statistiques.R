# Demo 03 - Premieres statistiques

chemin <- "U:/2_Formation R Prise en main rapide de donnees/Malette/"
# chemin <- "U:/FormationR/"
# chemin <- "D:"

ra2010 <- readRDS(file=paste0(chemin,"RData/ra2010lib.rds"))

#install.packages("dplyr")
library(dplyr)

ra2010  %>%  str()
ra2010  %>%  head()
ra2010 %>% dim()

ra2010 %>% count()
ra2010 %>% summarise(nbcom = n())
ra2010 %>% summarise(totpop = sum(pop), totfoy_fem= sum(foy_fem))
ra2010 %>% summarise(totpop = sum(pop), totfoy_fem= sum(foy_fem,na.rm=T))
ra2010 %>% summarise(mediane =quantile(pop, 0.5),
                     p25 =quantile(pop, 0.25),
                     moy = mean(pop) ) 

ra2010 %>% summarise(res = sum(pop))