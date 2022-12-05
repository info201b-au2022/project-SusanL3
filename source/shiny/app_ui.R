library(dplyr)

introductory_page <- tabPanel(
  "Introductory"
)

chart1_page <- tabPanel(
  "Chart 1",
  titlePanel("Greenhouse Gas Emission Visualization"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "gas_type",
        label = "Gas Type",
        choices = colnames(ghg_emissions %>% select(-Year)),
        selected = c("Carbon.dioxide", "Methane"),
        multiple = T
      ),
      sliderInput(
        "ghg_year_range",
        label = "Year Range",
        min = min(ghg_emissions$Year),
        max = max(ghg_emissions$Year),
        value = c(min(ghg_emissions$Year), max(ghg_emissions$Year))
      )
    ),
    mainPanel(
      plotlyOutput("chart1")
    )
  )
)

chart2_page <- tabPanel(
  "Chart 2",
  titlePanel("U.S. Climate Extremes Index (CEI)"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        "cei_year_range",
        label = "Year Range",
        min = min(cei$Year),
        max = max(cei$Year),
        value = c(min(cei$Year), max(cei$Year))
      )
    ),
    mainPanel(
      h1("Definition of CEI (Karl et al. 1996)"),
      p("The U.S. CEI is the arithmetic average of the following five indicators of the percentage of the conterminous U.S. area:"),
      tags$li("The sum of (a) percentage of the United States with maximum temperatures much below normal and (b) percentage of the United States with maximum temperatures much above normal."),
      tags$li("The sum of (a) percentage of the United States with minimum temperatures much below normal and (b) percentage of the United States with minimum temperatures much above normal."),
      tags$li("The sum of (a) percentage of the United States in severe drought (equivalent ot the lowest tenth percentile) based on the PDSI and (b) percentage of the United States with severe moisture surplus (equivalent to the highest tenth percentile) based on the PDSI."),
      tags$li("Twice the value of the percentage of the United States with a much greater than normal proportion of precipitation derived from extreme (equivalent to the highest tenth percentile) 1-day precipitation events."),
      tags$li("The sum of (a) percentage of the United States with a much greater than normal number of days with precipitation and (b) percentage of the United States with a much greater than normal number of days without precipitation."),
      tags$br(),
      p("In each case, we define much above (below) normal or extreme conditions as those falling in the upper (lower) tenth percentile of the local, period of record. In any given year, each of the five indicators has an expected value of 20%, in that 10% of all observed values should fall, in the long-term average, in each tenth percentile, and there are two such sets in each indicator. The fourth indicator, related to extreme precipitation events, has an opposite phase that cannot be considered extreme: the fraction of the country with a much below normal percentage of annual precipitation derived from extreme (i.e. zero) 1-day precipitation amounts. Hence, the fourth indicator is multiplied by twice its value to give it an expected value of 20%, comparable to the first four indicators. In the case of tropical systems, any landfalling system is considered extreme. Since precipitation from such a system is already accounted for in the precipitation steps and can also affect the PDSI, wind velocity at the time of landfall is the focus for this indicator. The square of the wind velocity of each tropical storm and hurricane at the time of landfall is used since a linear increase in wind velocity corresponds more closely to an exponential increase in wind impact and damage. Because this step only accounts for the strength and frequency of tropical systems at landfall (and could not theoretically affect 100% of the nation), it was necessary to scale the step 6 time series to make it comparable to the other five steps. This is done by setting the mean of the time series to that of the other five steps. A CEI both with and without the tropical cyclone indicator is made available in the plots below."),
      p("A value of 0% for the CEI, the lower limit, indicates that no portion of the period of record was subject to any of the extremes of temperature or precipitation considered in the index. In contrast, a value of 100% would mean that the entire country had extreme conditions throughout the year for each of the five/six indicators, a virtually impossible scenario. The long-term variation or change of this index represents the tendency for extremes of climate to either decrease, increase, or remain the same."),
      
      h1("Visualization"),
      plotlyOutput("chart2"),
      
      h1("References"),
      tags$li("NOAA National Center for Environmental Information. (2022). U.S. climate extremes index (CEI). U.S. Climate Extremes Index (CEI) | National Centers for Environmental Information (NCEI). Retrieved October 29, 2022, from https://www.ncei.noaa.gov/access/monitoring/cei/"),
      tags$li("Karl, T.R., 1986: The sensitivity of the Palmer drought severity index and Palmer's Z-index to their calibration coefficients including potential evapotranspiration. J. Climate Appl. Meteor., 25, 77-86.")
    )
  )
)

ui <- navbarPage(
  "Climate Changes in the US",
  introductory_page,
  chart1_page,
  chart2_page
)