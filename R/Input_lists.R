
# Import recipes
 recipes <- NewYorkTimesCooking::NYTrecipe


# Ask for user input of three cooking ingredients
# Error message and stop the code if the attempt is over 3 times
get_ingredients <- function(...){
  ingredients <- vector(mode = "character")
  user_initiation <- readline(prompt = "Would you like to enter an ingredient? (Y to continue or enter anything else to leave)")
  i = 1
  while (user_initiation == "Y") {
    attempts <- 0
    ingredients[i] <- readline(prompt = paste0("Enter ingredient ", i, ": "))
    if (any(grepl(tolower(ingredients[i]), tolower(recipes$ingredients)))) {
      cat("\n", ingredients[i], "was found in the list of ingredients.")
      i = i + 1
      user_initiation <- readline(prompt = "Would you like to enter an ingredient? (Y to continue or enter anything else to leave) ")


        user_choice <- readline(prompt = "Would you like to input a new ingredient? (Y to continue or enter anything else to leave)")

  }
}

# Convert ingredients to lowercase
ingredients <- tolower(ingredients)

# Print out the entered ingredients
cat("You entered:", paste(ingredients, collapse = ", "))





