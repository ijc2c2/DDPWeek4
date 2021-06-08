#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    model <- lm(Murder ~ Assault, data = USArrests)
    pred <- reactive({
        assaultInput <- input$sliderAssault
        predict(model, newdata = data.frame(Assault = assaultInput))
    })
    
    output$plot1 <- renderPlot({
        assaultInput <- input$sliderAssault
        plot(USArrests$Assault, USArrests$Murder, xlab = "Assaults per 100,000",
             ylab = "Murders per 100,000", xlim = c(0, 350), ylim = c(0, 20))
        if(input$showModel){
            abline(model, col = "red", lwd = 2)
        }
        points(assaultInput, pred(), col = "red", pch = 16, cex = 2)
    })
    output$pred <- renderText({
        pred()
    })
})

