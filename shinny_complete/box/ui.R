
library(shiny)
library(shinythemes)
library(ggplot2)
library(RLumShiny)
library(shinyBS)

shinyUI(fluidPage(
  
  titlePanel("MicrobioSee:box",windowTitle = "MicrobioSee"),
  hr(),
  sidebarLayout(
    position = "left",
    
    sidebarPanel(width = 3,
      
      # 输入文件
      fileInput("bfile", label = "File input"),
      
      p("You can download sample data ",a("here", href = "./box.csv",download="box.csv")),
      
      # x轴
      textInput("xname", label = "xlab", value = "cyl"),
      
      # y轴
      textInput("yname", label = "ylab", value = "mpg"),
      
      # title设置,main在boxplot中指的是title
      textInput("main", label = "title", value = "test"),
      
      # 是否设置凹痕
      checkboxInput("notch", label = "notch", value = FALSE),
      
      
      # 水平设置
      checkboxInput("horizontal", label = "horizontal", value = FALSE),
      
      ####颜色设置
      h5("color",
         bsButton("color1b", label="?",  style="info", size="small"),
      ),
      bsPopover("color1b", 'Set the color of the box', trigger = "focus"),
      jscolorInput("color", label = NULL, value = "#70CBFF"),
     
     # 高度输入
     # h4("try",bsButton("try1",label = "?",style = "info",size = "small"),),
     # bsPopover("try1",'QAQ',trigger = "focus"),
     # textInput("try", label = NULL, value = 800),
     
     
     
     
     # 宽度输入
     
      br(),
      # 开始按扭
      actionButton("submit1", label = "GO!"),
      
      
      
      ),
  mainPanel(
    #创建下载按钮
    div(style="display:inline-block",numericInput("bheight", label = "height input", value = 800)),
    div(style="display:inline-block",numericInput("bwidth", label = "width input", value = 800)),
    hr(),
    plotOutput("box_plot"),
    hr(),
    downloadButton("download.pdf", label="Download pdf"),
    downloadButton("download.png", label="Download png"),
    downloadButton("download.jpeg", label="Download jpeg"),
    )
      
       
    
    )
    
    
  )
)



