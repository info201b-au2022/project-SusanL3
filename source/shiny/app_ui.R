library(dplyr)

introductory_page <- tabPanel(
  "Introductory Page",
  titlePanel("Overview"),
  img(src = "https://www.epa.gov/sites/default/files/2016-07/global-ghg-emissions-landing-thumb-2016.png"),
  br(),
  p("We seek to answer the “what obvious change of greenhouse gas in climate increased global warming in the last few years”. We have three research ways to There is some noticeable the major question. Most omit greenhouse gasses. Carbon dioxide is one of the most emitted greenhouse gasses in the world nowadays. If we want to lighten the worst climate change, we will need to solve the most emitted greenhouse gas first. The indicators of climate change are also important in this question. Because the indicators are closely correlated with climate change, and sometimes they are not very famous people. The climate extremes index changes over time as the most obvious factor to reveal climate change. We research the CEI between 1895 to 2020 to help us find some differences in the last decades. Some features of the change in greenhouse gas can help us to answer this question. We select the factors like the CEI (climate extremes index) change with years and the emission of carbon dioxide (million metric tons of equivalents) to aim to observe the greenhouse gas change in the last few years. As more and more people realize worse climate change, the climate is becoming from extreme to normal as in the past.")
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
      h2("Visualization"),
      plotlyOutput("chart2"),
      
      h2("Definition of CEI (Karl et al. 1996)"),
      p("The U.S. CEI is the arithmetic average of the following five indicators of the percentage of the conterminous U.S. area:"),
      tags$li("The sum of (a) percentage of the United States with maximum temperatures much below normal and (b) percentage of the United States with maximum temperatures much above normal."),
      tags$li("The sum of (a) percentage of the United States with minimum temperatures much below normal and (b) percentage of the United States with minimum temperatures much above normal."),
      tags$li("The sum of (a) percentage of the United States in severe drought (equivalent ot the lowest tenth percentile) based on the PDSI and (b) percentage of the United States with severe moisture surplus (equivalent to the highest tenth percentile) based on the PDSI."),
      tags$li("Twice the value of the percentage of the United States with a much greater than normal proportion of precipitation derived from extreme (equivalent to the highest tenth percentile) 1-day precipitation events."),
      tags$li("The sum of (a) percentage of the United States with a much greater than normal number of days with precipitation and (b) percentage of the United States with a much greater than normal number of days without precipitation."),
      tags$br(),
      p("In each case, we define much above (below) normal or extreme conditions as those falling in the upper (lower) tenth percentile of the local, period of record. In any given year, each of the five indicators has an expected value of 20%, in that 10% of all observed values should fall, in the long-term average, in each tenth percentile, and there are two such sets in each indicator. The fourth indicator, related to extreme precipitation events, has an opposite phase that cannot be considered extreme: the fraction of the country with a much below normal percentage of annual precipitation derived from extreme (i.e. zero) 1-day precipitation amounts. Hence, the fourth indicator is multiplied by twice its value to give it an expected value of 20%, comparable to the first four indicators. In the case of tropical systems, any landfalling system is considered extreme. Since precipitation from such a system is already accounted for in the precipitation steps and can also affect the PDSI, wind velocity at the time of landfall is the focus for this indicator. The square of the wind velocity of each tropical storm and hurricane at the time of landfall is used since a linear increase in wind velocity corresponds more closely to an exponential increase in wind impact and damage. Because this step only accounts for the strength and frequency of tropical systems at landfall (and could not theoretically affect 100% of the nation), it was necessary to scale the step 6 time series to make it comparable to the other five steps. This is done by setting the mean of the time series to that of the other five steps. A CEI both with and without the tropical cyclone indicator is made available in the plots below."),
      p("A value of 0% for the CEI, the lower limit, indicates that no portion of the period of record was subject to any of the extremes of temperature or precipitation considered in the index. In contrast, a value of 100% would mean that the entire country had extreme conditions throughout the year for each of the five/six indicators, a virtually impossible scenario. The long-term variation or change of this index represents the tendency for extremes of climate to either decrease, increase, or remain the same."),
      
      h2("References"),
      tags$li("NOAA National Center for Environmental Information. (2022). U.S. climate extremes index (CEI). U.S. Climate Extremes Index (CEI) | National Centers for Environmental Information (NCEI). Retrieved October 29, 2022, from https://www.ncei.noaa.gov/access/monitoring/cei/"),
      tags$li("Karl, T.R., 1986: The sensitivity of the Palmer drought severity index and Palmer's Z-index to their calibration coefficients including potential evapotranspiration. J. Climate Appl. Meteor., 25, 77-86.")
    )
  )
)

