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
  data_selection$ingredient1 <- stringr::str_detect(data$ingredients, ingredient1) #use str_detect to see if the input matches with ingredient list, if does return TRUE
  data_selection$ingredient2 <- stringr::str_detect(data$ingredients, ingredient2)
  data_selection$ingredient3 <- stringr::str_detect(data$ingredients, ingredient3)

  #create dummy vector
  rating <- c()
  time <- c()

  for (i in 1:nrow(data_selection)) {
    rating[i] = stringr::str_split(string = data_selection[i,5], pattern = "(?<=\\d)\\s") #split the string at the space between numbers and user
    data_selection$user_number[i] = rating[[i]][1] #replace i row, 1st column with first part of split string which is date only
  }

  data_selection$additional_time <- stringr::str_detect(data_selection$time, "plus")

  data_selection <- data_selection |>
    dplyr::mutate(time_only = "") |>
    dplyr::mutate(time_note = "")

  for (i in 1:nrow(data_selection)) {
    if(data_selection$additional_time[i] == TRUE) {
      time[i] = stringr::str_split(string = data_selection[i,6], pattern = "(?= plus)\\s") #split the string at the space between comma and plus
      data_selection[i, 15] = time[[i]][1] #replace i row, 1st column with first part of split string which is date only
      data_selection[i, 16] = time[[i]][2] #replace i row, 1st column with second part of split string which is notes only
    }
    else{
      data_selection[i, 15] = data_selection$time[i]
    }
  }

  data_selection[, 15] <- stringr::str_remove(data_selection[, 15], ",")
  data_selection[, 15] <- stringr::str_remove(data_selection[, 15], "About ")

  data_selection$time_only <- stringr::str_replace_all(data_selection$time_only, "¼", ".25")
  data_selection$time_only <- stringr::str_replace_all(data_selection$time_only, "½", ".50")
  data_selection$time_only <- stringr::str_replace_all(data_selection$time_only, "¾", ".75")
  data_selection$time_hour <- stringr::str_detect(data_selection$time_only, "hour")
  data_selection$time_minute <- stringr::str_detect(data_selection$time_only, "minute")

  data_selection <- data_selection |>
    dplyr::mutate(num_hour = "") |>
    dplyr::mutate(num_minute = "")

  #create dummy vector
  hour <- c()
  minute <- c()
  split <- c()

  for (i in 1:nrow(data_selection)) {
    if(data_selection$time_hour[i] == TRUE & data_selection$time_minute[i] == FALSE) {
      hour[i] = stringr::str_split(string = data_selection[i,15], pattern = "\\s") #split the string at the space between number and hour
      data_selection$num_hour[i] = hour[[i]][1] #replace i row, 1st column with first part of split string which is hour only
    }
    else if (data_selection$time_hour[i] == FALSE & data_selection$time_minute[i] == TRUE) {
      minute[i] = stringr::str_split(string = data_selection[i,15], pattern = "\\s") #split the string at the space between number and minute
      data_selection$num_minute[i] = minute[[i]][1] #replace i row, 1st column with first part of split string which is minute only
    }
    #else if (data_selection$time_hour[i] == TRUE & data_selection$time_minute[i] == TRUE) {
      #split[i] = stringr::str_split(string = data_selection[i,15], pattern = "(?<=hours|hour)(?=\\d)\\s") #split the string at the space between number and hour
      #hour[i] = stringr::str_split(string = split[[i]][1], pattern = "\\s")
      #data_selection$num_hour[i] = hour[[i]][1] #replace i row, 1st column with first part of split string which is hour only
      #minute[i] = stringr::str_split(string = split[[i]][2], pattern = "\\s") #split the string at the space between number and minute
      #data_selection$num_minute[i] = minute[[i]][1] #replace i row, 1st column with first part of split string which is minute only
    #}
  }


  #insert new column named time_minutes and time_notes
  data_selection <- data_selection |>
    dplyr::mutate(time_minutes = "") |>
    dplyr::mutate(time_notes = "")




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




