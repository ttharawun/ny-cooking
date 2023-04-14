#' Title get ingredient with ouput
#'
#' @param ...
#'
#' @return a 10-row dataframe of recipes based on user input
#' @export
#'
#' @examples get_ingredients()
get_ingredients<-function(...){
  recipes <- NYTrecipe
  #create ingredients vector
  ingredients <- vector(mode = "character")
  userchoice = "Y"
  i = 0

      repeat{
      i = i + 1

      ingredients[i] <- readline(prompt = paste0("Enter ingredient ", i, ": "))
      if (any(grepl(tolower(ingredients[i]), tolower(recipes$ingredients)))) {
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
  #source(here::here("R/matching_algorithm_ellipsis.R")) # change this later
  recipes <- NewYorkTimesCooking::match_item(ingredients)
  return (recipes)

}


debugonce(get_ingredients)

get_ingredients()
