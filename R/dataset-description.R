#' @title New York Times recipes data
#'
#' @description A dataset containing recipes of over 9,000 recipes from the New York Times Cooking website.
#' The variables are as follows:
#'
#' @format A data frame with 9,099 rows and 9 columns:
#' \describe{
#'   \item{title}{recipe title}
#'   \item{tags}{recipe tags}
#'   \item{serving}{number of people that the recipe portion serves}
#'   \item{ingredients}{recipe ingredient details}
#'   \item{rating}{number of user ratings the recipe received on NYTCooking}
#'   \item{time}{cooking time for the recipe (in hours and minutes with notes)}
#'   \item{instructions}{instruction steps for the recipe}
#'   \item{link}{link to the web version of the recipe (requires NYT subscription to access)}
#'   \item{time_minute}{cooking time for the recipe (in minutes, does not incldue any notes)}
#'   ...
#' }
#'
#' @eval c("@format", get_table_metadata("./data-raw/NYTrecipe_update.csv"))
#'
#' @source <https://cooking.nytimes.com/search>
"NYTrecipe"
