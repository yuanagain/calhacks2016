## ui.R
## Calhacks 2016
## Author: Yuan Wang

shinyUI(fluidPage(
  theme = shinytheme("flatly"),
  
  titlePanel("Dashboard"),
  
  sidebarLayout(
    sidebarPanel(
      DT::dataTableOutput('data_table'),
      checkboxInput("showgrid", label = "Show Grid", value = TRUE)
    ),
    
    mainPanel(
      dygraphOutput("data_series"),
      fluidRow(
        column(width = 3,
              numericInput("moving_average",
                           label = "Moving Avg", 
                           value = 0, 
                           min = 0, max = NA, step = 1, 
                           width = NULL
              )
        ),
        column(width = 3,
               numericInput("percent_change",
                            label = "% Change", 
                            value = 0, 
                            min = 0, max = NA, step = 1, 
                            width = NULL
               )
        ),
        column(width = 3,
               checkboxInput("normalize", "Normalize", value = FALSE, width = NULL)
        ),
        column(width = 3,
               checkboxInput("opt4", "Option", value = FALSE, width = NULL)
        )
      )
      
      
    )
  )
))