library(shiny)
source("rose.R")

shinyServer(function(input, output) {
  observe({
    if (input$submit1>0) {
            output$rose_plot <- renderPlot({
                                roseplot(input$rfile$datapath,input$rcolor1,input$rcolor2,input$type,input$xname,input$yname)
            })
            
    #         down_type(input$width,input$height,input$dpi,input$rfile$datapath,input$rcolor1,input$rcolor2,input$type,input$xname,input$yname)
    }
    
  })
  output$download.pdf <- downloadHandler(
    filename = function() {
      paste("rose", Sys.Date(), ".pdf", sep="")
    },
    content = function(file) {
      pdf(file)
      print(roseplot(input$rfile$datapath,input$rcolor1,input$rcolor2,input$type,input$xname,input$yname))
      dev.off()
    },contentType = 'application/pdf')
  output$download.png <- downloadHandler(
    filename = function() {
      paste("rose", Sys.Date(), ".png", sep="")
    },
    content = function(file) {
      png(file,width = input$bwidth,height = input$bheight,res = 300,type="cairo")
      print(roseplot(input$rfile$datapath,input$rcolor1,input$rcolor2,input$type,input$xname,input$yname))
      dev.off()
    },contentType = 'image/png')
  output$download.jpeg <- downloadHandler(
    filename = function() {
      paste("rose", Sys.Date(), ".jpeg", sep="")
    },
    content = function(file) {
      jpeg(file,width = input$bwidth,height = input$bheight,res = 300)
      print(roseplot(input$rfile$datapath,input$rcolor1,input$rcolor2,input$type,input$xname,input$yname))
      dev.off()
    },contentType = 'image/jpeg')
  
  
  })