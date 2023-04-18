# Ask for user input of three cooking ingredients
# Error message and stop the code if the attempt is over 3 times

get_ingredients <- function(...){
  ingredients <- vector(mode = "character")
  indeces <- c()

  user_choice <- readline(prompt = "Would you like to enter an ingredient? (Y to continue or enter anything else to leave)")
  i = 1

  while (user_choice == "Y") {
    attempts <- 0
    ingredients[i] <- readline(prompt = paste0("Enter ingredient ", i, ": "))

    word <- paste0("\\b",ingredients[i], "\\b")

    if(stringr::str_length(ingredients[i]) < 3){
      print("Your word is too short. Please enter full word")
      indeces[i] <- i
    }

    if(stringr::str_length(ingredients[i]) >= 3) {
      if(hunspell::hunspell_check(ingredients[i])) {
        if (any(grepl(tolower(word), tolower(NYTrecipe$ingredients)))) {
          cat("\n", ingredients[i], "was found in the list of ingredients.")
        }
        else {
          cat("\n", ingredients[i], "was NOT found in the list of ingredients.")
          indeces[i] <- i
        }
      }
      else {
        cat("\n", ingredients[i], "is not correct. Please check your spelling.")
        indeces[i] <- i
      }
    }

    userchoice <- readline(prompt = "Would you like to input a new ingredient? (Y/N)")
    if (userchoice == "Y") {next}

    # Convert ingredients to lowercase
    ingredients <- tolower(ingredients)
    ingredients <- ingredients[-indeces] #only include ingredients with correct spelling

    # Print out the entered ingredients
    cat("You entered:", paste(ingredients, collapse = ", "))
  }
}



