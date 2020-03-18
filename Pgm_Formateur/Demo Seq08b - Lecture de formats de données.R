chemin <- "U:/Mes documents/[DEV] Kit formation R/"
setwd(chemin)

library(readODS) # read_ODS et write_ODS
data <- read_ods("./Data_nonR/Dep02.ods")
data <- data %>% mutate(densite=Population/Superficie)

write_ods(data, "./Data_nonR/Dep02b.ods")


library(readxl) #read_xls
data <- read_xls("./Data_nonR/cnaf.xls")



library(haven) #read_sas
data <- read_sas("./Data_nonR/ra2010lib.sas7bdat")


library(readr) #read_csv2 (préférable à la version de Rbase)
data <- read_csv2("./Data_nonR/dep01.csv")
data <- data %>% 
  mutate(
    partchfem = round(100 * chom_fem / sum(chom_hom+chom_fem, na.rm = T), 1)
    )

write_csv(data, "./Data_nonR/dep01b.csv")

# avec du pipe, sans ecrire de variable
read_csv2("./Data_nonR/dep01.csv") %>% 
  mutate(
    partchfem = round(100 * chom_fem / sum(chom_hom+chom_fem, na.rm = T), 1)
  ) %>% 
  write_csv("./Data_nonR/dep01b.csv")
