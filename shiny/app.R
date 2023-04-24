library(shiny)
library(tidyverse)

ui <- fluidPage(

  # App title ----
  titlePanel("New York Times Cooking Recipes"),

  # Sidebar panel for inputs ----
  sidebarPanel(
    # Select the county
    selectInput("County", label = "County",
                choices = c("Barnstable", "Berkshire", "Bristol", "Dukes", "Essex", "Franklin",
                            "Hampden", "Hampshire", "Middlesex", "Worcester", "Suffolk", "Norfolk",
                            "Plymouth", "Nantucket"),
                selected = NULL, multiple = FALSE)
  ),

  # Main panel for displaying outputs ----
  mainPanel(
    # Output: Formatted text for caption ----
    h3(textOutput("caption")),

    # Output: Plot of the requested data for price against time ----
    plotOutput("PricePlot"),

    # Output: Table for the datset ----
    tableOutput("Housing_data")
  )
)
