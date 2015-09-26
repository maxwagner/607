library(stringr)
chess <- scan(file = "tournamentinfo.txt", what = "character", skip = "3")
chess <- str_c(chess, collapse = " ")

# sep the players out, really big and ugly
chess_sep <- unlist(str_extract_all(chess, "\\d+\\s[|]\\s(\\w+[ -]+)+[|]\\d[.]\\d\\s+[|](\\w\\s+\\d*[|]){7}\\s\\w+\\s[|]\\s\\d+\\s[/]\\sR:\\s[:alnum:]+\\s*->\\s*[:alnum:]+\\s[|].+?[|](\\w*\\s[|]){7}"))

id <- unlist(str_extract(chess_sep, "\\d+"))
names <- str_trim(unlist(str_extract(chess_sep, "\\s(\\w+[ -]+)+")))
points <- unlist(str_extract(chess_sep, "\\d[.]\\d"))