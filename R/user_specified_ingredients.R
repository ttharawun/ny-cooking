# Import recipes
recipes <- read.csv("data/NYTrecipe.csv")

# get_ingredients function for user input of as many ingredients as user wants
get_ingredients<-function(...){
  # store ingredient in a vector
  ingredients <- vector(mode = "character")
  # prompts user to choose whether or not to input ingredient by typing "Y"
  user_initiation <- readline(prompt = "Would you like to enter an ingredient? (Y/N) ")
  # initializing to first ingredient
  i = 1
  # if user inputs "Y", then ingredient can be inputted
  while (user_initiation == "Y") {
    # attempts are initialized to 0
    attempts <- 0
    # printing out "Enter ingredient i:" where i is the number of the ingredient in the ingredients vector
    ingredients[i] <- readline(prompt = paste0("Enter ingredient ", i, ": "))
    # checking if user input ingredient is found in recipes data set
    if (any(grepl(tolower(ingredients[i]), tolower(recipes$ingredients)))) {
      # print confirmation message if found
      cat("\n", ingredients[i], "was found in the list of ingredients.")
      # moving on to next ingredient by incrementing i by 1
      i = i + 1
      # prompting user to enter another ingredient through "Y" or "N"
      user_initiation <- readline(prompt = "Would you like to enter an ingredient? (Y/N) ")
    # ingredient was not found in data set
    } else {
      # lets user know that the ingredient cannot be found
      cat("\n", ingredients[i], "was NOT found in the list of ingredients.")
      # attempts is increased by 1 due to failed input
      attempts <- attempts + 1
      # user reaches three failed inputs
      if (attempts == 3) {
        # warning message and stops code due to three failed inputs
        warning("Exceeded maximum number of attempts. Please restart the program.")
        stop()
      # if user fails input but does not exceed three failed inputs, program asks user to input ingredient again
      } else {
        user_choice <- readline(prompt = "Would you like to input a new ingredient? (Y/N)")
        # if user inputs "Y", then program goes back to entering ingredients
        if (user_choice == "Y") {
          next
        # Error message and stop the code if the attempt is over 3 times
        } else {
          warning("Please restart the program and enter valid ingredients.")
          stop()
        }
      }
    }
  }

  # Convert ingredients to lowercase
  ingredients <- tolower(ingredients)

  # Print out the entered ingredients
  cat("\n", "You entered:", paste(ingredients, collapse = ", "))
  return(ingredients)
}
# testing
test <- get_ingredients()
test # will return a vector with the input ingredients
