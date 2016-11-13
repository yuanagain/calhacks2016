## server.R
## Calhacks 2016
## Author: Yuan Wang

models <- c("Series 1", "Series 2", "Series 3")

shinyServer(function(input, output) {
  
  predicted <- reactive({
    hw <- HoltWinters(ldeaths)
    predict(hw, n.ahead = input$months, 
            prediction.interval = TRUE,
            level = as.numeric(input$interval))
  })
  
  
  ## generate  series, clean up data
  data_series <- genPriceSeries(keys= models)
  data_series$date <- NULL
  
  ## compute fly-by stats on series
  av <- c()
  
  keys = c(1,2,3)
  for (key in keys) {
    av <- append(av, round(mean(as.numeric(data_series[, key])), digits = 3))
  }
  
  data_table <- data.frame(Model = models,
                            Av = av)
  
  output$data_table <- DT::renderDataTable(data_table, 
    options = list(
      pageLength = 5
  ))
  
  output$data_series <- renderDygraph({
    plot_series <- NULL

    ## extract selected timeseries
    if (is.null(input$data_table_rows_selected)) {
      plot_series <- data_series
    }
    
    else {
      plot_series <- data_series[, input$data_table_rows_selected]
    }
    
    ## apply normalize
    if (input$normalize) {
      for (i in 1:ncol(plot_series)) {
        plot_series[,i] <- scale(as.numeric(plot_series[,i]))
      }
    }
    
    ## apply percent changex
    if (!is.null(input$percent_change)) {
      if (input$percent_change > 0 ) {
        for (i in 1:ncol(plot_series)) {
          plot_series[,i] <- Delt(x1 = as.numeric(plot_series[,i]), 
                                 x2 = NULL,
                                 k = input$percent_change)
          
        }
      }
    }
    
    
    
    ## apply moving average
    if (!is.null(input$moving_average)) {
      if (input$moving_average > 0 ) {
        for (i in 1:ncol(plot_series)) {
          plot_series[,i] <- SMA(as.numeric(plot_series[,i]), 
                                 n = input$moving_average)
          
        }
      }
    }
    
    ## plot dygraph
    dygraph(plot_series, main = "Data Series") %>%
      dySeries(c(), label = "Some Data") %>%
      dyOptions(drawGrid = input$showgrid) %>%
      dyRangeSelector(height = 20)
  })
  
})
