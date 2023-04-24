#' New York Times recipes data
#'
#' A dataset containing recipes of over 9,000 recipes from the New York Times Cooking website.
#'
#' @format A data frame with 9,099 rows and 9 columns:
#' \describe{
#'   \item{recipe_id}{recipe id}
#'   \item{title}{recipe title}
#'   \item{tag}{recipe tags}
#'   \item{serving}{number of people that the recipe portion serves}
#'   \item{ingredients}{recipe ingredient details}
#'   \item{rating}{number of user ratings the recipe received on NYTCooking}
#'   \item{time}{cooking time for the recipe (in hours and minutes with notes)}
#'   \item{instructions}{instruction steps for the recipe}
#'   \item{link}{link to the web version of the recipe (requires NYT subscription to access)}
#'   \item{user_number}{number only of user ratings the recipe received on NYTCooking}
#'   \item{time_minute}{cooking time for the recipe (in minutes, does not incldue any notes)}
#' }
#' @source <https://cooking.nytimes.com/search>
"NYTrecipe"