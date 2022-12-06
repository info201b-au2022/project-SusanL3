library(shiny)
library(dplyr)

ghg_emissions <- read.csv("../../data/us-ghg-emissions_fig-1.csv", stringsAsFactors = F)

cei <- read.csv("../../data/cei.csv", stringsAsFactors = F)

tmin <- read.csv("../../data/110-tmin-12-12-1895-2020.csv", stringsAsFactors = F)
tmax <- read.csv("../../data/110-tmax-12-12-1895-2020.csv", stringsAsFactors = F)
tavg <- read.csv("../../data/110-tavg-12-12-1895-2020.csv", stringsAsFactors = F)

server <- function(input, output) {
  output$chart1 <- renderPlotly({
    title <- paste0("Changes of Greenhouse Emissions (", input$ghg_year_range[1], "-", input$ghg_year_range[2], ")")
    legend_x <- "Year"
    legend_y <- "Emissions (million metrics tons of carbon dioxide equivalent)"
    color <- "Gas Type"
    
    data <- ghg_emissions %>%
      filter(Year >= input$ghg_year_range[1], Year <= input$ghg_year_range[2]) %>%
      select(Year, match(input$gas_type, colnames(ghg_emissions))) %>%
      gather(key = "Gas.Type", value = "Emissions", -Year)
    
    p <- ggplot(data, mapping = aes(x = Year, y = Emissions, fill = Gas.Type)) +
      geom_area() +
      labs(
        title = title,
        legend_x = legend_x,
        legend_y = legend_y,
        color = color
      )
    
    p <- ggplotly(p)

    return(p)
  })

  output$chart2 <- renderPlotly({
    title <- paste0("U.S. Climate Extremes Index (CEI) (", input$cei_year_range[1], "-", input$cei_year_range[2], ")")
    legend_x <- "Year"
    legend_y <- "Index (Percent)"
    
    data <- cei %>%
      filter(Year >= input$cei_year_range[1], Year <= input$cei_year_range[2])
    
    p <- ggplot(data, mapping = aes(x = Year, y = Percent)) +
      geom_area() +
      labs(
        title = title,
        legend_x = legend_x,
        legend_y = legend_y,
      )
    
    p <- ggplotly(p)

    return(p)
  })
  
  output$dataset_summary_table <- renderTable({
    summary_table <- list(
      "Dataset" = c(
        "U.S. Greenhouse Gas Emissions by Gas, 1990–2020",
        "U.S. Climate Extremes Index (CEI)",
        "Contiguous U.S. Average Temperature",
        "Contiguous U.S. Maximum Temperature",
        "Contiguous U.S. Minimum Temperature"
      ),
      "Number of Observations" = c(
        37L, 112L, 126L, 126L, 126L
      ),
      "Number of Variables" = c(
        5L, 2L, 3L, 3L, 3L
      )
    )
    
    return(summary_table)
  })
}