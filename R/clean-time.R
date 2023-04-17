data <- read.csv("data/NYTrecipe.csv")

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
  else if (data_selection$time_hour[i] == TRUE & data_selection$time_minute[i] == TRUE) {
    split[i] = stringr::str_split(string = data_selection[i,15], pattern = "(?<=hours|hour)(?= \\d)\\s") #split the string at the space between number and hour
    hour[i] = stringr::str_split(string = split[[i]][1], pattern = "\\s")
    data_selection$num_hour[i] = hour[[i]][1] #replace i row, 1st column with first part of split string which is hour only
    minute[i] = stringr::str_split(string = split[[i]][2], pattern = "\\s") #split the string at the space between number and minute
    data_selection$num_minute[i] = minute[[i]][1] #replace i row, 1st column with first part of split string which is minute only
  }
}

#insert new column named time_minutes
data_selection <- data_selection |>
  dplyr::mutate(time_minutes = "")

#change variable from class(character) to (number)
data_selection$num_hour <- readr::parse_number(data_selection$num_hour)
data_selection$num_minute <- readr::parse_number(data_selection$num_minute)
data_selection$time_minutes <- readr::parse_number(data_selection$time_minutes)

data_selection$num_hour <- tidyr::replace_na(data_selection$num_hour, 0)
data_selection$num_minute <- tidyr::replace_na(data_selection$num_minute, 0)

data_selection$time_minute = data_selection$num_hour * 60 + data_selection$num_minute

data_selection$time_minute <- paste0(data_selection$time_minute, " minutes")

#change user_number from class(character) to (number)
data_selection$user_number <- readr::parse_number(data_selection$user_number)
