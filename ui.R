library(shiny)
library(ggplot2)

# Binomial distribution with normal approximation

shinyUI(pageWithSidebar(
        
        headerPanel("Binomial Distribution with Normal Approximation"),
        
        # Input n, p
        sidebarPanel(
                helpText("This program will plot a binomial distribution density function B(n, p)", 
                         "The approximated normail distribution function N(np, np(1-p)) is plotted ",
                         "as a comparison. The user can interactively adjust n, p and observe when ", 
                         "normal distribution is a good approximation."),
                
                sliderInput('n', 'n', min = 1, max = 50,
                            value = 6, step=1),
                sliderInput('p', 'p', min = 0.01, max = 0.99,
                            value = 0.5, step=0.01)
                
        ),
        
        # Output Density Function plot 
        mainPanel(
                plotOutput('plot'),    
                h4('mean of normal approximation'),
                verbatimTextOutput('mean'),
                h4('standard deviation of normal approximation'),
                verbatimTextOutput('sd')
        )
))