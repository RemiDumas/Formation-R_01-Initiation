
# Séquence 3 - Premieres statistiques

# Exercice 4

chemin <- "U:/Mes documents/Kit formation R/"
setwd(chemin)

ra2010 <- readRDS(file="RData/naissances2016.rds")

#install.packages("dplyr")
library(dplyr)


ra2010 %>% tally()
# ra2010 %>% count() # sans argument, count() équivaut à tally()
# ra2010 %>% count(depnais) # compte chaque modalité de la variable depnais

ra2010 %>% summarise(n())
ra2010 %>% summarise(age_mere_moy = mean(agemere), age_pere_moy = mean(agepere))
ra2010 %>% summarise(age_mere_med = quantile(agemere,0.5), age_pere_med = quantile(agepere,0.5))
ra2010 %>% summarise(garcon = sum(sexe == '1'))
# ra2010 %>% summarise(garcon = sum(jnais == '04'))
# ra2010 %>% count(jnais)
