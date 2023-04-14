recipes <- read.csv("data/NYTrecipe.csv")
get_ingredients<-function(...){

  #create ingredients vector
  ingredients <- vector(mode = "character")
  userchoice = "Y"
  i = 0

  while (userchoice == "Y") {

      i = i + 1

      ingredients[i] <- readline(prompt = paste0("Enter ingredient ", i, ": "))

        if ((stringr::str_like(tolower(ingredients[i]), tolower(recipes$ingredients)))) {
          cat("\n", ingredients[i], "was found in the list of ingredients.")
        }
        else {
          cat("\n", ingredients[i], "was NOT found in the list of ingredients.")
        }

      userchoice <- readline(prompt = "Would you like to input a new ingredient? (Y/N)")
      if (userchoice == "Y") {next}
      if (userchoice == "N") {next}
      else {userchoice <- readline(prompt = "You typed something else than Y or N. Would you like to input a new ingredient? (Y/N)")}


  }



  # Convert ingredients to lowercase
  ingredients <- tolower(ingredients)

  # Print out the entered ingredients
  cat("You entered:", paste(ingredients, collapse = ", "))

  # call matching algorithm to get output
  source(here::here("R/matching_algorithm_ellipsis.R")) # change this later
  recipes <- NewYorkTimematch_item(ingredients)
  return (recipes)

}


get_ingredients("apple")

#debugonce(get_ingredients)

get_ingredients()
