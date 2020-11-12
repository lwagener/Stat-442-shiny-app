#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#Libraries
library(shiny)
library(tidyverse)
#UI set up
ui <- fluidPage(
    #Title
    titlePanel("Diamonds!"),
    #Sidebar set up
    sidebarLayout(
        sidebarPanel(
            #Variable choices
            selectInput("p","p",choices = colnames(diamonds[2:4])),
            #Color choices
            selectInput("select", h3("Select box"),
                        choices = c("red","green","purple"),
                        selected = "green"
            )
        ),
        #Outputs the graph on the main panel
        mainPanel(
            plotOutput("myplot")),
    )
)
#Server set up
server <- function(input, output, session) {
    #Outputs boxplot
    output$myplot <- renderPlot({
        boxplot(carat ~ get(input$p), data=diamonds, col = input$select)
    })
}

shinyApp(ui, server)




