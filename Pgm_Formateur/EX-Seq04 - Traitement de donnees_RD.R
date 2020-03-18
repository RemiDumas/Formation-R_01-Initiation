
# Séquence 04 - Traitement de donnees

# Exercice 5

chemin <- "U:/Mes documents/[DEV] Kit formation R/"
setwd(chemin)

ra2010 <- readRDS(file="RData/ra2010lib.rds")


#install.packages("dplyr")
library(dplyr)

ra2010 %>% distinct(dep)

ra2010 %>% select(depcom, libgeo,  pop, pophom, popfem) %>% head()
ra2010 %>% select(-ze10, -canton_ville) %>% rename(dc = depcom)  %>% head()
ra2010 %>% filter(dep %in% c('07', '26') &
                    pop > 5000 & categorie_com != '111')

ra2010 %>% filter(dep == '07' | dep == '26' &
                    pop > 5000 & categorie_com != '111')
ra2010 %>% 
  select(depcom , dep, libgeo,  pop) %>% 
  filter(pop > 13000 & pop < 14000 & dep != "26")


ra2010 %>% count(is.na(dep))



ra2010 %>% 
  select(depcom , dep, libgeo,  pop) %>% 
  filter(pop > 13000 & pop < 14000 & (dep != "26" | is.na(dep)))

ra2010 %>% 
  select(depcom , dep, libgeo,  pop) %>% 
  filter(pop > 13000 , pop < 14000 , (dep != "26" | is.na(dep)))

str(iris)

iris %>% group_by(Species) %>% summarise(Sepal_moy = mean(Sepal.Length))

iris %>% ggplot() +
  geom_point(aes(x = Sepal.Length, y =Petal.Length, color = Species))
