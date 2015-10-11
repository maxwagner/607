library(rvest)
library(stringr)
library(dplyr)

# remove placement suffixes
stripSuffix <- function(string) {
  string <- str_replace(string, "st", "")
  string <- str_replace(string, "nd", "")
  string <- str_replace(string, "rd", "")
  string <- str_replace(string, "th", "")
  return(string)
}

# read in moto des nation's table using rvest, then remove the last column, and last row
url <- "https://en.wikipedia.org/wiki/Motocross_des_Nations"
xpath <- '//*[@id="mw-content-text"]/table[3]'
mdn <- url %>%
  read_html() %>%
  html_nodes(xpath = xpath) %>%
  html_table(header = TRUE)
mdn <- mdn[[1]]
mdn$Years <- NULL
country <- mdn[1:54,1]
mdn <- mdn[1:54,2:17]

# remove the suffixes
for (i in 1:16) {
  mdn[,i] <- stripSuffix(mdn[,i])
}

# add a new column for participating years
for (i in 1:54) {
  if (i == 1) {
    mdn$participated[i] <- sum(mdn[i,] != "")
  } else {
    mdn$participated[i] <- sum(mdn[i,] != "") - 1
  }
}

# add 0's to blank spots, then convert to numerics
mdn[mdn == ""] <- 0
for (i in 1:16) {
  mdn[,i] <- as.numeric(mdn[,i])
}

# add row sums and avg finishing position
for (i in 1:54) {
  mdn$sum[i] <- rowSums(mdn[i,1:16])
}
mutate(mdn, avg = sum / participated)
mdn$sum <- NULL

# bind
mdn <- cbind(country, mdn)

# reorder by avg finishing position instead of country
mdn <- arrange(mdn, avg)
