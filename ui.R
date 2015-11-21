library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Stuff to do in Town"),
  sidebarPanel(sliderInput('time','Choose a time', value=as.numeric(strftime(Sys.time(),"%H")), min=6,max=23,step=1),
               selectInput('day',"Choose a day",
                           list("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"), selected=weekdays(Sys.time()))
               ),
  mainPanel(h3("What's Open!"), textOutput('text1'),
            plotOutput("whatson")
    )
  )
  ) 