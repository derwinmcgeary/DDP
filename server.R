library(shiny)
library(ggplot2)

# most of the action happens in the file sourced below (I would have included it here, but 
# shinyapps.io was choking on it)
source("glasgowsopen.R")
shinyServer(
  function(input, output) {
        output$text1 <- renderText({paste("You selected ",input$day," at ", input$time, " o'clock")})
    output$whatson <- renderPlot({
      plotFacilities(getFacilities(input$time,input$day))
    }, height=exprToFunction(80+20*nrow(getFacilities(input$time,input$day))))
  }
)
