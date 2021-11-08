library(shiny)

source("heatmap.R")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  observe({
    if (input$submit1>0) {
      output$heatmap_plot <- renderPlot({
        heatmap(input$hfile$datapath,input$hscale,input$hcluster_rows,input$hcluster_cols,input$hclustering_method,input$hborder,input$hcellwidth,input$hcellheight,input$hdisplay_numbers,input$hmain,input$hshow_colnames,input$hshow_rownames,input$hfontsize_number,input$hfontsize)
      })
      
    }
  })
  output$download.pdf <- downloadHandler(
    filename = function() {
      paste("heatmap", Sys.Date(), ".pdf", sep="")
    },
    content = function(file) {
      pdf(file,width = input$hweight,height = input$hweight)
      print(heatmap(input$hfile$datapath,input$hscale,input$hcluster_rows,input$hcluster_cols,input$hclustering_method,input$hborder,input$hcellwidth,input$hcellheight,input$hdisplay_numbers,input$hmain,input$hshow_colnames,input$hshow_rownames,input$hfontsize_number,input$hfontsize))
      dev.off()
    },contentType = 'application/pdf')
  output$download.png <- downloadHandler(
    filename = function() {
      paste("heatmap", Sys.Date(), ".png", sep="")
    },
    content = function(file) {
      png(file,width = input$hweight,height = input$hheight,res = 300)
      print(heatmap(input$hfile$datapath,input$hscale,input$hcluster_rows,input$hcluster_cols,input$hclustering_method,input$hborder,input$hcellwidth,input$hcellheight,input$hdisplay_numbers,input$hmain,input$hshow_colnames,input$hshow_rownames,input$hfontsize_number,input$hfontsize))
      dev.off()
    },contentType = 'image/png')
  output$download.jpeg <- downloadHandler(
    filename = function() {
      paste("box", Sys.Date(), ".jpeg", sep="")
    },
    content = function(file) {
      jpeg(file,width = input$hweight,height = input$hheight,res = 300)
      print(heatmap(input$hfile$datapath,input$hscale,input$hcluster_rows,input$hcluster_cols,input$hclustering_method,input$hborder,input$hcellwidth,input$hcellheight,input$hdisplay_numbers,input$hmain,input$hshow_colnames,input$hshow_rownames,input$hfontsize_number,input$hfontsize))
      dev.off()
    },contentType = 'image/jpeg')
})

