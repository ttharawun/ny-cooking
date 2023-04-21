## code to prepare `DATASET` dataset goes here
get_table_metadata <- function(path){
  dt <- read.csv(path, stringsAsFactors = FALSE)
  paste0(readLines(textConnection(tabular(dt))))
}

NYTrecipe = get_table_metadata("./data-raw/NYTrecipe_update.csv")

NYTrecipe$ingredients <- textclean::replace_non_ascii(NYTrecipe$ingredients, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$instructions <- textclean::replace_non_ascii(NYTrecipe$instructions, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$title <- textclean::replace_non_ascii(NYTrecipe$title, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$tag <- textclean::replace_non_ascii(NYTrecipe$tag, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$time <- textclean::replace_non_ascii(NYTrecipe$time, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$serving <- textclean::replace_non_ascii(NYTrecipe$time, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$rating <- textclean::replace_non_ascii(NYTrecipe$rating, replacement = "", remove.nonconverted = TRUE)

usethis::use_data(NYTrecipe, overwrite = TRUE)
