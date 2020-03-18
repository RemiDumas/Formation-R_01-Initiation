
# Séquence 2 - Prise en main donnees

# Mon premier programme en R créé le 14/03/2019

# Exercice 2

ville <- c("Paris","Clermont-Fd","Lyon","Nice","Nantes" )
dep <-  c("75","63","69","06","44")
pop <-  c(1800,130,800,NA,320)

t_ville <- data.frame(ville,dep,pop,stringsAsFactors = F)
t_ville

dim(t_ville)
colnames(t_ville)

# Exercice 3

help(read_sas)
help("read_sas",try.all.packages=T)
library(haven)
help(read_sas)
