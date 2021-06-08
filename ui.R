#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Predict Murder Rates Using Assault Rates"),
    
    # Sidebar with a slider input for x value to predict 
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderAssault",
                        "Assault Rate per 100,000:",
                        min = 45,
                        max = 340,
                        value = 170),
            checkboxInput("showModel", "Show/Hide Model", value = TRUE)
        ),
        
        
        # Show a plot with all of the calculated information
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted Murder Rate per 100,000: "),
            textOutput("pred")
        )
    )
))
