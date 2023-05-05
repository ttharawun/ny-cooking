#' get ingredient list from user and return matched recipes as output
#'
#' @param ... the function directly asks for user input, the argument is not necessary, but it can be a vector of character that contains ingredient names
#'
#' @return a 10-row dataframe of recipes based on user input
#' @export
#'
#' @examples get_ingredients("egg", "sugar", "milk")
get_ingredients<-function(...){
  ingredients <- c(...)

  if(length(ingredients) == 0) {
    #create ingredients vector
    ingredients <- vector(mode = "character")
    indeces <- vector()
    userchoice = "Y"
    i = 0

    while(userchoice == "Y"){
      i = i + 1

      ingredients[i] <- readline(prompt = paste0("Enter ingredient ", i, ": "))
      word <- paste0("\\b",ingredients[i], "\\b")

      if(stringr::str_length(ingredients[i]) < 3){
        message("Your word is too short. Please enter full word.")
        indeces[i] <- i
      }

      if(stringr::str_length(ingredients[i]) >= 3) {
        if(hunspell::hunspell_check(ingredients[i])) {
          if (any(grepl(tolower(word), tolower(NYTrecipe$ingredients)))) {
            message("\n", ingredients[i], " was found in the list of ingredients.")
            indeces[i] <- 0
          }
          else {
            message("\n", ingredients[i], " was NOT found in the list of ingredients.")
            indeces[i] <- i
          }
        }
        else {
          message("\n", ingredients[i], " is not correct. Please check your spelling.")
          indeces[i] <- i
        }
      }

      userchoice <- readline(prompt = "Would you like to input a new ingredient? (Y/N)")
      if (userchoice == "Y") {next}
      if (userchoice == "N") {break}
      else {userchoice <- readline(prompt = "You typed something else than Y or N. Would you like to input a new ingredient? (Y/N)")}
    }

    if(sum(indeces) > 0){
      ingredients <- tolower(ingredients)
      ingredients <- ingredients[-indeces]
      if (length(ingredients) > 0){
        # Print out the entered ingredients
        message("You entered: ", paste(ingredients, collapse = ", "),"\n")
        message("Please wait while the recipes are loading...")
        # call matching algorithm to get output
        recipes <- NewYorkTimesCooking::match_item(ingredients)
        recipes$tag <- stringr::str_replace_all(recipes$tag, pattern = ",", replacement = ", ")
        return(recipes)
      }
      else{
        warning("Sorry there is no recipe that matches your input list.")
      }
    }
    else{
      ingredients <- tolower(ingredients)
      # Print out the entered ingredients
      message("You entered: ", paste(ingredients, collapse = ", "),"\n")
      message("Please wait while the recipes are loading...")
      # call matching algorithm to get output
      recipes <- NewYorkTimesCooking::match_item(ingredients)
      recipes$tag <- stringr::str_replace_all(recipes$tag, pattern = ",", replacement = ", ")
      return(recipes)
    }
  }
  else{
    ingredients <- stringr::str_split(string = ingredients, pattern = ",")
    ingredients <- unlist(ingredients)
    indeces <- vector()

    for (i in 1:length(ingredients)) {
      if(stringr::str_length(ingredients[i]) < 3){
        message(paste0(ingredients[i], " is too short. Please enter full word."))
        indeces[i] <- i
      }
      if(stringr::str_length(ingredients[i]) >= 3) {
        if(hunspell::hunspell_check(tolower(ingredients[i]))) {
          if (any(grepl(tolower(ingredients[i]), tolower(NYTrecipe$ingredients)))) {
            message(paste0(ingredients[i], " was found in the list of ingredients."))
            indeces[i] <- 0
          }
          else {
            message(paste0(ingredients[i], " was NOT found in the list of ingredients."))
            indeces[i] <- i
          }
        }
        else {
          message(paste0(ingredients[i], " is not correct. Please check your spelling."))
          indeces[i] <- i
        }
      }
    }

    if(sum(indeces) > 0){
      ingredients <- ingredients[-indeces]
      if (length(ingredients) > 0){
        message(paste0("You entered: ", paste(ingredients, collapse = ", "),"\n"))
        message("Please wait while the recipes are loading...")
        recipes <- NewYorkTimesCooking::match_item(ingredients)
        recipes$tag <- stringr::str_replace_all(recipes$tag, pattern = ",", replacement = ", ")
        return(recipes)
      }
      else{
        warning("Sorry there is no recipe that matches your input list.")
      }
    }
    else{
      ingredients <- tolower(ingredients)
      message(paste0("You entered: ", paste(ingredients, collapse = ", "),"\n"))
      message("Please wait while the recipes are loading...")
      recipes <- NewYorkTimesCooking::match_item(ingredients)
      recipes$tag <- stringr::str_replace_all(recipes$tag, pattern = ",", replacement = ", ")
      return(recipes)
    }
  }
}
