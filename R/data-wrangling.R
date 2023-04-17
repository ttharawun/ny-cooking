#create dummy vector
rating <- c()
time <- c()
for (i in 1:nrow(data)) {
  rating[i] = stringr::str_split(string = data[i,5], pattern = "(?<=\\d)\\s") #split the string at the space between numbers and user
  data$user_number[i] = rating[[i]][1] #replace i row, 1st column with first part of split string which is date only
}
data$additional_time <- stringr::str_detect(data$time, "plus")
data <- data |>
  dplyr::mutate(time_only = "") |>
  dplyr::mutate(time_note = "")
for (i in 1:nrow(data)) {
  if(data$additional_time[i] == TRUE) {
    time[i] = stringr::str_split(string = data[i,6], pattern = "(?= plus)\\s") #split the string at the space between comma and plus
    data[i, 11] = time[[i]][1] #replace i row, 1st column with first part of split string which is date only
    data[i, 12] = time[[i]][2] #replace i row, 1st column with second part of split string which is notes only
  }
  else{
    data[i, 11] = data$time[i]
  }
}
data[, 11] <- stringr::str_remove(data[, 11], ",")
data[, 11] <- stringr::str_remove(data[, 11], "About ")
data$time_only <- stringr::str_replace_all(data$time_only, "¼", ".25")
data$time_only <- stringr::str_replace_all(data$time_only, "½", ".50")
data$time_only <- stringr::str_replace_all(data$time_only, "¾", ".75")
data$time_hour <- stringr::str_detect(data$time_only, "hour")
data$time_minute <- stringr::str_detect(data$time_only, "minute")
data <- data |>
  dplyr::mutate(num_hour = "") |>
  dplyr::mutate(num_minute = "")
#create dummy vector
hour <- c()
minute <- c()
split <- c()
for (i in 1:nrow(data)) {
  if(data$time_hour[i] == TRUE & data$time_minute[i] == FALSE) {
    hour[i] = stringr::str_split(string = data[i,11], pattern = "\\s") #split the string at the space between number and hour
    data$num_hour[i] = hour[[i]][1] #replace i row, 1st column with first part of split string which is hour only
  }
  else if (data$time_hour[i] == FALSE & data$time_minute[i] == TRUE) {
    minute[i] = stringr::str_split(string = data[i,11], pattern = "\\s") #split the string at the space between number and minute
    data$num_minute[i] = minute[[i]][1] #replace i row, 1st column with first part of split string which is minute only
  }
  else if (data$time_hour[i] == TRUE & data$time_minute[i] == TRUE) {
    split[i] = stringr::str_split(string = data[i,11], pattern = "(?<=hours|hour)(?= \\d)\\s") #split the string at the space between number and hour
    hour[i] = stringr::str_split(string = split[[i]][1], pattern = "\\s")
    data$num_hour[i] = hour[[i]][1] #replace i row, 1st column with first part of split string which is hour only
    minute[i] = stringr::str_split(string = split[[i]][2], pattern = "\\s") #split the string at the space between number and minute
    data$num_minute[i] = minute[[i]][1] #replace i row, 1st column with first part of split string which is minute only
  }
}
#insert new column named time_minutes
data <- data |>
  dplyr::mutate(time_minutes = "")
#change variable from class(character) to (number)
data$num_hour <- readr::parse_number(data$num_hour)
data$num_minute <- readr::parse_number(data$num_minute)
data$time_minutes <- readr::parse_number(data$time_minutes)
data$num_hour <- tidyr::replace_na(data$num_hour, 0)
data$num_minute <- tidyr::replace_na(data$num_minute, 0)
data$time_minute = data$num_hour * 60 + data$num_minute
data$time_minute <- paste0(data$time_minute, " minutes")
#change user_number from class(character) to (number)
data$user_number <- readr::parse_number(data$user_number)
data <- data |>
  dplyr::select(1:9,14)

