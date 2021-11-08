library(shiny)

source("pirates.R")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  observe({
    if (input$submit1>0) {
      output$pirates_plot <- renderPlot({
        pirates(input$pfile$datapath,input$pmain,input$ppal,input$ptheme,input$pinf)
      })
      
    }
  })
  output$download.pdf <- downloadHandler(
    filename = function() {
      paste("pirates", Sys.Date(), ".pdf", sep="")
    },
    content = function(file) {
      pdf(file,width = input$bwidth,height = input$bheight)
      print(pirates(input$pfile$datapath,input$pmain,input$ppal,input$ptheme,input$pinf))
      dev.off()
    },contentType = 'application/pdf')
  output$download.png <- downloadHandler(
    filename = function() {
      paste("pirates", Sys.Date(), ".png", sep="")
    },
    content = function(file) {
      png(file,width = input$bwidth,height = input$bheight,res=300)
      print(pirates(input$pfile$datapath,input$pmain,input$ppal,input$ptheme,input$pinf))
      dev.off()
    },contentType = 'image/png')
  output$download.jpeg <- downloadHandler(
    filename = function() {
      paste("pirates", Sys.Date(), ".jpeg", sep="")
    },
    content = function(file) {
      jpeg(file,width = input$bwidth,height = input$bheight,res=300)
      print(pirates(input$pfile$datapath,input$pmain,input$ppal,input$ptheme,input$pinf))
      dev.off()
    },contentType = 'image/jpeg')
})