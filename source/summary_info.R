# U.S. Greenhouse Gas Emissions by Gas Sector

data_1 <- read.csv("../data/us-ghg-emissions_fig-1.csv")

summary_data_1 <- list()
summary_data_1$observations <- nrow(data_1)
summary_data_1$gas_types <- ncol(data_1) - 1
summary_data_1$year_most_co2 <- data_1 %>%
  select(Year, Carbon.dioxide) %>%
  filter(Carbon.dioxide == max(Carbon.dioxide)) %>%
  pull(Year)
summary_data_1$year_most_methane <- data_1 %>%
  select(Year, Methane) %>%
  filter(Methane == max(Methane)) %>%
  pull(Year)
summary_data_1$year_most_no <- data_1 %>%
  select(Year, Nitrous.oxide) %>%
  filter(Nitrous.oxide == max(Nitrous.oxide)) %>%
  pull(Year)
summary_data_1$year_most_other <- data_1 %>%
  select(Year, HFCs..PFCs..SF6..and.NF3) %>%
  filter(HFCs..PFCs..SF6..and.NF3 == max(HFCs..PFCs..SF6..and.NF3)) %>%
  pull(Year)

# U.S. Climate Extremes Index (CEI)

data_2 <- read.csv("../data/cei.csv")

summary_data_2 <- list()
summary_data_2$observations <- nrow(data_2)
summary_data_2$max_index <- data_2 %>%
  filter(Percent == max(Percent)) %>%
  pull(Percent)
summary_data_2$min_index <- data_2 %>%
  filter(Percent == min(Percent)) %>%
  pull(Percent)
summary_data_2$avg_index <- data_2 %>%
  filter(Percent == mean(Percent)) %>%
  pull(Percent)
summary_data_2$year_max_index <- data_2 %>%
  filter(Percent == max(Percent)) %>%
  pull(Year)