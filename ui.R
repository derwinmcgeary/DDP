library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Stuff to do in Town"),
  sidebarPanel(p("This app uses data from open.glasgow.gov.uk to display what public buildings are open in Glasgow and how long for."),
               h4("Documentation"),
               p("Choose a time and day by clicking below! The default is simply the current time. You can check which things are open latest, or what kind of facilities open at 7 in the morning, for example."),
               sliderInput('time','Choose a time', 
                           value=as.numeric(strftime(Sys.time(),"%H")), min=6,max=23,step=1),
               selectInput('day',"Choose a day",
                           list("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"), selected=weekdays(Sys.time()))
               ),
  mainPanel(h3("What's Open!"), textOutput('text1'),
            plotOutput("whatson")
    )
  )
  ) 