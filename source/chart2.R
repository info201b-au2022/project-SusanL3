chart2 <- function() {
  # Libraries
  library(ggplot2)
  library(hrbrthemes)
  library(tidyverse)
  title  <- "U.S. Climate Extremes Index (CEI)"
  subtitle <- "Data Source: ClimDiv"
  
  anomaly <- read.csv("../data/annual_average_temperature_anomaly.csv", stringsAsFactors = FALSE)

  # create data
  data <- data.frame(
    date = anomaly$Date,
    value = anomaly$ClimDiv
  )
  
  # Most basic error bar
  p <- ggplot(data) +
    geom_bar(mapping = aes(x=date, y=value), stat="identity", fill="red", width = 5, alpha=0.7) +
    geom_smooth(mapping = aes(x=date, y=value)) +
    labs(
      x = "Date",
      y = "Climate Extremes Index (CEI)",
      title = title,
      subtitle = subtitle
    )
  
  return(p)
}

# the bar plot with smooth is about the relationship between the climate extremes index (CEI) and date.
# in the smooth line, it shows the CEI be positive from negative value as time goes. 
# it means the climate is becoming more and more extremely near the several decades because there are more positive bars than in the past.