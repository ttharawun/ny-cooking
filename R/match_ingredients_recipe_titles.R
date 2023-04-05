# Test ----
library(readr)
# test dataset
NYT_recipes2 <- read_csv("~/Desktop/Spring 2023/SDS 270/NYT_Recipe_scrapy-master/NYT_recipes2.csv")

# test ingredients
ingredients <- c("pork", "salt", "rice")

# match ingredients within the ingredient name column
conditions = Reduce(`&`, lapply(ingredients, grepl, x = NYT_recipes2$ingredient_name))

# return all recipes titles with matched conditions
NYT_recipes2$recipe_title[conditions]

# Function ----
# function to return all recipe titles with matched ingredients
matched_recipe_title_with_ingredients <- function(ingredients){

  conditions = Reduce(`&`, lapply(ingredients, grepl, x = NYT_recipes2$ingredient_name))

  return(NYT_recipes2$recipe_title[conditions])

}
