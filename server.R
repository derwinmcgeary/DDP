library(shiny)
library(ggplot2)

source("glasgowsopen.R")
data(galton)
shinyServer(
  function(input, output) {
        output$text1 <- renderText({paste("You selected ",input$day," at ", input$time, " o'clock")})
    output$whatson <- renderPlot({
      plotFacilities(getFacilities(input$time,input$day))
    }, height=exprToFunction(80+20*nrow(getFacilities(input$time,input$day))))
  }
)
