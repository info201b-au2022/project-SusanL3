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
data_2 <- read.csv("../data/cei.csv")

second_table <- data_2 %>%
  mutate(Percent.Diff = Percent - lag(Percent, default = 43.08)) %>%
  gather(
    key = Value.Type,
    value = Index,
    -Year
  ) %>%
  group_by(Value.Type) %>%
  filter(Value.Type == "Percent.Diff") %>%
  ungroup() %>%
  select(-Value.Type)