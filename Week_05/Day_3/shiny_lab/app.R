library(tidyverse)
library(shiny)
library(shinythemes)
library(CodeClanData)
olympics_overall_medals <- olympics_overall_medals
olympic_colours <- c("gold", "silver", "bronze")
# ui ----------------------------------------------------------------------

ui <- fluidPage(
    theme = shinytheme("cyborg"),
    titlePanel(tags$h2("Five Country Medal Comparison")),
    sidebarLayout(
        sidebarPanel(radioButtons(inputId = "season_input",
                                  "Summer or Winter Olympics",
                                  choices = c("Summer", "Winter")),
        radioButtons(inputId = "medal_input",
                     "Type of medal",
                     choices = c("Gold", "Silver", "Bronze"))),
        mainPanel(plotOutput("medalplot"))
    )
)
# Server ------------------------------------------------------------------

server <- function(input, output, session) {
    
   output$medalplot <- renderPlot({
       olympics_overall_medals %>%
           filter(team %in% c("United States",
                              "Soviet Union",
                              "Germany",
                              "Italy",
                              "Great Britain")) %>%
           filter(medal == input$medal_input) %>%
           filter(season == input$season_input) %>%
           ggplot() +
           aes(x = team, y = count, fill = medal) +
           geom_col() + 
           scale_fill_manual(values = c("Gold" = "gold3",
                                        "Silver" = "grey",
                                        "Bronze" = "brown"))
})
}
# Shiny App ---------------------------------------------------------------


shinyApp(ui = ui, server = server)

