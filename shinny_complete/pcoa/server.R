library(shiny)

source("PCoA.R")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  observe({
    if (input$submit1>0) {
      output$PCoA_plot <- renderPlot({
        PCoA(input$ppdata$datapath,input$ppdata.env$datapath)
      })
      
    }
  })
  output$download.pdf <- downloadHandler(
    filename = function() {
      paste("PCoA", Sys.Date(), ".pdf", sep="")
    },
    content = function(file) {
      pdf(file)
      print(PCoA(input$ppdata$datapath,input$ppdata.env$datapath))
      dev.off()
    },contentType = 'application/pdf')
  output$download.png <- downloadHandler(
    filename = function() {
      paste("PCoA", Sys.Date(), ".png", sep="")
    },
    content = function(file) {
      png(file,width = input$bwidth,height = input$bheight,res = 300,type="cairo")
      print(PCoA(input$ppdata$datapath,input$ppdata.env$datapath))
      dev.off()
    },contentType = 'image/png')
  output$download.jpeg <- downloadHandler(
    filename = function() {
      paste("PCoA", Sys.Date(), ".jpeg", sep="")
    },
    content = function(file) {
      jpeg(file,width = input$bwidth,height = input$bheight,res = 300)
      print(PCoA(input$ppdata$datapath,input$ppdata.env$datapath))
      dev.off()
    },contentType = 'image/jpeg')
  
})