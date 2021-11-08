library(shiny)
library(shinythemes)
library(RLumShiny)
library(shinyBS)
shinyUI(fluidPage(
  titlePanel(h2("venn_plot")),
  hr(),
  sidebarLayout(
    position = "left",
    
    sidebarPanel(
      # 输入文件1
      fileInput("file", label = h5("data1")),
      textInput("text", label = h5("data1name"), value = ""),
      
      #设置颜色盘
      h5("data1color",
      bsButton("bsb42", label="",  style="info", size="small"),
      ),
      bsPopover("bsb42", '确定绘制图片时这组数据的颜色', trigger = "focus"),
      fluidRow(column(12, jscolorInput("data1color", label = NULL, value = "#FF0000"))),
      
      # 输入文件2
      fileInput("file", label = h5("data2")),
      textInput("text", label = h5("data2name"), value = ""),
      #设置颜色盘
      h5("data2color",
         bsButton("bsb42", label="",  style="info", size="small"),
      ),
      bsPopover("bsb42", '确定绘制图片时这组数据的颜色', trigger = "focus"),
      fluidRow(column(12, jscolorInput("data2color", label = NULL, value = "#FF0000"))),
      
      # 输入文件3
      fileInput("file", label = h5("data3")),
      textInput("text", label = h5("data3name"), value = ""),
      #设置颜色盘
      h5("data3color",
         bsButton("bsb42", label="",  style="info", size="small"),
      ),
      bsPopover("bsb42", '确定绘制图片时这组数据的颜色', trigger = "focus"),
      fluidRow(column(12, jscolorInput("data3color", label = NULL, value = "#FF0000"))),
      
      # 输入文件4
      fileInput("file", label = h5("data4")),
      textInput("text", label = h5("data4name"), value = ""),
      #设置颜色盘
      h5("datda4color",
         bsButton("bsb42", label="",  style="info", size="small"),
      ),
      bsPopover("bsb42", '确定绘制图片时这组数据的颜色', trigger = "focus"),
      fluidRow(column(12, jscolorInput("cdata4color", label = NULL, value = "#FF0000"))),
      
      # 输入文件5
      
      fileInput("file", label = h5("data5")),
      textInput("text", label = h5("data5name"), value = ""),
      #设置颜色盘
      h5("data5color",
         bsButton("bsb42", label="",  style="info", size="small"),
      ),
      bsPopover("bsb42", '确定绘制图片时这组数据的颜色', trigger = "focus"),
      fluidRow(column(12, jscolorInput("data5color", label = NULL, value = "#FF0000"))),
      
      
      
      fileInput("file", label = h5("data6")),
      textInput("text", label = h5("data6name"), value = ""),
      #设置颜色盘
      h5("data6color",
         bsButton("bsb42", label="",  style="info", size="small"),
      ),
      bsPopover("bsb42", '确定绘制图片时这组数据的颜色', trigger = "focus"),
      fluidRow(column(12, jscolorInput("data6color", label = NULL, value = "#FF0000"))),
      
      
      fileInput("file", label = h5("data7")),
      textInput("text", label = h5("data7name"), value = ""),
      #设置颜色盘
      h5("data7color",
         bsButton("bsb42", label="",  style="info", size="small"),
      ),
      bsPopover("bsb42", '确定绘制图片时这组数据的颜色', trigger = "focus"),
      fluidRow(column(12, jscolorInput("data7color", label = NULL, value = "#FF0000"))),
      
      
      
      # 输入opacity
      textInput("text", label = h5("opacity"), value = ""),
      
      # 输入ilcs
      textInput("text", label = h5("ilcs"), value = ""),
      
      #box判断？？？？？？？？
      
      # 高度输入
      textInput("text", label = h5("height input"), value = 1),
      
      # 宽度输入
      textInput("text", label = h5("width input"), value = 1),
      
      
      # dpi分辨率设置
      textInput("text", label = h5("dpi"), value = ""),
      # 单位设置
      radioButtons("radio", label = h5("unit"),
                   choices = list("in" , "cm" , "mm" ), 
                   selected = 1),
      
      
      
      # 开始按钮
      actionButton("action", label = h5("GO")),
      
      
    ),
    mainPanel(
      #创建下载按钮
      downloadButton("download", label="Download_pdf"),
      downloadButton("download", label="Download_png"),
      downloadButton("download", label="Download_jpeg"),
      downloadButton("download", label="Download_svg"),
      
      
    )
    
    
  )
  
  
)
)