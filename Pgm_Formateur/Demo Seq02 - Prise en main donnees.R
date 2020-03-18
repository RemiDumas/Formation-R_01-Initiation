# Demo 02 - Prise en main de données

setwd("F:/Kit formation R/RData")
tab_naissances <- readRDS(file="naissances2016.rds")

filles <- readRDS("filles.rds")
garcons <- readRDS("garcons.rds")

load("fillesgarcons.Rdata")


str(tab_naissances)
head(tab_naissances)
tail(tab_naissances)

dim(tab_naissances)
l_variables <- colnames(tab_naissances)

is(tab_naissances)
is(chemin)

is(l_variables)
mode(l_variables)
length(l_variables)

serie <-  c(3,5.2,pi,-14)
is(serie)
serie2 <-  c(3,5,16,22)
is(serie2)

as.integer(serie)

