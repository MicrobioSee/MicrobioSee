#2021-10-19
#author:yimeng sang
library(shiny)
library(reshape2)
library(ggplot2)
library(dbplyr)
library(plyr)
# library(tidyverse)
library(ggthemes)
library(ggsci)
source("stack_column_charts.R")
shinyServer(function(input, output) {
  observe({
  if (input$submit1>0) {
    output$stacks <- renderPlot({
      # req(exists(input$file1, "package:datasets", inherits = FALSE),cancelOutput = TRUE)
      # infile <- input$sfile
      data <- read.csv(file = input$sfile$datapath)
      # pic <- input$spic
      width <- input$swidth
      height <- input$sheight
      unit <- input$sunit
      dpi <- input$sdpi
      sline <- input$sline
      stheme <- input$stheme
      color <- input$scolor
      stack(data,sline,stheme,color)
     
  })
  
  }
  })
  output$download.pdf <- downloadHandler(
    filename = function() {
      paste("stack", Sys.Date(), ".pdf", sep="")
    },
    content = function(file) {
      pdf(file)
      data <- read.csv(file = input$sfile$datapath)
      # pic <- input$spic
      width <- input$swidth
      height <- input$sheight
      unit <- input$sunit
      dpi <- input$sdpi
      sline <- input$sline
      stheme <- input$stheme
      color <- input$scolor
      print(stack(data,sline,stheme,color))
      
      dev.off()
    },contentType = 'application/pdf')
  output$download.png <- downloadHandler(
    filename = function() {
      paste("stack", Sys.Date(), ".png", sep="")
    },
    content = function(file) {
      png(file,width = input$bwidth,height = input$bheight,res = 300,type="cairo")
      data <- read.csv(file = input$sfile$datapath)
      # pic <- input$spic
      width <- input$swidth
      height <- input$sheight
      unit <- input$sunit
      dpi <- input$sdpi
      sline <- input$sline
      stheme <- input$stheme
      color <- input$scolor
      print(stack(data,sline,stheme,color))
      dev.off()
    },contentType = 'image/png')
  output$download.jpeg <- downloadHandler(
    filename = function() {
      paste("stack", Sys.Date(), ".jpeg", sep="")
    },
    content = function(file) {
      jpeg(file,width = input$bwidth,height = input$bheight,res = 300)
      data <- read.csv(file = input$sfile$datapath)
      # pic <- input$spic
      width <- input$swidth
      height <- input$sheight
      unit <- input$sunit
      dpi <- input$sdpi
      sline <- input$sline
      stheme <- input$stheme
      color <- input$scolor
      print(stack(data,sline,stheme,color))
      dev.off()
    },contentType = 'image/jpeg')
})