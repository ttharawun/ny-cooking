# create dataframe to save results
# recipes <- data.frame()

#function to scrape the details of each recipe
#' Title
#'
#' @param url
#'
#' @return a dataframe that contains necessary information scraped from NYT cooking website
#' @export
#'
#' @examples
get_recipe<-function(url){
      #store urls info into page
      page <- rvest::read_html(url)

      #scrape recipe title
      recipe_title <- page |>
        rvest::html_nodes(".header_recipe-name__RS14R") |>
        rvest::html_text()
      recipe_title_length <- length(recipe_title)
      if (is.null(recipe_title) | recipe_title_length == 0){
        recipe_title <- NA
      }

      #scrape the recipe tags
      recipe_tags <- page |>
        rvest::html_nodes(".tags_tagListItem__EAD5e .link_default__XRQhR") |>
        rvest::html_text()
      recipe_tags <-paste0(recipe_tags, collapse = ",")
      recipe_tags_length <- length(recipe_tags)
      if (is.null(recipe_tags) | recipe_tags_length == 0){
        recipe_tags <- NA
      }

      #scrape recipe serving number
      recipe_yield <- page |>
        rvest::html_nodes(".ingredients_recipeYield__Ljm9O") |>
        rvest::html_text()
      recipe_yield_length <- length(recipe_yield)
      if (is.null(recipe_yield) | recipe_yield_length == 0){
        recipe_yield <- NA
      }

      #scrape recipe ingredients
      recipe_ingredients <- page |>
        rvest::html_nodes(".ingredient_ingredient__lq70t span , .ingredientgroup_name__IZMKB") |>
        rvest::html_text()
      recipe_ingredients <- paste0(recipe_ingredients, collapse = "\n")
      recipe_ingredients_length <- length(recipe_ingredients)
      if (is.null(recipe_ingredients) | recipe_ingredients_length == 0){
        recipe_ingredients <- NA
      }

      #scrape recipe instructions
      recipe_instructions<- page |>
        rvest::html_nodes(".editorialtext_editorialText__TGWwj , .preparation_stepNumber__cPykF") |>
        rvest::html_text()
      recipe_instructions <- paste0(recipe_instructions, collapse = "\n")
      recipe_instructions_length <- length(recipe_instructions)
      if (is.null(recipe_instructions) | recipe_instructions_length == 0){
        recipe_instructions <- NA
      }

      #scrape recipe rating
      recipe_rating <- page |>
        rvest::html_nodes(".stats_avgRating__DmjGC") |>
        rvest::html_text()
      recipe_rating_length <- length(recipe_rating)
      if (is.null(recipe_rating) | recipe_rating_length == 0){
        recipe_rating <- NA
      }

      #scrape recipe preparation time
      recipe_time <- page |>
        rvest::html_node(".interfacecaptiontext_interfaceCaptionText__ymi7T:nth-child(2)") |>
        rvest::html_text()
      recipe_time_length <- length(recipe_time)
      if (is.null(recipe_time) | recipe_time_length == 0){
        recipe_time <- NA
      }

      #scrape recipe comments number
      recipe_comment_num <- page |>
        rvest::html_node(".ratingssection_ratingsCount__q_DIQ") |>
        rvest::html_text()
      recipe_comment_num_length <- length(recipe_comment_num)
      if (is.null(recipe_comment_num) | recipe_comment_num_length == 0){
        recipe_comment_num <- NA
      }

      #combine all previous info to a dataframe
      recipes <- data.frame(
        title = recipe_title,
        tag = recipe_tags,
        serving = recipe_yield,
        ingredients = recipe_ingredients,
        rating = recipe_comment_num,
        time = recipe_time,
        instructions = recipe_instructions,
        link = url
      )
    #return recipes as output
    return(recipes)
}
