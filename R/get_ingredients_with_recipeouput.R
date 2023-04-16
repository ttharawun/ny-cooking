recipes <- read.csv("data/NYTrecipe.csv")
get_ingredients<-function(...){

  #create ingredients vector
  ingredients <- vector(mode = "character")
  indeces <- c()
  userchoice = "Y"
  i = 0

  while (userchoice == "Y") {

      i = i + 1

      ingredients[i] <- readline(prompt = paste0("Enter ingredient ", i, ": "))
      word <- paste0("\\b",ingredients[i], "\\b")

      if(stringr::str_length(ingredients[i]) < 3){
        print("Your word is too short. Please enter full word")
        indeces[i] <- i
      }

      if(stringr::str_length(ingredients[i]) >= 3) {
        if(hunspell::hunspell_check(ingredients[i])) {
          if (any(grepl(tolower(word), tolower(recipes$ingredients)))) {
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
      if (userchoice == "N") {next}
      else {userchoice <- readline(prompt = "You typed something else than Y or N. Would you like to input a new ingredient? (Y/N)")}


  }

  # Convert ingredients to lowercase
  ingredients <- tolower(ingredients)
  ingredients <- ingredients[-indeces] #only include ingredients with correct spelling

  # Print out the entered ingredients
  cat("You entered:", paste(ingredients, collapse = ", "))

  # call matching algorithm to get output
  source(here::here("R/matching_algorithm_ellipsis.R")) # change this later
  recipes <- NewYorkTimematch_item(ingredients)
  return (recipes)

}
