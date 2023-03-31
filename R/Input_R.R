# Ask for user input of three cooking ingredients
ingredient_1 <- readline(prompt = "Enter the first ingredient: ")
ingredient_2 <- readline(prompt = "Enter the second ingredient: ")
ingredient_3 <- readline(prompt = "Enter the third ingredient: ")

ingredients <- c(ingredient_1, ingredient_2, ingredient_3)

ingredients <- tolower(ingredients)

# Print out the entered ingredients
cat("You entered:", ingredient_1, ingredient_2, ingredient_3)

