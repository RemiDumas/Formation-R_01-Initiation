
# Séquence 05 - Création variables

# Exercice 6

chemin <- "U:/Mes documents/[DEV] Kit formation R/"
setwd(chemin)

ra2010 <- readRDS(file="RData/ra2010lib.rds")


#install.packages("dplyr")
library(dplyr)

ra2010b <- ra2010 %>% mutate(chom = chom_hom + chom_fem) 

ra2010 <- ra2010 %>% transmute(chom = chom_hom + chom_fem) 

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
foo <- ra2010 %>%  select(dep, depcom, libgeo, pop, chom_hom, chom_fem ) %>% 
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

df <- data.frame(
  a = c("1","2","3","5","8"),
  b = c(0.1,0.3,0.5,0.4,0.2),
  valeur = c("4.74","2.85","3.1","5.2","1.8"), stringsAsFactors =  F)  

df2 <- df %>% mutate_if(is.character, as.numeric) 

df2 <- df %>% mutate_at(c(1,3), as.numeric) 

df3 <- df2 %>% mutate_at(3, funs(. * 100) )

df3 <- df2 %>% mutate_all(funs(. /10) )

df2 %>% summarise_all(funs(moy = mean))
df %>% summarise_if(is.numeric, funs(moy = mean))

ra2010 %>% mutate (toto = chom_hom/2, titi = chom_fem/2)
