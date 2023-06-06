#' New York Times recipes data
#'
#' A dataset containing recipes of over 9,000 recipes from the New York Times Cooking website.
#'
#' @format A data frame with 9,105 rows and 9 columns:
#' \describe{
#'   \item{title}{recipe title}
#'   \item{tag}{recipe tags}
#'   \item{serving}{number of people that the recipe portion serves}
#'   \item{ingredients}{recipe ingredient details}
#'   \item{rating}{ratings the recipe received on NYTCooking}
#'   \item{comment}{number of user comments the recipe received on NYTCooking}
#'   \item{time}{cooking time for the recipe (in hours and minutes with notes)}
#'   \item{instructions}{instruction steps for the recipe}
#'   \item{link}{link to the web version of the recipe (requires NYT subscription to access)}
#' }
#' @source <https://cooking.nytimes.com/search>
"NYTrecipe"
