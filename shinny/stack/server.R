#2021-10-19
#author:yimeng sang
library(shiny)
library(reshape2)
library(ggplot2)
library(dbplyr)
library(tidyverse)
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
  down_type(output,input$swidth,input$sheight, input$sunit,input$sdpi,read.csv(file = input$sfile$datapath),input$sline,input$stheme,input$scolor)
  }
  })
})