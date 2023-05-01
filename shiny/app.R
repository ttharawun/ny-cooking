library(shiny)
library(tidyverse)
library(shinybusy)
library(DT)

css <- "
.wrap {
  white-space: wrap;
  overflow: scroll;
  }
table {
  width: 300%;
  overflow-x: scroll;
}
td:nth-child(3) {
  column-width: 10ch;
}
"

ui <- fluidPage(

  tags$head(
    tags$style(HTML(css))
  ),

  headerPanel("New York Times Cooking Recipes"),

  mainPanel(

    # input field
    textInput("input", label = "Please enter ingredients (seperate each using comma)"),

    # submit button
    actionButton("submit", label = "Submit"),

    # Somewhere in UI
    add_busy_gif(src = "https://jeroen.github.io/images/banana.gif", height = 70, width = 70),

    # display text output
    textOutput("text"),

    #display table output
    DTOutput("table", width = "150%")
  )
)

server <- function(input, output) {

  # reactive expression
  text_reactive <- eventReactive(input$submit, {
    input$input
  })

  # text output
  output$text <- renderText({
    text_reactive()
  })

  # call matching algorithm to get output
  output$table <- renderDT({
    ingredients <- stringr::str_split(string = text_reactive(), pattern = ",")
    ingredients <- unlist(ingredients)
    ingredients <- tolower(ingredients)
    recipes <- NewYorkTimesCooking::match_item(ingredients)
    recipes$tag <- stringr::str_replace_all(recipes$tag, pattern = ",", replacement = ", ")
    column_defs <- list(
      list(className = "wrap", targets = "_all"),
      list(targets = c("link"),
           render = JS("function(data, type, row, meta) {
              return '<a href=\"'+ data +'\" target=\"_blank\">'+ row[8] +'</a>';
            }"))
    )
    datatable(recipes,
              options = list(
                columnDefs = column_defs
              ))
  })
}

shinyApp(ui = ui, server = server)
