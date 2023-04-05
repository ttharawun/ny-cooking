get_ingredients<-function(...){

  #create ingredients vector
  ingredients <- vector(mode = "character", length = 3)

  for (i in 1:3) {
    attempts <- 0

    repeat {

      # read user input
      ingredient <- readline(prompt = paste0("Enter ingredient ", i, ": "))

      # detect typo
      if(!hunsbell::hunsbell_check(ingredient)){
        warning("There is a typo in your input. Please restart the program.")
        stop()
      }
      # store input into vector
      ingredients[i] <- ingredient

      # test if the input ingredient exists in all recipes
      if (any(grepl(tolower(ingredients[i]), tolower(recipes$ingredients)))) {
        cat("\n", ingredients[i], "was found in the list of ingredients.")
        break
      }
      else {
        cat("\n", ingredients[i], "was NOT found in the list of ingredients.")
        attempts <- attempts + 1
        if (attempts == 3) {
          warning("Exceeded maximum number of attempts. Please restart the program.")
          stop()
        }
        # not working yet
        else {
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

  # return ingredients as a vector
  return(ingredients)

}
