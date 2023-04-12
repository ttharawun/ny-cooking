data <- NewYorkTimesCooking::NYTrecipe

ingredient1 <- "salt"
ingredient2 <- "beef"
ingredient3 <- "spice"


match_item <- function(...) {
  list(...)

  #change ingredients to lowercase
  data_selection <- data |>
    dplyr::mutate(tolower(ingredients))

  ingredient1 <- tolower(ingredient1)
  ingredient2 <- tolower(ingredient2)
  ingredient3 <- tolower(ingredient3)

  #try to catch typo in the input ingredient


  #match user input ingredients with ingredients
  ingredient1 <- stringr::str_detect(data$ingredients, ingredient1) #use str_detect to see if the input matches with ingredient list, if does return TRUE
  ingredient2 <- stringr::str_detect(data$ingredients, ingredient2)
  ingredient3 <- stringr::str_detect(data$ingredients, ingredient3)

  #mutate results from str_detect to dataframe
  data_selection <- data |>
    dplyr::mutate(ingredient1 = ingredient1) |>
    dplyr::mutate(ingredient2 = ingredient2) |>
    dplyr::mutate(ingredient3 = ingredient3)

  #create dummy vector
  rating <- c()

  #insert new column named user_number
  data_selection <- data_selection |>
    dplyr::mutate(user_number = "")

  for (i in 1:nrow(data_selection)) {
    rating[i] = stringr::str_split(string = data_selection[i,5], pattern = "(?<=\\d)\\s") #split the string at the space between numbers and user
    data_selection[i,12]= rating[[i]][1] #replace i row, 1st column with first part of split string which is date only
  }

  #change user_number from class(character) to (number)
  data_selection$user_number <- readr::parse_number(data_selection$user_number)

  all_results <- data_selection |>
    dplyr::filter(ingredient1 == TRUE & ingredient2 == TRUE & ingredient3 == TRUE) |> #select cases where input1 is TRUE, input2 is TRUE, and input3 is TRUE
    dplyr::arrange(desc(user_number)) #sort in descending order

  #select only necessary columns
  results <- all_results |>
    dplyr::select(title, tag, serving, ingredients, rating, time, instructions, link)

  #select top 10 results
  results <- head(results, 10)

  return(results)
}

#test
match <- match_item(ingredient1, ingredient2, ingredient3)
match

get_ingredients<-function(...){
  #import recipes
  recipes <- NewYorkTimesCooking::NYTrecipe

  #create ingredients vector
  ingredients <- vector(mode = "character", length = 3)

  for (i in 1:3) {
    attempts <- 0

    repeat {
      ingredients[i] <- readline(prompt = paste0("Enter ingredient ", i, ": "))
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
        else {
          user_choice <- readline(prompt = "Would you like to input a new ingredient? (Y/N)")
          if (user_choice == "Y") {
            next
          }

          else {
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

  do.call(matching_algorithms(...))

}


