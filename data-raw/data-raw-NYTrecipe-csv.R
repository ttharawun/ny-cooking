## code to prepare `./data-raw/NYTrecipe.csv` dataset goes here

usethis::use_data(./data-raw/NYTrecipe.csv, overwrite = TRUE)

colnames(NYTrecipe)[1] <-("recipe_id")

NYTrecipe$ingredients <- textclean::replace_non_ascii(NYTrecipe$ingredients, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$instructions <- textclean::replace_non_ascii(NYTrecipe$instructions, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$title <- textclean::replace_non_ascii(NYTrecipe$title, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$tag <- textclean::replace_non_ascii(NYTrecipe$tag, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$time <- textclean::replace_non_ascii(NYTrecipe$time, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$serving <- textclean::replace_non_ascii(NYTrecipe$time, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$rating <- textclean::replace_non_ascii(NYTrecipe$rating, replacement = "", remove.nonconverted = TRUE)

usethis::use_data(NYTrecipe, overwrite = TRUE)
