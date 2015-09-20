library(stringr)
example.obj <- "1. A small sentence. - 2. Another tiny sentence."

# examples
str_extract(example.obj, "banana")
unlist(str_extract_all(example.obj, "sentence"))
str_extract(example.obj, ignore.case("SMALL"))
str_extract(example.obj, "2")
str_extract(example.obj, "^2") # beginning of string operator
unlist(str_extract_all(example.obj, "sentence$")) # end of string operator
unlist(str_extract_all(example.obj, "tiny|sentence")) # or
str_extract(example.obj, "sm.ll") # any char
str_extract(example.obj, "sm[abc]ll") # any char in brackets
str_extract(example.obj, "sm[a-p]ll") # same idea
str_extract("Franc¸ois Hollande", "Fran[[:alpha:]]ois") # any alpha chars
str_extract(example.obj, "s[[:alpha:]]{3}l") # 3 alpha chars
unlist(str_extract_all(example.obj, "\\.")) # makes metachar not meta
unlist(str_extract_all(example.obj, fixed("."))) # same as above