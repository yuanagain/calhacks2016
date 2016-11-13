## data_gen.R
## Copyright Yuan Wang 2015


## generate random walk sequence starting from seed
genWalk <- function(dates, seed = 375) {
  datum <- seed
  vals <- c()
  for (date in dates) {
    
    ## give a random step
    datum <- datum + sample(-7:8, 1) 
    vals <- append(vals, datum)   
    
  }
  vals
}

genPriceFrame <- function(keys = c("A", "B")) {
  dates <- seq(as.Date("2015/8/24"), Sys.Date(), "day")
  data <- data.frame(date = dates)
  
  # create random walk
  for (key in keys) {
    data[[key]] <- genWalk(dates = dates)
  }
  
  data
    
}

genPriceSeries <- function(keys = c("A", "B")) {
  data <- genPriceFrame(keys)
  # return as xts
  xts(data, order.by = data$date)
}