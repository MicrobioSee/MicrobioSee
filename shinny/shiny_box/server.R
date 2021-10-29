library(shiny)
source("box_plotzs.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should
  #     re-execute automatically when inputs change
  #  2) Its output type is a plot
  
  output$boxplot <- renderPlot({
    box_plot(input$file1$datapath,input$xlab,input$ylab,input$plottitle,input$notch,input$color1,input$color2,input$color3,input$name1,input$name2,input$name3,input$horizontal)
  })
})