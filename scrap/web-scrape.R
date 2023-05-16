#use get_recipe to scrape from NYT Cooking main page ----
url <- "https://cooking.nytimes.com/search"
page <- rvest::read_html(url)

#scrape recipe link
partial_page_links <- page |>
  rvest::html_nodes("li div.recipecard_recipeCard__eY6sC article.atoms_card__sPaoj a.link_link__ov7e4") |>
  rvest::html_attr('href')

#scrape number of pages
page_number <- page |>
  rvest::html_nodes("div.pagination_pagesGroup__RP_r1:nth-child(2) span.button_buttonText__T28x2") |>
  rvest::html_attr('href')

#create vector of possible columns
columns = c("title", "tag", "serving", "ingredients", "rating", "time", "instructions", "link")

#create dummy vector
partial_page_links <- c()

tryCatch({
  for(i in 1:209) #iteration for every page with recipes
  {
    url <- paste0("https://cooking.nytimes.com/search?page=",i) #get full url to search each page
    page <- rvest::read_html(url) #input the url as html

    #scrape recipe link
    page_links <- page |>
      rvest::html_nodes("li div.recipecard_recipeCard__eY6sC article.atoms_card__sPaoj a.link_link__ov7e4") |>
      rvest::html_attr('href')
    Sys.sleep(10) #pause between each scraping

    #save into vector
    partial_page_links <- c(partial_page_links, page_links)
  }
},
error = function(e){ #if an error occurred print warning statement
  warnings(paste0("There is an error for item", i, ":\n")) #warning message
}
)

#turn scraped partial links into working links
links <- paste0("https://cooking.nytimes.com", partial_page_links)

#scrape details of the recipe for each link
tryCatch({
  for(i in 1:9099){ #iteration for each link
    link <- links[i]
    recipes[link, columns] <- get_recipe(link) #use get_recipe function to get the details
    Sys.sleep(10) #pause between each scraping
    print(link) #print each link
    length_link <- length(link)
  }
  if (link == "" | is.null(link) | length(length_link) == 0) {
    print("There is no link for positon ", i)
    next
  }
},
error = function(e){ #if an error occurred print warning statement
  warnings(paste0("There is an error for this link: ", link, " at position ", i, ":\n")) #warning message
}
)

#change row names
rownames(recipes) <- 1:length(links)

#export results as csv
write.csv(recipes, file = "./data/recipes.csv", row.names = FALSE)
