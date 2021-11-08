library(shiny)
library(shinythemes)
library(UpSetR) 
library(plyr)
library(ggplot2)
shinyUI(fluidPage(
  
  titlePanel("MicrobioSee: Upset plot",windowTitle = "MicrobioSee"),
  hr(),
  sidebarLayout(
    sidebarPanel(width = 3,
                 fileInput("ufile1", label = h5("File input")),
                 p("You can download sample data ",a("here", href = "./upset.csv",download="upset.csv")),
                 textInput("ucomparison", label = "Set the columns that need to be displayed", value = "2,4,5,6,9,10,11"),
                 
                 
                 textInput("uylabel", label = "mainbar_y_label",value="mainbarlabel"),
                 textInput("uxlabel", label = "sets_x_label",value="setslabel"),
                 # 
                 # textInput("ugroupone", label = "Comparison group1 name",value="group1"),
                 # textInput("uparameter3", label = "The second set of comparison parameters",value="Drama"),
                 # textInput("uparameter4", label = "The second set of comparison parameters",value="Fantasy"),
                 # textInput("ugrouptwo", label = "Comparison group2 name",value="group2"),
                 # textInput("uparameter5", label = "The third set of comparison parameters",value="Children"),
                 # textInput("uparameter6", label = "The third set of comparison parameters",value="Crime"),
                 # textInput("ugroupthree", label = "Comparison group3 name",value="group3"),
                 # 
                 # selectInput("umodel", label = "Mode selection", 
                 #             choices = list('Scatter plots and histograms', 'two box plots',' Basic diagram'), 
                 #             selected = "Scatter plots and histograms"),
                
                 
                 actionButton("submit1", label=("Go!")),
    ),
    mainPanel(
      div(style="display:inline-block",numericInput("bheight", label = "height input", value = 800)),
      div(style="display:inline-block",numericInput("bwidth", label = "width input", value = 800)),
      plotOutput("upset_plot"),
      hr(),
      downloadButton("download.pdf", label="pdf"),
      downloadButton("download.png", label="png"),
      downloadButton("download.jpeg", label="jpeg"),
    )
  )
))
