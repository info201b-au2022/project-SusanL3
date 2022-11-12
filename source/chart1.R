chart1 <- function() {
  library(dplyr)
  library(tidyr)
  library(ggplot2)
  
  title <- "Total Greenhouse Gas Emissions in the US"
  subtitle <- "Gas Emissions by Gas Type"
  
  data <- read.csv("../data/us-ghg-emissions_fig-1.csv") %>%
    gather(key = Gas.Type, value = Emission, -Year) %>%
    group_by(Gas.Type) %>%
    summarize(Total.Emission = sum(Emission)) %>%
    arrange(-Total.Emission)
  
  chart <- data %>%
    ggplot() +
    geom_col(mapping = aes(x = "", y = Total.Emission, fill = Gas.Type)) +
    labs(
      x = "",
      y = "",
      title = title,
      subtitle = subtitle
    )

  return(chart)
}