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
            textOutput("pred"),
            h4("Description: "),
            h4("This app uses the USArrests dataset in R. The app displays"),
            h4("a basic plot of Murder Rate per 100,000 vs "),
            h4("Assault Rate per 100,000. The user is able to "),
            h4("see the trendline on the graph, but can toggle the line"),
            h4("on or off. Additionally, the user can use the slider to"),
            h4("calculate a specific Murder Rate estimate given"),
            h4("a value on the slider for the Assault Rate."),
            h4("Thanks for taking the time to look at this.")
        )
    )
))
