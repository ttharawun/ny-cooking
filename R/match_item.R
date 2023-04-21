#' match user input items with ingredients from recipes
#'
#' @param ... because the function directly asks for user input, the argument is not necessary, but it can be a vector of character that contains ingredient names
#'
#' @return 10 recipes based on the ingredient import
#' @export
#'
#' @examples test<-match_item("apple","egg","sugar","vanilla")
#' test2 <- match_item()
match_item <- function(...) {
  # Convert all input ingredients to lowercase
  input_ingredients <- tolower(unlist(list(...)))

  # Change ingredients in data to lowercase
  data_selection <- NYTrecipe |>
    dplyr::mutate(ingredients = tolower(ingredients))

  # Use str_detect to check if input matches ingredients
  for (ingredient in input_ingredients) {
    data_selection <- data_selection|>
      dplyr::mutate(!!ingredient := stringr::str_detect(ingredients, ingredient))
  }

  # Create dummy vector for rating
  rating <- vector("character", nrow(data_selection))

  # Split rating into user_number and date
  for (i in 1:nrow(data_selection)) {
    rating[i] <- stringr::str_split(data_selection[i, "rating"], pattern = "(?<=\\d)\\s")[[1]][1]
    data_selection[i, "user_number"] <- readr::parse_number(rating[i])
  }

  # Filter by input ingredients and arrange by user_number
  results <- data_selection |>
    dplyr::filter_at(dplyr::vars(input_ingredients), dplyr::all_vars(.)) |>
    dplyr::arrange(desc(user_number)) |>
    dplyr::select(title, tag, serving, ingredients, rating, time, instructions, link) |>
    head(10)

  return(results)
}



