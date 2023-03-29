# library(rvest)
## scrape from one specific page ----
url <- "https://cooking.nytimes.com/recipes/1018333-chicken-liver-pate"
page <- rvest::read_html(url)

#scrape recipe title
recipe_title <- page %>%
  rvest::html_nodes(".header_recipe-name__RS14R") %>%
  rvest::html_text()

#scrape recipe ingredients
recipe_ingredients <- page %>%
  rvest::html_nodes(".ingredient_ingredient__lq70t span , .ingredientgroup_name__IZMKB, .ingredients_recipeYield__Ljm9O") %>%
  rvest::html_text()
recipe_ingredients <- paste0(recipe_ingredients, collapse = "\n")

#scrape recipe instructions
recipe_instructions<- page %>%
  rvest::html_nodes(".editorialtext_editorialText__TGWwj , .preparation_stepNumber__cPykF") %>%
  rvest::html_text()
recipe_instructions <- paste0(recipe_instructions, collapse = "\n")

#scrape recipe rating
recipe_rating <- page %>%
  rvest::html_nodes(".stats_avgRating__DmjGC") %>%
  rvest::html_text()

#scrape recipe preparation time
recipe_time <- page %>%
  rvest::html_node(".interfacecaptiontext_interfaceCaptionText__ymi7T:nth-child(2)") %>%
  rvest::html_text()

#scrape recipe comments number
recipe_comment_num <- page %>%
  rvest::html_node("span:nth-child(3)") %>%
  rvest::html_text()

recipes <- data.frame(
  title = recipe_title,
  ingredients = recipe_ingredients,
  rating = recipe_comment_num,
  time = recipe_time,
  instructions = recipe_instructions
)

## explore iteration
