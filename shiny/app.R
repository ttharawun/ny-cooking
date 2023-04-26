library(shiny)
library(tidyverse)

ui <- fluidPage(

  # App title ----
  titlePanel("New York Times Cooking Recipes"),

  # Sidebar panel for inputs ----
  sidebarPanel(
    # ingredients input
    textInput("ingredients", "Please enter ingredients (seperate each using comma)"),
  ),

  # Main panel for displaying outputs ----
  mainPanel(
    # Output: list of ingredients
    verbatimTextOutput("ingredients"),
    # Output: Table for the recipe dataset ----
    tableOutput("table")
  )
)

server <- function(input, output, session){
  output$ingredients <- renderText({
    ingredients <- tolower(input$ingredients)
    # Print out the entered ingredients
    cat("You entered:", paste(ingredients, collapse = ", "),"\n")
    cat("Please wait while the recipes are loading...")
    return(ingredients)
    })

  output$table <- renderTable({
    # call matching algorithm to get output
    recipes <- NewYorkTimesCooking::match_item(ingredients)
    return(recipes)
  })
}


shinyApp(ui = ui, server = server)
