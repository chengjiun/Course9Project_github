library(shiny)

shinyUI(
  fluidPage( titlePanel("Example to use quantmod"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a stock to examine. Example: GOOG, SPY, ..."),
      textInput("symb", "Symbol", "SPY"),
    
      dateRangeInput("dates", "Date range", start = as.character(Sys.Date()-60), 
                     end = as.character(Sys.Date())),
      
      br(),
      selectInput("type", 
        label="Choose a type to plot", 
        choices = list("candlesticks"="candlesticks", "matchsticks"="matchsticks", "bars"="bars","line"="line"),
        selected = "line"),
      
      br(),
      selectInput("select", label = "Choose a technical indicator", 
                  choices = list("NONE" = "None", "Volume" = "Vol",
                                 "Moving Average" = "MAvg"), selected = "None"),
      sliderInput("pmvg", label="Period:", min = 5, max = 50, value = 10),
      br(),
      helpText('Note: there are only two indicators to choose: 
               volume and moving average. 
               If moving average is selected, the period need to be set 
               small than the range of date.')
    ),
    
    mainPanel(plotOutput("plot"))
  )
))