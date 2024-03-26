library(shiny)
library(gh)

imgs <- list.files("C:/Users/madis/Documents/card-game/drinking-card-game/cards/", pattern=".png", full.names = TRUE)
imgs <- sample(imgs)

ui <- fluidPage(
  
  titlePanel("Card Game"),
  
  sidebarLayout(
    sidebarPanel(
      actionButton("previous", "Previous"),
      actionButton("next", "Next")
    ),
    
    mainPanel(
      imageOutput("image")
    )
  )
)

server <- function(input, output, session) {
  
  index <- reactiveVal(1)
  
  observeEvent(input[["previous"]], {
    index(max(index()-1, 1))
  })
  observeEvent(input[["next"]], {
    index(min(index()+1, length(imgs)))
  })
  
  output$image <- renderImage({
    x <- imgs[index()] 
    list(src = x, alt = "alternate text")
  }, deleteFile = FALSE)
}

# Run the application 
shinyApp(ui = ui, server = server)

