
# Demo 04 - Traitement de donnees

chemin <- "U:/2_Formation R Prise en main rapide de donnees/Malette/"
# chemin <- "U:/FormationR/"
# chemin <- "D:"

tab_naissances <- readRDS(file=paste0(chemin,"RData/naissances2016.rds"))


#install.packages("dplyr")
library(dplyr)

tab_naissances %>%  distinct(regnais)

tab_naissances %>% select(sexe , regnais , agemere ,csp ) %>% head()
tab_naissances %>% select_if(is.numeric ) %>% head()

tab_naissances %>% select(-depnais,-comnais ) %>% head()
tab_naissances %>% select(-c(depnais,comnais,comnais3112) ) %>% head()

tab_naissances %>% select(sexe , regnais , agemere ,csp ) %>% 
                   rename(s=sexe,age=agemere) %>% head()

tab_naissances %>% filter (depnais =="69" & jumeau != '0' & agemere > 40 ) %>% 
                   count()



