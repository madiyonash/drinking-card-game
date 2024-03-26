#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

cards <- tibble::tribble(
  ~cardname, ~carddesc, 
  "card1", "turn ons",
  "card2", "rule master",
  "card3", "chug",
)


# Define UI for application clicks through photos
ui <- fluidPage(
  imageOutput("photo")
)


# Define server logic required to draw a histogram
server <- function(input, output, session) {
  output$photo <- renderImage({
    list(
      src = file.path("cards", paste0(input$id, ".png")),
      contentType = "image/png",
      width = 500,
      height = 650
    )
  }, deleteFile = FALSE)
  
  output$source <- renderUI({
    info <- cards[cards$cardname == input$cardname, , drop = FALSE]
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
