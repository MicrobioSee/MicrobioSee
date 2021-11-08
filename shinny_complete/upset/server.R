source("upset.R")
shinyServer(function(input, output) {
  observe({
    if (input$submit1>0) {
      output$upset_plot <- renderPlot({
        upsetplot(input$ufile1$datapath,input$ucomparison,input$uxlabel,input$uylabel)
        
      })
      
    }
  })
  output$download.pdf <- downloadHandler(
    filename = function() {
      paste("upset", Sys.Date(), ".pdf", sep="")
    },
    content = function(file) {
      pdf(file)
      print(upsetplot(input$ufile1$datapath,input$ucomparison,input$uxlabel,input$uylabel))
      
      dev.off()
    },contentType = 'application/pdf')
  output$download.png <- downloadHandler(
    filename = function() {
      paste("upset", Sys.Date(), ".png", sep="")
    },
    content = function(file) {
      png(file,width = input$bwidth,height = input$bheight,res = 300,type="cairo")
      
      print(upsetplot(input$ufile1$datapath,input$ucomparison,input$uxlabel,input$uylabel))
      dev.off()
    },contentType = 'image/png')
  output$download.jpeg <- downloadHandler(
    filename = function() {
      paste("upset", Sys.Date(), ".jpeg", sep="")
    },
    content = function(file) {
      jpeg(file,width = input$bwidth,height = input$bheight,res = 300)
      
      print(upsetplot(input$ufile1$datapath,input$ucomparison,input$uxlabel,input$uylabel))
      dev.off()
    },contentType = 'image/jpeg')
})