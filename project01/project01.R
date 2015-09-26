library(stringr)
chess <- scan(file = "https://raw.githubusercontent.com/maxwagner/607/master/project01/tournamentinfo.txt", what = "character", skip = "3")
chess <- str_c(chess, collapse = " ")
chess_sep <- unlist(str_extract_all(chess, "\\d+\\s[|]\\s(\\w+[ -]+)+[|]\\d[.]\\d\\s+[|](\\w\\s+\\d*[|]){7}\\s\\w+\\s[|]\\s\\d+\\s[/]\\sR:\\s[:alnum:]+\\s*->\\s*[:alnum:]+\\s[|].+?[|](\\w*\\s[|]){7}"))

id <- unlist(str_extract(chess_sep, "\\d+"))
name <- str_trim(unlist(str_extract(chess_sep, "\\s(\\w+[ -]+)+")))
state <- unlist(str_extract(chess_sep, "[|]\\s\\w{2}\\s[|]"))
state <- str_trim(str_sub(state, 2, -2));
points <- unlist(str_extract(chess_sep, "\\d[.]\\d"))
starting_score <- unlist(str_extract(chess_sep, "R:\\s\\d+"))
starting_score <- substring(starting_score, 4);
opponents <- unlist(str_extract(chess_sep, "[|](\\w\\s+\\d*[|]){7}"))
opponents <- unlist(str_replace_all(opponents, "[:alpha:]+", ""))
opponents <- unlist(str_replace_all(opponents, "[:space:]+", ""))
opponents <- str_sub(opponents, 2, -2)
opponents <- unlist(str_split(opponents, "[|]"))
opponents <- unlist(str_extract(opponents, "\\d+"))

for (i in 1:length(opponents)) {
  if (!is.na(opponents[i])) {
    opponents[i] <- starting_score[as.numeric(opponents[i])]
  }
}

opponents <- data.frame(matrix(as.numeric(opponents), nrow = 64, byrow = T))
opponents <- round(apply(opponents, 1, mean, na.rm = T), 2)
chess_final <- cbind(name, state, points, starting_score, opponents);chess_final
write.csv(chess_final, file = "chess_output.csv")

calc_new <- function(old, opp, score, k) {
  ea <- (1 / (1 + 10 ^ ((opp - old) / 400)))
  rounded <- round((old + (k * (1 - ea))), digits = 0)
  return(rounded)
}