report_page <- tabPanel(
  "Research Report",
  titlePanel("Climate Changes in the US"),
  
  p("Code name: Climate Warriors"),
  p("Authors: Kaiyang Wu <kaiyaw@uw.edu>, Susan Lai <snl6@uw.edu>, Miles Zhang <hzhang44@uw.edu>"),
  p("Affiliation: INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
  p("Date: Autumn 2022"),
  p("Keywords: climate change; greenhouse gas emissions; environment;"),
  
  h2("Abstract"),
  p("In our project, we are focusing on global warming in climate change and answer this question, ", strong("“what obvious change of greenhouse gas in climate to increase global warming in the last few years?”"), ". This question will help us learn about a more serious situation in our environment. It is not only a dangerous problem in the US but also a global issue. We should recognize it and know how to prevent it in person from learning about the question, and know how to do some actions."),
  
  h2("Introduction"),
  p("Our project focuses on climate change in the US. We will find out the most impacting factor in the cause of climate change and put its importance into research. Collect data that causes the most serious problem in the US from the past and present to analyze how exactly it changed the climate in the last few years and what components have consisted in climate change. After analyzing the data, we will conclude with a solution to prevent it; and invoke people to take action to the suggestions we make to stop climate change from badly breaking up the environment where we are presently living. Additionally, to have them see what the future will look like if we don't take action. Doing all these steps can help advance our data to get reasonable evidence for the cause of it and may answer the questions that limit and allow us to understand the reasoning behind climate change."),
  
  h2("Problem Domain"),
  h3("Direct Stakeholders"),
  p("Direct stakeholders are the people who interact and work with a research topic almost every day. Some direct stakeholders are journalists and government officials because they are working on the project of the exploration of climate change, its effects, and solutions. Working with the topic can benefit them from people reading their articles or statements about climate change. Additionally, they allow others to learn and research more about the topic rather than having to find data ourselves. It benefits both sides of direct and indirect stakeholders by delivering and receiving the message of how the effects of climate change are threatening in the future."),
  
  h3("Indirect Stakeholders"),
  p("The indirect stakeholders could be people reading the articles, social media outputs, and projects about climate change. They could be an indirect stakeholder because when they read the news about climate change, people could be thinking of ways how they can also help climate change. For example, they would use other transportation to get to places rather than a vehicle with gas. They are not working on research about the effects of climate change but on how they can change their lifestyle or may not change anything in their lifestyle. Either way, what they do in their lifestyle shows how they can be an indirect stakeholder."),
  
  h3("Harms"),
  p("We might notice that the data that we found do not comfort our expectations. We cannot find the resources to locate and address our question in the searching and analyzing process. Also, most resources do not have credible sources. Our immature analyzing skills also will make mistakes and misunderstandings in information and data analysis. As “Data Feminism” said, all data analysis will exist biases and prejudices from the researchers, we also cannot exclude this probability in our data analysis. Since we are learning how we analyze the data and we still have different perspectives problems reflected in our disabilities in data collection and analysis. So, It may end up including incorrect information in this project and confuse people who review this project."),
  
  h3("Benefits"),
  p("We are able to have the opportunity to do research on global warming and climate change in the US. We are doing the “teach” thing — first, we study and collect the data about climate change in the US, and then we do our analysis with our understanding of climate change and let more people know about the dangers of climate change, make more people research it and people can work together to prevent climate change to a worse situation. It is not only the topic of weather in the US, but it also is how we get more people interested in this topic. If people read our article and get inspired, they may change their attitudes and opinions towards climate change which potentially pushes the progress of solving the problem of climate change."),
  
  h2("Research Questions"),
  tags$ol(
    tags$li("Which greenhouse gasses omit the most?"),
    br(),
    p("Finding what greenhouse gasses omit the most will help discover how to decrease climate change. Some of the greenhouse gasses are carbon dioxide, methane, nitrous oxide, etc. Those gasses are often produced by humans with their work and lifestyles. Therefore, finding out the main reason with the factor of knowing the greenhouse gasses will help climate change decrease in the future."),
    
    tags$li("What are the indicators of climate change?"),
    br(),
    p("We need to find indicators that support climate change in the US and try to abstract the data and trends. The indicators can also contribute to the prediction of future climate change paths. This question is important because some indicators that are correlated with climate change are not very known to the public, and are sometimes missing from research or projects like this one."),
    
    tags$li("How does the climate extremes index change over time?"),
    br(),
    p("By seeing how the indexes change over time, we can examine a time period where something happened. Additionally, there has been data found between 1895 to 2020. So by using this data, we will be able to see the differences and find solutions on what can change to fix the climate extremes.")
  ),
  
  h2("The Dataset"),
  tableOutput("dataset_summary_table"),
  
  tags$ol(
    tags$li(strong("U.S. Greenhouse Gas Emissions by Gas Sector, 1990–2020 (Environmental Protection Agency, 2022)")),
    br(),
    p("The greenhouse is highly related to climate change, and the dataset indicates the gas emissions by gas types from 1990 to 2020, which is helpful for resolving our first research question revolving around the relationship between greenhouse gas and the national climate change trends by giving us the gas emission sources and the type of gas that is prevalent in greenhouse gas emissions."),
    p("This dataset is collected by the United States Environmental Protection Agency in 2022, in order to collect and track the data related to climate change in the U.S. EPA has two key programs that provide data on greenhouse gas emissions in the United States: the Inventory of U.S. Greenhouse Gas Emissions and Sinks and the Greenhouse Gas Reporting Program, collaborating with hundreds of experts representing more than a dozen U.S. government agencies, academic institutions, industry associations, consultants and environmental organizations. The U.S. government and citizens are likely to benefit from the dataset. The data is credible as it’s collected by an agency of the United States government."),
    
    tags$li(strong("U.S. Climate Extremes Index (CEI) (NOAA National Center for Environmental Information, 2022a)")),
    br(),
    p("This dataset is a complex set of multivariate and multidimensional climate changes in the United States so that the results could be easily understood and used in policy decisions made by nonspecialists in the field. It is helpful for solving our second research question about the indicators of climate change as the dataset is calculated based on 4 indicators:"),
    tags$ol(
      tags$li("monthly maximum and minimum temperature"),
      tags$li("daily precipitation"),
      tags$li("monthly Palmer Drought Severity Index (PDSI)"),
      tags$li("landfalling tropical storm and hurricane wind velocity")
    ),
    br(),
    p("This dataset is collected by the National Center for Environmental Information and updated by month, in order to provide intuitive information for policy decisions and the general public. The data is calculated from other datasets including NCEI's nClimGrid (Vose et al., 2014). The dataset is credible as it’s collected by a government authority."),
    
    tags$li(strong("Contiguous U.S. Average/Maximum/Minimum Temperature (NOAA NCEI, 2022b)")),
    br(),
    p("This dataset includes the average, maximum, and minimum temperatures across the contiguous United States region from 1895 to 2020. It helps us get to know the temperature changes in the past and helps resolve our first and second questions as it’s an important indicator of climate change."),
    p("The dataset is collected by the National Center of Environmental Information and uses data from the U.S. Climate Divisions dataset, which is using the data from NCEI’s nClimGrid (Vose et al., 2014). The dataset is intended for the study of climate variability across the country. It is credible for the same reason as the dataset above as they are from the same authority.")
  ),
  
  h2("Expected Implications"),
  p("Technologists need to accompany people working on environmental protection and find out ways to address problems causing climate change to worsen. Designers should keep in mind the problem of climate change. The related institutions should publish the data table and analysis, to show the government and the public the real situation in the US, and make different kinds of people a more overall, clearer knowledge to take some actions. Policymakers should make policies focusing on how to protect the environment and write laws for judging behaviors based on current trends in climate change. The organization of protecting the environment can suggest people follow the policy and technologists' research results to protect the environment together. The public population can follow the professional researchers’ advice to fix their “not good for the environment” behaviors, everyone makes some contributions to protect the environment. With these suggestions, people in the world can see how life-threatening climate change is for our future and take action together."),
  
  h2("Limitations"),
  p("Two Limitations to climate change are; not fully understanding it and limits to the power of computers. We may not fully understand climate change because we do not know if humans are the cause of it and how much of the ocean, land, and other surfaces interfere (Legates, 2002). For instance, oceans may cause climate change because the current and temperature can be the main factor of it. Additionally, scientists track activities in parts of the world, and it limits the power of computers when there may be small important details on what is affecting climate change. Those small critical details may be tracking the activities of strong winds and the dry lands caused by forest fires (Legates, 2002). With the limitations, it may not be accurate to what causes climate change and is hard to discover. However,  we can still get evidence from scientific data to still discover why climate change is happening and how we can try to prevent it."),
  
  h2("Findings"),
  tags$ol(
    tags$li(strong("Which greenhouse gasses omit the most?")),
    br(),
    p("From our research on the first dataset (U.S. Greenhouse Gas Emissions by Gas/Economic Sector, 1990–2020), we can see from our first chart that in total, carbon dioxide emissions are the most. The second most type of greenhouse gas is Methane, followed by nitrous oxide and other greenhouse gasses. Carbon dioxide is the major greenhouse gas which naturally exists in the atmosphere, but human activities are altering the natural carbon cycle by emitting more carbon dioxide and by influencing the ability of natural sinks, like forests and soils, to remove and store carbon dioxide from the atmosphere, the major contributor to carbon dioxide emissions in the U.S. are transportation, electricity and industry. The main human activity that emits carbon dioxide is the combustion of fossil fuels (coal, natural gas, and oil) for energy and transportation (EPA, 2022)."),
    
    tags$li(strong("How does the climate extremes index change over time?")),
    br(),
    p("By creating the chart based on U.S. Climate Extremes Index (CEI) dataset, we can find that before around 1975, the index had been slowly decreasing, which indicates that the climate extremes had been getting better before that time, and there was less extreme weather. However, after 1975, the index has been increasing a lot, and reached the peak in 2012. The large increase in the climate extremes index indicates that in recent years, the extreme weather or climate anomaly is happening a lot more frequently, and the temperature is also becoming more and more extreme."),
    
    tags$li(strong("What are the indicators of climate change?")),
    br(),
    p("From the five datasets we have been researching, the first major indicator of climate change is temperature, which the dataset U.S. Climate Extremes Index (CEI) has been using the temperature data to calculate the overall indices. Follow that, the greenhouse gas emissions are also an important indicator, which is represented by the U.S. Greenhouse Gas Emissions by Gas/Economic Sector, 1990–2020 dataset. Greenhouse gasses are a major contributor to climate change according to the United States Environmental Protection Agency (EPA, 2022). Within the dataset of CEI, they also used data of days of precipitation in the year (NCEI, 2022a).")
  ),
  
  h2("Discussion"),
  p("In the question of which greenhouse gasses omit the most? We find out the several most influenced gas in the last few years, and the greenhouse gas is most relative to human activity. Most human activities produce many greenhouse gasses, and these greenhouse gasses stay in the atmosphere. Hence the greenhouse gas absorbs more and more heating to make the earth warmer. Transportation, electricity, and industry in the U.S. are the major contributors to carbon dioxide. The major way to decrease carbon dioxide is to decrease relative human activity. Like finding a new clean resource instead of burning fuel, or invoking people to have a cleaner life in America to reduce the emissions of greenhouse gas in transportation, electricity, and industry."),
  p("The index of climate extremes is the most important part to reflect the climate change in the last decades. First, between 1975 and 2012, the index is increasing, and we get that the temperature and climate are becoming more and more extreme, because of the development of human society. However, people become more and more convinced about life as the technique grows. They started to notice that the worse climate change will cause more natural disasters. After 2012, people were starting to decrease the release of green gasses. Until now, we are trying to save our lives from climate change. As more and more realize the seriousness of climate change, they take the actions they can to help the earth."),
  p("The indicators of climate change are also relevant to human life. At the above, we can know the climate extremes index is a visible data to people to see the difference of climate change as the time goes. Temperature is a major part to calculate the CEI, but, people will not place temperature importance in their life. The reason is that temperature is always changing, it is not stable and constant to record. If temperature and climate are changing together. It is hard to relate them together. Now, we know more greenhouse gasses will cause the temperature to rise, and produce a series of results to impact human life. Every person should do something to decrease the emission of themselves. To help the temperature be cooler."),
  
  h2("Conclusion"),
  p("Over the years, greenhouse emissions are increasing. You can see it in the second chart with the climate extreme indices. The emissions are rising and can be the cause of climate change. One of the emissions that emit the most is carbon dioxide. It comes from human activities and natural sources. Such as burning coal, oil, natural gasses, and humans and animals breathing creates carbon dioxide. Additionally, the indexes show the temperature changes in how much heat was trapped in our atmosphere. The highest index calculated was in 2012, and even though it was a few years ago when that happened, it can still occur now or in the future. The reason is when there are temperature changes, everything shifts. Sea levels could rise, which results in changes in the weather, glaciers melting, hotter temperatures, etc. We do not fully know what may happen in the future if we do not stop it from ascending, but we should still take action and come up with solutions to prevent it. We can come up with some predictions on what may happen in the future. For instance, the temperature becomes hotter and may be hard for us to handle, and the weather patterns change causing a drought or flood in some areas. Some actions we can take could be eating less dairy and meat, using less car transportation, reducing energy usage, etc. Doing at least one or two actions, can help climate change decrease and make the earth a healthier and safer place for future generations. Furthermore, we can raise our voices to the government for them to create laws on how to fix climate change."),
  
  h2("Acknoledgements"),
  p("We would like to acknowledge the group members working on this project, the teaching assistant who helped us address our research questions, and the friend of Kaiyang Wu who gave great help with our project."),
  
  h2("References"),
  tags$ol(
    tags$li("Environmental Protection Agency. (2022). *Climate Change Indicators: U.S. Greenhouse Gas Emissions*. Retrieved October 29, 2022, from https://www.epa.gov/climate-indicators/climate-change-indicators-us-greenhouse-gas-emissions"),
    tags$li("NOAA National Center for Environmental Information. (2022). *U.S. climate extremes index (CEI). U.S. Climate Extremes Index (CEI) | National Centers for Environmental Information (NCEI)*. Retrieved October 29, 2022, from https://www.ncei.noaa.gov/access/monitoring/cei/"),
    tags$li("Climate Change and Human Health: Racing to Curb the Ripple Effect. (May 23, 2022). Better Health https://www.bayer.com/en/news-stories/climate-change-and-human-health?gclid=Cj0KCQjwnvOaBhDTARIsAJf8eVMI_iCxAyKFOe4DEypndFT36I15LQNhkpvq8i1XP__9H1yDulXpDOAaAjDvEALw_wcB"),
    tags$li("Legates, D. R. (2002). Limitations of climate models as predictors of climate change. National Center for Policy Analysis. Retrieved October 29, 2022, from https://www.ncpathinktank.org/pub/ba396"),
    tags$li("Vose, R.S., Applequist, S., Squires, M., Durre, I., Menne, M.J., Williams, C.N., Fenimore, C., Gleason, K., and Arndt, D., 2014: Gridded 5km GHCN-Daily Temperature and Precipitation Dataset (nCLIMGRID), Version 1. NOAA National Centers for Environmental Information. DOI:10.7289/V5SX6B56"),
    tags$li("Climate change impacts. National Oceanic and Atmospheric Administration. (n.d.). Retrieved October 29, 2022, from https://www.noaa.gov/education/resource-collections/climate/climate-change-impacts"),
    tags$li("NOAA National Centers for Environmental information. (2022). Climate at a Glance: National Mapping, Average Temperature. Retrieved on October 29, 2022 from https://www.ncdc.noaa.gov/cag/"),
    tags$li("“How Does Carbon Get into the Atmosphere?” How Does Carbon Get into the Atmosphere? | U.S. Geological Survey, https://www.usgs.gov/faqs/how-does-carbon-get-atmosphere#:~:text=Natural%20sources%20of%20carbon%20dioxide,%2C%20oil%2C%20or%20natural%20gas"),
    tags$li("“Global Emissions.” Center for Climate and Energy Solutions, 24 Mar. 2022, https://www.c2es.org/content/international-emissions/#:~:text=Globally%2C%20the%20primary%20sources%20of,72%20percent%20of%20all%20emissions"),
  )
)

takeaway_page <- tabPanel(
  "Summary Takeaways",
  titlePanel("Summary Takeaways"),
  p("The first takeaway is the weather is changing, and something horrible may happen as we have seen a rise in the second chart indexes. Before 1975, climate change was not increasing as much compared to the years after. It shows how climate change affects the earth through weather changes because of the increase in greenhouse emissions."),
  p("The second major takeaway is that greenhouse emissions are rising and are the reason there is climate change. Technology is advanced, and many emissions come along with them. It also comes from human activities where we use electricity, heat, transportation, manufacturing, etc. Even though we are not certain it is from human activities, it can be a start to figuring out what is impacting climate change and eliminating what we have tested."),
  p("It then goes into our last takeaway, which is finding solutions and starting to take action. If we do not find solutions and take action, climate change will increase, and we will not know what will happen to earth. Therefore, if we start finding ways, we can fix it, for example, by having the government implement rules, and we humans can take steps to change our activities like less car transportation.")
)

ui <- navbarPage(
  "Climate Changes in the US",
  includeCSS("./custom.css"),
  introductory_page,
  chart1_page,
  chart2_page,
  takeaway_page,
  report_page
)
