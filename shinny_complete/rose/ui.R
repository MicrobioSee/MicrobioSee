library(shiny)
library(shinythemes)
library(RLumShiny)
library(shinyBS)
library(ggplot2)

shinyUI(fluidPage(
  
  # theme = shinytheme("paper"),
  titlePanel("MicrobioSee:bar & rose",windowTitle = "MicrobioSee"),
  
  sidebarLayout(
    sidebarPanel(width=3,
      # 输入文件
      fileInput("rfile", label = h5("File input")),
      p("You can download sample data ",a("here", href = "./rose.csv",download="rose.csv")),
      # type设置
      selectInput("type", label = h5("type"),
                  choices = list("rose" , "bar"), 
                  selected = "rose"),
      # x轴设???
      textInput("xname", label = h5("xname"), value = "gene"),
      # y轴设???
      textInput("yname", label = h5("yname"), value = "difference"),
      # # title设置
      # textInput("title", label = h5("title"), value = "Differential gene rose"),
      #color1
      h5("First color",
         bsButton("color1", label="?",  style="info", size="small")
      ),
      bsPopover("color1", '选择绘图的开始颜色', trigger = "focus"),
      fluidRow(column(12, jscolorInput("rcolor1", label = NULL, value = "#6BE1FF"))),
      ##color2
      h5("Last color",
         bsButton("color2", label="?",  style="info", size="small")
      ),
      bsPopover("color2", '选择绘图的结束颜色', trigger = "focus"),
      fluidRow(column(12, jscolorInput("rcolor2", label = NULL, value = "#F59EFF"))),
      # 
      # # bar_width设置
      # textInput("bar_width", label = h5("bar_width"), value = "1"),
      # # lab_Fontsize设置
      # textInput("lab_Fontsize", label = h5("lab_Fontsize"), value = "20"),
      # 
      # # lab_Fontcolor设置
      # h5("lab_Fontcolor",
      #    bsButton("lab_Fontcolor", label="lab_Fontcolor",  style="info", size="small")
      # ),
      # bsPopover("bsb42", '确定绘制图片时这组数据的颜色', trigger = "focus"),
      # fluidRow(column(12, jscolorInput("lab_Fontcolor", label = NULL, value = "#FF0000"))),
      # 
      # 
      # 
      # # label_Fontsize设置
      # textInput("label_Fontsize", label = h5("label_Fontsize"), value = "10"),
      # 
      # 
      # # #label_Fontcolor,color
      # h5("label_Fontcolor",
      #    bsButton("label_Fontcolor", label="label_Fontcolor",  style="info", size="small")
      # ),
      # bsPopover("bsb42", '确定绘制图片时这组数据的颜色', trigger = "focus"),
      # fluidRow(column(12, jscolorInput("rlabel_Fontcolor", label = NULL, value = "#FF0000"))),
      # 
      # 
      # # background_color,color
      # h5("background_color",
      #    bsButton("background_color", label="background_color",  style="info", size="small")
      # ),
      # bsPopover("bsb42", '确定绘制图片时这组数据的颜色', trigger = "focus"),
      # fluidRow(column(12, jscolorInput("rbackground_color", label = NULL, value = "#FF0000"))),
      # 
      # 
      # # Border_color,color
      # h5("Border_color",
      #    bsButton("Border_color", label="Border_color",  style="info", size="small")
      # ),
      # bsPopover("bsb42", '确定绘制图片时这组数据的颜色', trigger = "focus"),
      # fluidRow(column(12, jscolorInput("rBorder_color", label = NULL, value = "#FF0000"))),
      # # 高度输入
      # textInput("height", label = h5("height input"), value = 100),
      # # 宽度输入
      # textInput("width", label = h5("width input"), value = 100),
      # # dpi分辨率设???
      # textInput("dpi", label = h5("dpi"), value = "300"),
      #GO按键
      actionButton("submit1", label =("GO!"))
      
      
      
    ),
    mainPanel(
      
      div(style="display:inline-block",numericInput("bheight", label = "height input", value = 800)),
      div(style="display:inline-block",numericInput("bwidth", label = "width input", value = 800)),
      plotOutput("rose_plot"),
      hr(),
      downloadButton("download.pdf", label="pdf"),
      downloadButton("download.png", label="png"),
      downloadButton("download.jpeg", label="jpeg"),
    )
    
    
    
  )
  
  
)
)