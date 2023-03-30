library(rvest) #load rvest

#create dataframe to save results
recipes <- data.frame()

#function to scrape the details of each recipe
get_recipe<-function(url){
  #store urls info into page
  page <- rvest::read_html(url)

  #scrape recipe title
  recipe_title <- page |>
    rvest::html_nodes(".header_recipe-name__RS14R") |>
    rvest::html_text()

  #scrape the recipe tags
  recipe_tags <- page |>
    rvest::html_nodes(".tags_tagListItem__EAD5e .link_default__XRQhR") |>
    rvest::html_text()
  recipe_tags <-paste0(recipe_tags, collapse = ",")

  #scrape recipe serving number
  recipe_yield <- page |>
    rvest::html_nodes(".ingredients_recipeYield__Ljm9O") |>
    rvest::html_text()

  #scrape recipe ingredients
  recipe_ingredients <- page |>
    rvest::html_nodes(".ingredient_ingredient__lq70t span , .ingredientgroup_name__IZMKB") |>
    rvest::html_text()
  recipe_ingredients <- paste0(recipe_ingredients, collapse = "\n")

  #scrape recipe instructions
  recipe_instructions<- page |>
    rvest::html_nodes(".editorialtext_editorialText__TGWwj , .preparation_stepNumber__cPykF") |>
    rvest::html_text()
  recipe_instructions <- paste0(recipe_instructions, collapse = "\n")

  #scrape recipe rating
  recipe_rating <- page |>
    rvest::html_nodes(".stats_avgRating__DmjGC") |>
    rvest::html_text()

  #scrape recipe preparation time
  recipe_time <- page |>
    rvest::html_node(".interfacecaptiontext_interfaceCaptionText__ymi7T:nth-child(2)") |>
    rvest::html_text()

  #scrape recipe comments number
  recipe_comment_num <- page |>
    rvest::html_node(".ratingssection_ratingsCount__q_DIQ") |>
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

#scrape from NYT Cooking main page ----
url <- "https://cooking.nytimes.com/search"
page <- read_html(url)

#scrape recipe link
partial_page_links <- page |>
  html_nodes("li div.recipecard_recipeCard__eY6sC article.atoms_card__sPaoj a.link_link__ov7e4") |>
  html_attr('href')

#create vector of possible columns
columns = c("title", "tag", "serving", "ingredients", "rating", "time", "instructions", "link")

#create dummy vector
partial_page_links <- c()

#iteration for every page with recipes
for(i in 1:209){
  url <- paste0("https://cooking.nytimes.com/search?page=",i)
  page <- read_html(url)

  #scrape recipe link
  page_links <- page |>
    html_nodes("li div.recipecard_recipeCard__eY6sC article.atoms_card__sPaoj a.link_link__ov7e4") |>
    html_attr('href')
  Sys.sleep(10)

  #save into vector
  partial_page_links <- c(partial_page_links, page_links)
}

#turn scraped partial links into working links
links <- paste0("https://cooking.nytimes.com", partial_page_links)

#scrape details of the recipe for each link
for(link in links){
  recipes[link, columns] <- get_recipe(link) #use get_recipe function to get the details
  Sys.sleep(10)
  print(link)
}

#change row names
rownames(recipes) <- 1:length(links)

#export results as csv
write.csv(recipes, file = "./data/recipes.csv", row.names = FALSE)
