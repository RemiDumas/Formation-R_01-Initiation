
# Séquence 05 - Création variables

# Exercice 6

chemin <- "U:/Mes documents/Kit formation R/"
setwd(chemin)

ra2010 <- readRDS(file="RData/ra2010lib.rds")


#install.packages("dplyr")
library(dplyr)

ra2010 %>% mutate(chom = chom_hom + chom_fem)
ra2010 %>% mutate(com = substr(depcom,3,5))
ra2010 %>% mutate(libelle = paste0(depcom," - ",libgeo))
ra2010 %>% mutate(chom = chom_hom + chom_fem,
                  p_fem = round(chom_fem * 100 / chom, 2)
                  )
ra2010 %>% mutate(
  zone_tour = case_when (
    pop > 100000 ~ "Ville",
    dep %in% c("73", "74") ~ "Montagne" ,
    dep %in% c("07", "26") ~ "Sud" ,
    dep %in% c("01", "42", "38", "69") ~ "Campagne" ,
    TRUE   ~ "Indéterminé"
  )
)

# toutes les variables crées
ra2010 %>%  select(dep, depcom, libgeo, pop, chom_hom, chom_fem ) %>% 
             mutate( chom = chom_hom + chom_fem,
                    com = substr(depcom,3,5),
                    libelle = paste0(depcom," - ",libgeo) ,
                    p_fem = round(chom_fem * 100 / chom, 2) ,
                    zone_tour = case_when ( 
                        pop > 100000 ~ "Ville",
                        dep %in% c("73","74") ~ "Montagne" ,
                        dep %in% c("07","26") ~ "Sud" ,
                        dep %in% c("01","42","38","69") ~ "Campagne" ,
                        TRUE   ~ "Indéterminé")  )

  



