




# Séquence 3 - Premieres statistiques

# Exercice 4

chemin <- "U:/Mes documents/[DEV] Kit formation R/"
setwd(chemin)

ra2010 <- readRDS(file="RData/naissances2016.rds")

#install.packages("dplyr")
library(dplyr)


ra2010 %>% tally()
ra2010 %>% count() # sans argument, count() équivaut à tally()
decomptedep <- ra2010 %>% count(depnais) # compte chaque modalité de la variable depnais
decomptedep

mean(decomptedep$n)

ra2010 %>% summarise('Nombre de naissances' = n())
ra2010 %>% summarise(age_mere_moy = mean(agemere),
                     age_pere_moy = mean(agepere))

ra2010 %>% summarise(age_mere_med = quantile(agemere, 0.5),
                     age_pere_med = quantile(agepere, 0.5))
ra2010 %>% summarise(garcon = sum(sexe == '1'))

ra2010 %>% summarise(somme_age_pere = sum(agepere))
ra2010 %>% summarise(somme_age_pere = sum(agepere == 45))
ra2010 %>% summarise(somme_age_pere = sum(is.na(agepere)))
# ra2010 %>% summarise(garcon = sum(jnais == '04'))
# ra2010 %>% count(jnais)
  
 
