
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
        
   tags$head(
        tags$style(HTML("
        @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
      
        h1 {
        font-family: 'Lobster', cursive;
        font-weight: 500;
        line-height: 1.1;
        color: #48ca3b;
      }

    "))
        ),        
  # Application title
  headerPanel("Activity Analysis"),

  # Sidebar with a slider input for number of bins
  fluidRow(
        
        column(4,
                sliderInput("bins",
                            "Number of bins:",
                            min = 5,
                            max = 50,
                            value = 25)
        ),
          
        column(8,
               tabsetPanel(
                       tabPanel("Plot",plotOutput("distPlot")),
                       tabPanel("Guide",
                        "
                        
                        The plot displays the mean number of steps taken each day. The slider on the left control the bin width of the histogram.
                        Recaluation of the is done on change of the bin width"
               )
        )
  ),
  
  fluidRow(
          
          column(4,
                 radioButtons("radio", label = h3("Select Graph Color"),
                              choices = list("Black" = "black", "Red" = "red","Orange" = "orange",
                                             "Cyan" = "cyan"),selected = "black")
          ),
          
          column(8,
                 tabsetPanel(
                         tabPanel("Plot",plotOutput("distPlot2")),
                         tabPanel("Guide",
                                  "
                        This example Shiny App extends the project done for Course 5 - Reproducible Research.
                        
                        The plot displays the average no of steps taken. The radio button on the left control the control the color of the graph."
                         )
                 )
          )
  )
  )
))
