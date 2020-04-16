# server.R

source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps) 
library(mapproj)

shinyServer <- function(input, output) {
  output$map <- renderPlot({
    data <- switch(input$var, 
                   "Percent White" = counties$white,
                   "Percent Black" = counties$black,
                   "Percent Hispanic" = counties$hispanic,
                   "Percent Asian" = counties$asian)
    legend <- switch(input$var, 
                     "Percent White" = "Percent White",
                     "Percent Black" = "Percent Black",
                     "Percent Hispanic" = "Percent Hispanic",
                     "Percent Asian" = "Percent Asian")
    
    percent_map(var = data, color = "darkgreen", legend, input$range[1], input$range[2])
  })
}