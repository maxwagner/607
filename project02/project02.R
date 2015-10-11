library(rvest)
library(stringr)
library(dplyr)

# read in the mammals txt file
mammals <- read.table("mammals.txt", sep = "\t", header = TRUE, stringsAsFactors = FALSE)