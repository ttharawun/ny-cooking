
# Import recipes
NYT_recipes <- read.csv("R/NYT_recipes2.csv")

# Ask for user input of three cooking ingredients
ingredient_1 <- readline(prompt = "Enter the first ingredient: ")
ingredient_2 <- readline(prompt = "Enter the second ingredient: ")
ingredient_3 <- readline(prompt = "Enter the third ingredient: ")

ingredients <- c(ingredient_1, ingredient_2, ingredient_3)

ingredients <- tolower(ingredients)

# Print out the entered ingredients
cat("You entered:", ingredient_1, ingredient_2, ingredient_3)


for (ingredient in ingredients) {
  i = i + 1
  if (ingredient %in% example_ingredient_list) {
    cat("\n", ingredient, "was found in list of ingredients.") }
  else {
    cat("\n", ingredient, "was NOT found in list of ingredients.")
    user_choice <- readline(prompt = "An ingredient you entered was not found in the list of ingredients.\nWould you like to input a new ingredient? (Y/N)")
    if (user_choice == "Y") {
      ingredients[i] <- readline(prompt = "Enter the new ingredient.")
      }
    }
}


