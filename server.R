library(shiny)
library(ggplot2)

# Plot normal approximation of binomial distribution

shinyServer(function(input, output) {        
              
        output$plot <- renderPlot( {
                n <- input$n
                p <- input$p   
               mean <- n * p
               sd <- sqrt(n * p * (1 - p))
               
               x <- seq(0, n, by=1)
               x2 <- seq(0, n, by = 0.01)
               y <- dbinom(x, n, p)               
               z <- dnorm(x2, mean, sd)
               plot(x2, z, type = "l", col = "green", lwd = 5, main = "Normal Approximation of Bionomial Distribution")
               lines(x, y, type = "h",  col = "red", lwd = 5)    
               legend("topright", c("Normal Approximation", "Binomial Distribution"),
               lty=c(1,1), lwd=c(5, 5), col=c("green","red")) 
                     
       })      
       
       output$mean <- renderText({input$n * input$p})
       output$sd <- renderText({sqrt(input$n * input$p * (1- input$p))})
       
       
})