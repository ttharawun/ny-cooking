## code to prepare `NYTrecipe.csv` dataset goes here

NYTrecipe <- read.csv("data-raw/NYTrecipe.csv")

#clean instructions
instruction <- NYTrecipe$instructions

updated_instruction <- vector("character", length(instruction))

for (i in seq_along(instruction)) {
  updated_instruction[i] <- gsub("(\\d)([A-Za-z])", "\\1 \\2", instruction[i])
}

NYTrecipe$ingredients <- textclean::replace_non_ascii(NYTrecipe$ingredients, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$instructions <- textclean::replace_non_ascii(NYTrecipe$instructions, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$title <- textclean::replace_non_ascii(NYTrecipe$title, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$tag <- textclean::replace_non_ascii(NYTrecipe$tag, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$time <- textclean::replace_non_ascii(NYTrecipe$time, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$serving <- textclean::replace_non_ascii(NYTrecipe$serving, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$instructions <- updated_instruction

usethis::use_data(NYTrecipe, overwrite = TRUE)
