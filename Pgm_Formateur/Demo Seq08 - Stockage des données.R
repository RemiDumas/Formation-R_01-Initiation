
# Demo 08 - Stockage des données

chemin <- "U:/2_Formation R Prise en main rapide de donnees/Malette/"
# chemin <- "U:/FormationR/"
# chemin <- "D:"

ra2010 <- readRDS(file=paste0(chemin,"RData/ra2010lib.rds"))
nais16 <- readRDS(file=paste0(chemin,"RData/naissances2016.rds"))

#install.packages("dplyr")
library(dplyr)

ra30 <- ra2010 %>% filter(pop > 30000) 
ra50 <- ra2010 %>% filter(pop > 50000) 

saveRDS(ra30,file=paste0(chemin,"Sortie_donnee/tabR30.rds"))
saveRDS(ra50,file=paste0(chemin,"Sortie_donnee/tabR50.rds"))

save(ra30,ra50,file=paste0(chemin,"Sortie_donnee/tab_selection.RData"))

#install.packages("fst")
library(fst)
write_fst(nais16,paste0(chemin,"Sortie_donnee/naissances.fst"))

metadata_fst(paste0(chemin,"Sortie_donnee/naissances.fst"))
read_fst(paste0(chemin,"Sortie_donnee/naissances.fst"),from = 1 , to = 10)
read_fst(paste0(chemin,"Sortie_donnee/naissances.fst"),columns=c("mnaism","anaism","depnaism"),from=1,to=15)


# library("fstplyr")
# src <-  src_fst(paste0(chemin,"Sortie_donnee/") )
# tbl(src,"naissances") %>% select(mnaism,anaism) %>% head(15)