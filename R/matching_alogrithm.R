data <- read.csv("data/NYTrecipe.csv")

ingredient1 <- "broth"
ingredient2 <- "beef"
ingredient3 <- "spice"

match_item <- function(ingredient1, ingredient2, ingredient3) {
  #change ingredients to lowercase
  data_selection <- data |>
    dplyr::mutate(tolower(ingredients))

  ingredient1 <- tolower(ingredient1)
  ingredient2 <- tolower(ingredient2)
  ingredient3 <- tolower(ingredient3)

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
    dplyr::filter(input1 == TRUE & input2 == TRUE & input3 == TRUE) |> #select cases where input1 is TRUE, input2 is TRUE, and input3 is TRUE
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




