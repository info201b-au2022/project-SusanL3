library(tidyr)
library(dplyr)

#First Table
data <- read.csv("../data/us-ghg-emissions_fig-1.csv")
first_table <- data %>%
  gather(
    key = Gas.Type,
    value = Emissions,
    -Year
  ) %>%
  group_by(Gas.Type) %>%
  summarize(Total.Emission = sum(Emissions))

#Second Table
data_2 <- read.csv("../data/annual_average_temperature_anomaly.csv")

second_table <- data_2 %>%
  gather(
    key = Source.Type,
    value = Index,
    -Date
  ) %>%
  group_by(Source.Type) %>%
  filter(Source.Type == "ClimDiv") %>%
  ungroup(Source.Type) %>%
  select(-Source.Type)