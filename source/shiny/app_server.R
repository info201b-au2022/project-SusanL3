library(shiny)
library(dplyr)

ghg_emissions <- read.csv("../../data/us-ghg-emissions_fig-1.csv", stringsAsFactors = F)

cei <- read.csv("../../data/cei.csv", stringsAsFactors = F)

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
}