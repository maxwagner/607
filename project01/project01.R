library(stringr)
chess <- scan(file = "https://raw.githubusercontent.com/maxwagner/607/master/project01/tournamentinfo.txt", what = "character", skip = "3")
chess <- str_c(chess, collapse = " ")
chess_sep <- unlist(str_extract_all(chess, "\\d+\\s[|]\\s(\\w+[ -]+)+[|]\\d[.]\\d\\s+[|](\\w\\s+\\d*[|]){7}\\s\\w+\\s[|]\\s\\d+\\s[/]\\sR:\\s[:alnum:]+\\s*->\\s*[:alnum:]+\\s[|].+?[|](\\w*\\s[|]){7}"))

id <- unlist(str_extract(chess_sep, "\\d+"))
name <- str_trim(unlist(str_extract(chess_sep, "\\s(\\w+[ -]+)+")))
state <- str_trim(unlist(str_extract(chess_sep, "\\s\\w{2}\\s")));state
points <- unlist(str_extract(chess_sep, "\\d[.]\\d"))

starting_score <- unlist(str_extract(chess_sep, "R:\\s\\d+"))
starting_score <- substring(starting_score, 4);starting_score

opponents <- unlist(str_extract(chess_sep, "[|](\\w\\s+\\d*[|]){7}"))
opponents <- unlist(str_replace_all(opponents, "[:alpha:]+", ""))
opponents <- unlist(str_replace_all(opponents, "[:space:]+", ""))
opponents <- str_sub(opponents, 2, -2);opponents
opponents <- unlist(str_split(opponents, "[|]"))
opponents <- matrix(opponents, nrow = 64, byrow = T)
colnames(opponents) <- paste('o', 1:7, sep = "")
# opponents <- unlist(str_extract(opponents, "\\d+"));opponents

prelim <- cbind(id, name, state, points, starting_score, opponents);prelim


write.csv(prelim, file = "chess_output.csv")