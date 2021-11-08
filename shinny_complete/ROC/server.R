library(shiny)

source("ROC.R")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  observe({
    if (input$submit1>0) {
      output$ROC_plot <- renderPlot({
        ROC(input$Rfile$datapath,input$outcome,input$Routcome_colum,input$Rindex1,input$Rindex1_colum,input$Rindex2,input$Rindex2_colum,input$Rindex3,input$Rindex3_colum)
      })
      
    }
  })
  output$download.pdf <- downloadHandler(
    filename = function() {
      paste("ROC", Sys.Date(), ".pdf", sep="")
    },
    content = function(file) {
      pdf(file,width = input$bwidth,height = input$bheight)
      print(ROC(input$Rfile$datapath,input$outcome,input$Routcome_colum,input$Rindex1,input$Rindex1_colum,input$Rindex2,input$Rindex2_colum,input$Rindex3,input$Rindex3_colum))
      dev.off()
    },contentType = 'application/pdf')
  output$download.png <- downloadHandler(
    filename = function() {
      paste("ROC", Sys.Date(), ".png", sep="")
    },
    content = function(file) {
      png(file,width = input$bwidth,height = input$bheight,res=300)
      print(ROC(input$Rfile$datapath,input$outcome,input$Routcome_colum,input$Rindex1,input$Rindex1_colum,input$Rindex2,input$Rindex2_colum,input$Rindex3,input$Rindex3_colum))
      dev.off()
    },contentType = 'image/png')
  output$download.jpeg <- downloadHandler(
    filename = function() {
      paste("ROC", Sys.Date(), ".jpeg", sep="")
    },
    content = function(file) {
      jpeg(file,width = input$bwidth,height = input$bheight,res=300)
      print(ROC(input$Rfile$datapath,input$outcome,input$Routcome_colum,input$Rindex1,input$Rindex1_colum,input$Rindex2,input$Rindex2_colum,input$Rindex3,input$Rindex3_colum))
      dev.off()
    },contentType = 'image/jpeg')
})