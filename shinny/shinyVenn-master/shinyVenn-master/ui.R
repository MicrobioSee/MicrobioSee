
library(shinythemes)
library(shinyBS)

shinyUI(
  navbarPage(
    title = "Venn", 
    theme = shinytheme("cosmo"), 
    windowTitle = "make venn diagram in R with shiny",
    
    tabPanel(
      "venn diagram",
      
      sidebarPanel(width = 3,
        checkboxInput("data1", HTML("<font color='red'>Data1</font>"), FALSE),
        conditionalPanel(condition="input.data1",
                         radioButtons("seluploaddata1", NULL, c("NULL" = "1", "Upload input date" = "2","Paste input date" = "3"), "1"),
                         conditionalPanel(condition="input.seluploaddata1 == '2'",
                                          fileInput("uploaddata1",h5("Upload data1:",
                                                                     bsButton("bsb01", label="", icon=icon("question"), style="info", size="small")
                                          ), multiple = FALSE),
                                          bsPopover("bsb01", '点击 Browse 上传数据', trigger = "focus"),
                                          textInput("Data1name",h5("Data label:",
                                                                   bsButton("bsb02", label="", icon=icon("question"), style="info", size="small")
                                                                   ),value = "A"),
                                          bsPopover("bsb02", '数据名称', trigger = "focus"),
                                          h5("Data color:",
                                             bsButton("bsb03", label="", icon=icon("question"), style="info", size="small")
                                             ),
                                          bsPopover("bsb03", '确定绘制图片时这组数据的颜色', trigger = "focus"),
                                          fluidRow(column(12, jscolorInput("color1cus", label = NULL, value = "#FF0000")))
                                          ),
                         conditionalPanel(condition="input.seluploaddata1 == '3'",
                                          textAreaInput("pastedata1",h5("Paste data1:",
                                                                     bsButton("bsb04", label="", icon=icon("question"), style="info", size="small")
                                          ), width="200px", resize="vertical", height="200px",placeholder = "One item in one row"),
                                          bsPopover("bsb04", '将你的数据粘贴到文本框内', trigger = "focus"),
                                          textInput("Data1name",h5("Data label:",
                                                                   bsButton("bsb05", label="", icon=icon("question"), style="info", size="small")
                                          ),value = "A"),
                                          bsPopover("bsb05", '数据名称', trigger = "focus"),
                                          h5("Data color:",
                                             bsButton("bsb06", label="", icon=icon("question"), style="info", size="small")
                                          ),
                                          bsPopover("bsb06", '确定绘制图片时这组数据的颜色', trigger = "focus"),
                                          fluidRow(column(12, jscolorInput("color1cus", label = NULL, value = "#FF0000")))
                                          )
                         ),
                                                                       
        checkboxInput("data2", HTML("<font color='red'>Data2</font>"), FALSE),
        conditionalPanel(condition="input.data2",
                         radioButtons("seluploaddata2", NULL, c("NULL" = "1", "Upload input date" = "2","Paste input date" = "3"), "1"),
                         conditionalPanel(condition="input.seluploaddata2 == '2'",
                                          fileInput("uploaddata2",h5("Upload data2:",
                                                                     bsButton("bsb07", label="", icon=icon("question"), style="info", size="small")
                                          ),multiple = FALSE),
                                          bsPopover("bsb07", '点击 "Browse" 上传数据', trigger = "focus"),
                                          textInput("Data2name",h5("Data label:",
                                                                   bsButton("bsb08", label="", icon=icon("question"), style="info", size="small")
                                                                   ),value = "B"),
                                          bsPopover("bsb08", '数据名称', trigger = "focus"),
                                          h5("Data color:",
                                             bsButton("bsb09", label="", icon=icon("question"), style="info", size="small")
                                             ),
                                          bsPopover("bsb09", '确定绘制图片时这组数据的颜色', trigger = "focus"),
                                          fluidRow(column(12, jscolorInput("color2cus", label = NULL, value = "#FFFF00")))
                                          ),
                         conditionalPanel(condition="input.seluploaddata2 == '3'",
                                          textAreaInput("pastedata2",h5("Paste data2:",
                                                                    bsButton("bsb10", label="", icon=icon("question"), style="info", size="small")
                                          ), width="200px", resize="vertical", height="200px",placeholder = "One item in one row"),
                                          bsPopover("bsb10", '将你的数据粘贴到文本框内', trigger = "focus"),
                                          textInput("Data2name",h5("Data label:",
                                                                   bsButton("bsb11", label="", icon=icon("question"), style="info", size="small")
                                          ),value = "B"),
                                          bsPopover("bsb11", '数据名称', trigger = "focus"),
                                          h5("Data color:",
                                             bsButton("bsb012", label="", icon=icon("question"), style="info", size="small")
                                          ),
                                          bsPopover("bsb12", '确定绘制图片时这组数据的颜色', trigger = "focus"),
                                          fluidRow(column(12, jscolorInput("color1cus", label = NULL, value = "#FF0000")))
                                          )
                         ),
        
        checkboxInput("data3", HTML("<font color='red'>Data3</font>"), FALSE),
        conditionalPanel(condition="input.data3",
                         radioButtons("seluploaddata3", NULL, c("NULL" = "1", "Upload input date" = "2","Paste input date" = "3"), "1"),
                         conditionalPanel(condition="input.seluploaddata3 == '2'",
                                          fileInput("uploaddata3",h5("Upload data3:",
                                                                     bsButton("bsb13", label="", icon=icon("question"), style="info", size="small")
                                          ), multiple = FALSE),
                                          bsPopover("bsb13", '点击 "Browse" 上传数据', trigger = "focus"),
                                          textInput("Data3name",h5("Data label:",
                                                                   bsButton("bsb14", label="", icon=icon("question"), style="info", size="small")
                                                                   ),value = "C"),
                                          bsPopover("bsb14", '数据名称', trigger = "focus"),
                                          h5("Data color:",
                                             bsButton("bsb15", label="", icon=icon("question"), style="info", size="small")
                                             ),
                                          bsPopover("bsb15", '确定绘制图片时这组数据的颜色', trigger = "focus"),
                                          fluidRow(column(12, jscolorInput("color3cus", label = NULL, value = "#2F27EE")))
                                                           ),
                         conditionalPanel(condition="input.seluploaddata3 == '3'",
                                          textAreaInput("pastedata3",h5("Paste data3:",
                                                                    bsButton("bsb16", label="", icon=icon("question"), style="info", size="small")
                                          ), width="200px", resize="vertical", height="200px",placeholder = "One item in one row"),
                                          bsPopover("bsb16", '将你的数据粘贴到文本框内', trigger = "focus"),
                                          textInput("Data3name",h5("Data label:",
                                                                   bsButton("bsb17", label="", icon=icon("question"), style="info", size="small")
                                          ),value = "C"),
                                          bsPopover("bsb17", '数据名称', trigger = "focus"),
                                          h5("Data color:",
                                             bsButton("bsb018", label="", icon=icon("question"), style="info", size="small")
                                          ),
                                          bsPopover("bsb18", '确定绘制图片时这组数据的颜色', trigger = "focus"),
                                          fluidRow(column(12, jscolorInput("color1cus", label = NULL, value = "#FF0000")))
                                          )
                         ),
        
        checkboxInput("data4", HTML("<font color='red'>Data4</font>"), FALSE),
        conditionalPanel(condition="input.data4",
                         radioButtons("seluploaddata4", NULL, c("NULL" = "1", "Upload input date" = "2","Paste input date" = "3"), "1"),
                         conditionalPanel(condition="input.seluploaddata4 == '2'",
                                          fileInput("uploaddata4",h5("Upload data4:",
                                                                     bsButton("bsb19", label="", icon=icon("question"), style="info", size="small")
                                          ), multiple = FALSE),
                                          bsPopover("bsb19", '点击 "Browse" 上传数据', trigger = "focus"),
                                          textInput("Data4name",h5("Data label:",
                                                                   bsButton("bsb20", label="", icon=icon("question"), style="info", size="small")
                                                                   ),value = "D"),
                                          bsPopover("bsb20", '数据名称', trigger = "focus"),
                                          h5("Data color:",
                                             bsButton("bsb21", label="", icon=icon("question"), style="info", size="small")
                                             ),
                                          bsPopover("bsb21", '确定绘制图片时这组数据的颜色', trigger = "focus"),
                                          fluidRow(column(12, jscolorInput("color4cus", label = NULL, value = "#00EE02")))
                                                           ),
                         conditionalPanel(condition="input.seluploaddata4 == '3'",
                                          textAreaInput("pastedata4",h5("Paste data4:",
                                                                    bsButton("bsb22", label="", icon=icon("question"), style="info", size="small")
                                          ),width="200px", resize="vertical", height="200px",placeholder = "One item in one row"),
                                          bsPopover("bsb22", '将你的数据粘贴到文本框内', trigger = "focus"),
                                          textInput("Data4name",h5("Data label:",
                                                                   bsButton("bsb23", label="", icon=icon("question"), style="info", size="small")
                                          ),value = "D"),
                                          bsPopover("bsb23", '数据名称', trigger = "focus"),
                                          h5("Data color:",
                                             bsButton("bsb024", label="", icon=icon("question"), style="info", size="small")
                                          ),
                                          bsPopover("bsb24", '确定绘制图片时这组数据的颜色', trigger = "focus"),
                                          fluidRow(column(12, jscolorInput("color1cus", label = NULL, value = "#FF0000")))
                                          )
                         ),
        
        checkboxInput("data5", HTML("<font color='red'>Data5</font>"), FALSE),
        conditionalPanel(condition="input.data5",
                         radioButtons("seluploaddata5", NULL, c("NULL" = "1", "Upload input date" = "2","Paste input date" = "3"), "1"),
                         conditionalPanel(condition="input.seluploaddata5 == '2'",
                                          fileInput("uploaddata5",h5("Upload data5:",
                                                                     bsButton("bsb25", label="", icon=icon("question"), style="info", size="small")
                                          ), multiple = FALSE),
                                          bsPopover("bsb25", '点击 "Browse" 上传数据', trigger = "focus"),
                                          textInput("Data5name",h5("Data label:",
                                                                   bsButton("bsb26", label="", icon=icon("question"), style="info", size="small")
                                                                   ),value = "E"),
                                          bsPopover("bsb26", '数据名称', trigger = "focus"),
                                          h5("Data color:",
                                             bsButton("bsb27", label="", icon=icon("question"), style="info", size="small")
                                             ),
                                          bsPopover("bsb27", '确定绘制图片时这组数据的颜色', trigger = "focus"),
                                          fluidRow(column(12, jscolorInput("color5cus", label = NULL, value = "#CCDDEE")))
                                                           ),
                         conditionalPanel(condition="input.seluploaddata5 == '3'",
                                          textAreaInput("pastedata5",h5("Paste data5:",
                                                                    bsButton("bsb28", label="", icon=icon("question"), style="info", size="small")
                                          ), width="200px", resize="vertical", height="200px",placeholder = "One item in one row"),
                                          bsPopover("bsb28", '将你的数据粘贴到文本框内', trigger = "focus"),
                                          textInput("Data5name",h5("Data label:",
                                                                   bsButton("bsb29", label="", icon=icon("question"), style="info", size="small")
                                          ),value = "E"),
                                          bsPopover("bsb29", '数据名称', trigger = "focus"),
                                          h5("Data color:",
                                             bsButton("bsb030", label="", icon=icon("question"), style="info", size="small")
                                          ),
                                          bsPopover("bsb30", '确定绘制图片时这组数据的颜色', trigger = "focus"),
                                          fluidRow(column(12, jscolorInput("color1cus", label = NULL, value = "#FF0000")))
                                          )
                         ),
        
        checkboxInput("data6", HTML("<font color='red'>Data6</font>"), FALSE),
        conditionalPanel(condition="input.data6",
                         radioButtons("seluploaddata6", NULL, c("NULL" = "1", "Upload input date" = "2","Paste input date" = "3"), "1"),
                         conditionalPanel(condition="input.seluploaddata6 == '2'",
                                          fileInput("uploaddata6",h5("Upload data6:",
                                                                     bsButton("bsb31", label="", icon=icon("question"), style="info", size="small")
                                          ), multiple = FALSE),
                                          bsPopover("bsb31", '点击 "Browse" 上传数据', trigger = "focus"),
                                          textInput("Data6name",h5("Data label:",
                                                                   bsButton("bsb32", label="", icon=icon("question"), style="info", size="small")
                                                                   ),value = "F"),
                                          bsPopover("bsb32", '数据名称', trigger = "focus"),
                                          h5("Data color:",
                                             bsButton("bsb33", label="", icon=icon("question"), style="info", size="small")
                                             ),
                                          bsPopover("bsb33", '确定绘制图片时这组数据的颜色', trigger = "focus"),
                                          fluidRow(column(12, jscolorInput("color6cus", label = NULL, value = "#FF8623")))
                                          ),
                         conditionalPanel(condition="input.seluploaddata6 == '3'",
                                          textAreaInput("pastedata6",h5("Paste data6:",
                                                                    bsButton("bsb34", label="", icon=icon("question"), style="info", size="small")
                                          ), width="200px", resize="vertical", height="200px",placeholder = "One item in one row"),
                                          bsPopover("bsb34", '将你的数据粘贴到文本框内', trigger = "focus"),
                                          textInput("Data6name",h5("Data label:",
                                                                   bsButton("bsb35", label="", icon=icon("question"), style="info", size="small")
                                          ),value = "F"),
                                          bsPopover("bsb35", '数据名称', trigger = "focus"),
                                          h5("Data color:",
                                             bsButton("bsb036", label="", icon=icon("question"), style="info", size="small")
                                          ),
                                          bsPopover("bsb36", '确定绘制图片时这组数据的颜色', trigger = "focus"),
                                          fluidRow(column(12, jscolorInput("color1cus", label = NULL, value = "#FF0000")))
                                          )
                         ),
        
        checkboxInput("data7", HTML("<font color='red'>Data7</font>"), FALSE),
        conditionalPanel(condition="input.data7",
                         radioButtons("seluploaddata7", NULL, c("NULL" = "1", "Upload input date" = "2","Paste input date" = "3"), "1"),
                         conditionalPanel(condition="input.seluploaddata7 == '2'",
                                          fileInput("uploaddata7",h5("Upload data7:",
                                                                     bsButton("bsb37", label="", icon=icon("question"), style="info", size="small")
                                          ), multiple = FALSE),
                                          bsPopover("bsb37", '点击 "Browse" 上传数据', trigger = "focus"),
                                          textInput("Data7name",h5("Data label:",
                                                                   bsButton("bsb38", label="", icon=icon("question"), style="info", size="small")
                                                                   ),value = "G"),
                                          bsPopover("bsb38", '数据名称', trigger = "focus"),
                                          h5("Data color:",
                                             bsButton("bsb39", label="", icon=icon("question"), style="info", size="small")
                                             ),
                                          bsPopover("bsb39", '确定绘制图片时这组数据的颜色', trigger = "focus"),
                                          fluidRow(column(12, jscolorInput("color7cus", label = NULL, value = "#CC1344")))
                                                           ),
                         conditionalPanel(condition="input.seluploaddata7 == '3'",
                                          textAreaInput("pastedata7",h5("Paste data7:",
                                                                    bsButton("bsb40", label="", icon=icon("question"), style="info", size="small")
                                          ), width="200px", resize="vertical", height="200px",placeholder = "One item in one row"),
                                          bsPopover("bsb40", '将你的数据粘贴到文本框内', trigger = "focus"),
                                          textInput("Data7name",h5("Data label:",
                                                                   bsButton("bsb41", label="", icon=icon("question"), style="info", size="small")
                                          ),value = "G"),
                                          bsPopover("bsb41", '数据名称', trigger = "focus"),
                                          h5("Data color:",
                                             bsButton("bsb42", label="", icon=icon("question"), style="info", size="small")
                                          ),
                                          bsPopover("bsb42", '确定绘制图片时这组数据的颜色', trigger = "focus"),
                                          fluidRow(column(12, jscolorInput("color1cus", label = NULL, value = "#FF0000")))
                                          )
                         ),
        
        actionButton("submit1", strong("Go!")),
        
        br(),
        h4("Plot options"),
        
        checkboxInput("vennSize", "Adjust plot size", FALSE),
        conditionalPanel(
          condition = "input.vennSize",
          numericInput("vennHeight", "Plot height:", value = 550),
          numericInput("vennWidth", "Plot width:", value = 750)),
        
        sliderInput("labelsize", h5("Set label font size",
                                      bsButton("bsb43", label="", icon=icon("question"), style="info", size="small")
                                      ), min=0.5, max=2, value=0.8, step=0.1),
        bsPopover("bsb43", "设置标签字体的大小", trigger = "focus"),
        sliderInput("textsize", h5("Intersection label font size",
                                      bsButton("bsb44", label="", icon=icon("question"), style="info", size="small")
        ), min=0.5, max=2, value=0.8, step=0.1),
        
        
        bsPopover("bsb44", "设置交集字体的大小", trigger = "focus")
        ),
       
      mainPanel(
        downloadButton("downloadvenn.pdf", "Download pdf-file"),
        downloadButton("downloadvenn.svg", "Download svg-file"),
        downloadButton("downloadvenn.csv", "Download csv-file"),
      
        plotOutput("venn", height = '100%', width = '100%'))
      ),
    tabPanel("Help",includeHTML("Help.html")),
    tabPanel("About",includeMarkdown("About.md"))
    )
  )


    
    
    
    
  
