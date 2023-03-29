# library(rvest)
## Scrape from one specific page ----
url <- "https://cooking.nytimes.com/recipes/1018333-chicken-liver-pate"
page <- rvest::read_html(url)

get_recipe<-function(url){
  #store url's info into page
  page <- rvest::read_html(url)

  #scrape recipe title
  recipe_title <- page %>%
    rvest::html_nodes(".header_recipe-name__RS14R") %>%
    rvest::html_text()

  #scrape recipe serving number
  recipe_yield <- page %>%
    rvest::html_nodes(".ingredients_recipeYield__Ljm9O") %>%
    rvest::html_text()

  #scrape the recipe tags
  recipe_tags <- page %>%
    rvest::html_nodes(".tags_tagListItem__EAD5e .link_default__XRQhR") %>%
    rvest::html_text()
  recipe_tags <-paste0(recipe_ingredients, collapse = ",")

  #scrape recipe ingredients
  recipe_ingredients <- page %>%
    rvest::html_nodes(".ingredient_ingredient__lq70t span , .ingredientgroup_name__IZMKB") %>%
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
    rvest::html_node(".ratingssection_ratingsCount__q_DIQ") %>%
    rvest::html_text()

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
test_recipe = get_recipe("https://cooking.nytimes.com/recipes/1018333-chicken-liver-pate")


## Explore iteration ----
links<-c()
for (i in 1:10) {
  url <- paste0("https://cooking.nytimes.com/search?tags=easy&page=", i)
  page <- read_html(url)

  page_links <- page %>%
    html_nodes("a") %>%
    html_attr("href") %>%
    grep("/recipes/", ., value=TRUE)

  links <- c(links, page_links)
}
links <- links[1:3]
print(links)

for(link in links){
  recipes <- get_recipe(link)
  Sys.sleep(10)
}
