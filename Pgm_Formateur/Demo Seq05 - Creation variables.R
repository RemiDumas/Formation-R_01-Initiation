
# Demo 05 - Creation variables

chemin <- "U:/2_Formation R Prise en main rapide de donnees/Malette/"
# chemin <- "U:/FormationR/"
# chemin <- "D:"

tab_naissances <- readRDS(file=paste0(chemin,"RData/naissances2016.rds"))
ra2010 <- readRDS(file=paste0(chemin,"RData/ra2010lib.rds"))

#install.packages("dplyr")
library(dplyr)

tab_naissances %>% select(depnais, comnais ,agepere, agemere ) %>% 
                   mutate(diff_age = agepere - agemere,
                          dcnais = paste0(depnais,"-",substr(comnais,3,5) ) ) %>%  head()

tab_naissances %>% select(comnais, sexe , agemere) %>% 
                   mutate(lsexe = ifelse ( sexe == '1', "Garçon","Fille")) %>%  head()

ra2010 %>% mutate(dep = ifelse(is.na(dep),"Inconnu",dep) ) %>% head()
ra2010 %>% mutate(dep = coalesce(dep,"ZZZ")) %>% head()  

nomencl <- tab_naissances %>% distinct(csm) %>%  arrange(csm)
nomencl <- nomencl %>% mutate(
  csm_ = case_when(                                         # On crée une nouvelle colone 'csm_',
    substr(csm, 1, 1) == '1' ~ "agriculteurs",              # en regardant le contenu de la colonne 'csm' :
    substr(csm, 1, 1) == '2' ~ "chefs d'entreprise",        # la sous-chaine allant du caractère no 1 au caractère no 1
    substr(csm, 1, 1) == '3' ~ "cadres",
    substr(csm, 1, 1) == '4' ~ "professions intermédiaires",
    substr(csm, 1, 1) == '5' ~ "employés",
    substr(csm, 1, 1) == '6' ~ "ouvriers" ,                 # les modalités 1 à 6 sont recodées explicitement
    TRUE                     ~ "indéterminé"))              # et si tout échoue...

tab_naissances %>% select(matches(".p.")) %>%  head()
tab_naissances %>% select(matches("^a")) %>%  head()

library(stringr)
tab_naissances %>% select(starts_with("age")) %>%  rename_all(str_to_upper) %>% head()

VAR <- c("agemere","agepere")
tab_naissances %>%  summarise_at(VAR,mean)

tab_naissances %>%  mutate_at(VAR, funs( . * 2)) %>% head()  
