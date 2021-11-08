library(vegan)
library(ggplot2)
library(ape)
library(shiny)
library(shinythemes)

shinyUI(fluidPage(

  titlePanel("MicrobioSee:PCoA",windowTitle = "MicrobioSee"),
  hr(),
  sidebarLayout(
    position = "left",

    sidebarPanel(width = 3,
      # 输入文件
      fileInput("ppdata", label = "Sample abundance data file input"),

      fileInput("ppdata.env", label = "Sample grouping data File input"),
      p("You can download sample data ",a("here", href = "./pcoa.zip",download="pcoa.zip")),

      #GO按键
      actionButton("submit1", label = "GO"),


    ),
    mainPanel(
      #创建下载按钮
      # downloadButton("download.pdf", label="Download_pdf"),
      # downloadButton("download.png", label="Download_png"),
      # downloadButton("download.jpeg", label="Download_jpeg"),
      #
      div(style="display:inline-block",numericInput("bheight", label = "height input", value = 800)),
      div(style="display:inline-block",numericInput("bwidth", label = "width input", value = 800)),
      plotOutput("PCoA_plot"),
      hr(),
      downloadButton("download.pdf", label="pdf"),
      downloadButton("download.png", label="png"),
      downloadButton("download.jpeg", label="jpeg"),
      


      # #设置分页
      # tabsetPanel(
      #
      #   tabPanel("Download_pdf", actionButton("action", label = h5("pdf"))),
      #   tabPanel("Download_png",actionButton("action", label = h5("png"))),
      #   tabPanel("Download_jpeg",actionButton("action", label = h5("jpeg"))),
      #
      # ),
      #输出画图
      


    )


  )
  # mainPanel(
  # titlePanel("PCoA_plot"),
  # ),
  # plotOutput('plot'),
  # 
  # 
  # fluidRow(
  #   
  # 
  #            fileInput("ppdata", label = "Sample abundance data file input"),
  #            fileInput("ppdata.env", label = "Sample grouping data File input"),
  #            actionButton("submit1", label = "GO"),
  #              
  #   ),
  #   
    
  
  
)
)