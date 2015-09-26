library(stringr)
chess <- scan(file = "https://raw.githubusercontent.com/maxwagner/607/master/project01/tournamentinfo.txt", what = "character", skip = "3")
chess <- str_c(chess, collapse = " ")
chess_sep <- unlist(str_extract_all(chess, "\\d+\\s[|]\\s(\\w+[ -]+)+[|]\\d[.]\\d\\s+[|](\\w\\s+\\d*[|]){7}\\s\\w+\\s[|]\\s\\d+\\s[/]\\sR:\\s[:alnum:]+\\s*->\\s*[:alnum:]+\\s[|].+?[|](\\w*\\s[|]){7}"))



id <- unlist(str_extract(chess_sep, "\\d+"))

names <- str_trim(unlist(str_extract(chess_sep, "\\s(\\w+[ -]+)+")))

starting_score <- unlist(str_extract(chess_sep, "R:\\s\\d+"))
starting_score <- substring(starting_score, 4);starting_score

ending_score <- unlist(str_extract(chess_sep, "->\\s*\\d+"))
ending_score <- str_trim(substring(ending_score, 3));ending_score
  
points <- unlist(str_extract(chess_sep, "\\d[.]\\d"))