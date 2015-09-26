library(stringr)
chess <- scan(file = "tournamentinfo.txt", what = "character")
chess <- paste0(chess, collapse = " ")

chess_sep <- unlist(str_extract_all(chess, "\\d+\\s[|]\\s(\\w+[ -]+)+[|]\\d[.]\\d\\s+[|](\\w\\s+\\d*[|]){7}\\s\\w+\\s[|]\\s\\d+\\s[/]\\sR:\\s[:alnum:]+\\s*->\\s*[:alnum:]+\\s[|].+?[|](\\w*\\s[|]){7}"))