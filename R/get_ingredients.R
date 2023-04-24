#' get ingredient list from user and return matched recipes as output
#'
#' @param ... the function directly asks for user input, the argument is not necessary, but it can be a vector of character that contains ingredient names
#'
#' @return a 10-row dataframe of recipes based on user input
#' @export
#'
#' @examples As the function asks for user input, it usually does not require an argument. For an example, we can put in a string vector.
#' get_ingredients(c("egg", "sugar","milk))
get_ingredients<-function(...){
  vector <- unlist(list(...))

  if(length(vector) == 0) {
    #create ingredients vector
    ingredients <- vector(mode = "character")
    indeces <- c()
    userchoice = "Y"
    i = 0

    while(userchoice == "Y"){
      i = i + 1

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
            ingredients <- ingredients[i]
            indeces[i] <- 0
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
      if (userchoice == "N") {break}
      else {userchoice <- readline(prompt = "You typed something else than Y or N. Would you like to input a new ingredient? (Y/N)")}
    }

    if(length(indeces) > 0){
      ingredients <- tolower(ingredients)
      ingredients <- ingredients[-indeces]
    }

    # Print out the entered ingredients
    cat("You entered:", paste(ingredients, collapse = ", "))

  }
  # call matching algorithm to get output
  recipes <- NewYorkTimesCooking::match_item(ingredients)

  return(recipes)
}


