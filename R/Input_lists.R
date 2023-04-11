# Import recipes
# recipes <- read.csv("data/NYTrecipe.csv")


# Ask for user input of three cooking ingredients
# Error message and stop the code if the attempt is over 3 times
get_ingredients<-function(...){
  ingredients <- vector(mode = "character", length = 3)
  for (i in 1:3) {
    attempts <- 0
    repeat {
      ingredients[i] <- readline(prompt = paste0("Enter ingredient ", i, ": "))
      if (any(grepl(tolower(ingredients[i]), tolower(recipes$ingredients)))) {
        cat("\n", ingredients[i], "was found in the list of ingredients.")
        break
      } else {
        cat("\n", ingredients[i], "was NOT found in the list of ingredients.")
        attempts <- attempts + 1
        if (attempts == 3) {
          warning("Exceeded maximum number of attempts. Please restart the program.")
          stop()
        } else {
          user_choice <- readline(prompt = "Would you like to input a new ingredient? (Y/N)")
          if (user_choice == "Y") {
            next
          } else {
            warning("Please restart the program and enter valid ingredients.")
            stop()
          }
        }
      }
    }
  }

  # Convert ingredients to lowercase
  ingredients <- tolower(ingredients)

  # Print out the entered ingredients
  cat("You entered:", paste(ingredients, collapse = ", "))
  return(ingredients)
}

# testing
test <- get_ingredients()
test # will return a vector with the input ingredients


