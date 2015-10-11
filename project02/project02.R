library(rvest)
library(stringr)
library(dplyr)
library(tidyr)

mammals <- read.table("https://raw.githubusercontent.com/maxwagner/607/master/project02/mammals.txt", sep = "\t", header = TRUE, stringsAsFactors = FALSE)
mammals <- tbl_df(mammals)
colnames(mammals) <- tolower(colnames(mammals))
colnames(mammals) <- str_replace(colnames(mammals), "msw05_", "")
colnames(mammals) <- str_replace(colnames(mammals), "x[0-9._]+", "")
mammals <- select(mammals, order, family, binomial, contains("bodymass"))
mammals[mammals == -999] <- NA
mammals <- unite(mammals, full_name, order, family, binomial, sep = ", ")
mammals <- mammals[,1:4]
mammals <- mammals[complete.cases(mammals),]