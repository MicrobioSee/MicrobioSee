
library(shiny)
library(shinythemes)
shinyUI(fluidPage(
  titlePanel(h2("box_plot")),
  hr(),
  sidebarLayout(
    position = "left",
    
    sidebarPanel(
      # 输入文件
      fileInput("file1", label = h5("File input")),
      
      # 高度输入
      textInput("height", label = h5("height input"), value = 1),
      
      # 宽度输入
      textInput("width", label = h5("width input"), value = 1),
      
      # x轴设置
      textInput("xlab", label = h5("xlab"), value = ""),
      
      # y轴设置
      textInput("ylab", label = h5("ylab"), value = ""),
      
      # title设置
      textInput("plottitle", label = h5("title"), value = ""),
      
      # 是否设置凹痕
      checkboxInput("notch", label = h5("notch"), value = TRUE),
      
      ###name1
      textInput("name1", label = h5("name1"), value = ""),
      
      h5("color1",
         bsButton("color1", label="",  style="info", size="small"),
      ),
      bsPopover("color1", '确定绘制图片时这组数据的颜色', trigger = "focus"),
      fluidRow(column(12, jscolorInput("color1", label = NULL, value = "#FF0000"))),
      
      ###name2
      textInput("name2", label = h5("name2"), value = ""),
      
      h5("color2",
         bsButton("color2", label="",  style="info", size="small"),
      ),
      bsPopover("color2", '确定绘制图片时这组数据的颜色', trigger = "focus"),
      fluidRow(column(12, jscolorInput("color2", label = NULL, value = "#FF0000"))),
      
      ###name3
      textInput("name3", label = h5("name3"), value = ""),
      
      h5("color3",
         bsButton("color3", label="",  style="info", size="small"),
      ),
      bsPopover("color3", '确定绘制图片时这组数据的颜色', trigger = "focus"),
      fluidRow(column(12, jscolorInput("color3", label = NULL, value = "#FF0000"))),
      
      # 水平设置
      checkboxInput("horizontal", label = h5("horizontal"), value = TRUE),
      
      # 开始按钮
      actionButton("action", label = h5("GO")),
      
      
      
      ),
  mainPanel(
    #创建下载按钮
    downloadButton("download", label="Download_pdf"),
    downloadButton("download", label="Download_png"),
    downloadButton("download", label="Download_jpeg"),
    plotOutput("boxplot")
    )
      
       
    
    )
    
    
  )
)



