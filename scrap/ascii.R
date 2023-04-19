NYTrecipe$ingredients <- textclean::replace_non_ascii(NYTrecipe$ingredients, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$instructions <- textclean::replace_non_ascii(NYTrecipe$instructions, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$title <- textclean::replace_non_ascii(NYTrecipe$title, replacement = "", remove.nonconverted = TRUE)

NYTrecipe$tag <- textclean::replace_non_ascii(NYTrecipe$tag, replacement = "", remove.nonconverted = TRUE)
