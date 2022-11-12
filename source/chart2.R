chart2 <- function() {
  # Libraries
  library(ggplot2)
  library(hrbrthemes)
  library(tidyverse)
  title  <- "annual average temperature anomaly"
  subtitle <- "ClimDiv with USCRN"
  
  anomaly <- read.csv("../data/annual_average_temperature_anomaly.csv", stringsAsFactors = FALSE)

  # create data
  data <- data.frame(
    date = anomaly$Date,
    value = anomaly$ClimDiv
  )
  
  # Most basic error bar
  p <- ggplot(data) +
    geom_bar(mapping = aes(x=date, y=value), stat="identity", fill="green", size = 30, alpha=0.7) +
    geom_smooth(mapping = aes(x=date, y=value))
  
  return(p)
}
