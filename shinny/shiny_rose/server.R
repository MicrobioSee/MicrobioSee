library(shiny)
source("rose.R")

shinyServer(function(input, output) {
  observe({
    if (input$submit1>0) {
            output$roseplot <- renderPlot({
                                rose_plot(input$rfile$datapath,input$rcolor1,input$rcolor2,input$type,input$xname,input$yname)
            })
    #         down_type(input$width,input$height,input$dpi,input$rfile$datapath,input$rcolor1,input$rcolor2,input$type,input$xname,input$yname)
    }
    
  })
  
  })