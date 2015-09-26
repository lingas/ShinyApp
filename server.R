
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  data = read.csv("activity.csv")
  steps_mean <- aggregate(data$steps, by=list(data$date), FUN=sum, na.rm=TRUE)
  
  names(steps_mean) = c("date", "total")
  
  output$distPlot <- renderPlot({

  bins <- seq(min(steps_mean$total), max(steps_mean$total), length.out = input$bins + 1)

  # draw the histogram with the specified number of bins
  hist(steps_mean$total, 
       main ="Total number of steps taken each day", 
       xlab ="Number of Steps", 
       ylab ="Frequency",
       breaks = bins, 
       border="white", 
       col="black", 
       lwd=3)
    
    

  })
  
  interval_mean = aggregate(data$steps,  by=list(data$interval), FUN=mean, na.rm=TRUE)
  
  names(interval_mean) = c("interval" , "mean")
  
  output$distPlot2 <- renderPlot({
          
          plot(interval_mean$interval, 
               interval_mean$mean, 
               type="l", 
               main='Average number of steps taken in each 5-minute interval',
               xlab ="5-minute Time Interval", 
               ylab ="Number of Steps",
               col=input$radio,
               lwd=3
          )
          
          
          
  })

})
