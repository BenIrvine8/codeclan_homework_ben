library(tidyverse)
library(shiny)
library(CodeClanData)
game_sales <- game_sales

bar <- ggplot(game_sales, position = "dodge") + 
    aes(x = genre, y = sales) +
    geom_col()

horizontal_bar <- ggplot(game_sales, position = "dodge") +
    aes(x = genre, y = sales) +
    geom_col() +
    coord_flip()

# UI ----------------------------------------------------------------------
ui <- fluidPage(radioButtons("graph_input",
                            "Plot Type",
                            choices = c("Bar",
                                        "Horizontal Bar")
),
plotOutput("bar_time")
)


# Server ------------------------------------------------------------------
server <- function(input, output){
    output$bar_time <- renderPlot({
        if (input$graph_input == "Bar") {print(bar)}  
        if (input$graph_input == "Horizontal Bar") {print(horizontal_bar)}
    })

}


# shinyApp ----------------------------------------------------------------

shinyApp(ui, server)

