library(shiny)
library(shinythemes)
library(yarrr)
shinyUI(fluidPage(

  titlePanel("MicrobioSee:pirates",windowTitle = "MicrobioSee"),
  hr(),
  sidebarLayout(
    position = "left",
    
    sidebarPanel(width = 3,
      # 输入文件
      fileInput("pfile", label = "File input"),
      p("You can download sample data ",a("here", href = "./pirates.csv",download="pirates.csv")),
      # main输入?????是main还是mian？？？
      textInput("pmain", label = "main", value = "example"),
      
      # pal设置
      selectInput("ppal", label = "pal",
                  choices = list("basel" , "pony" ,"xmen","decision","southpark","google","eternal","evildead","usualsuspects","ohbrother","appletv","brave","bugs","cars","nemo","rat","up","espresso","ipod","info","info2"), 
                  selected = 1),
      # theme设置
      selectInput("ptheme", label = "theme",
                  choices = list("0" , "1" ,"2","3","4"), 
                  selected = 1),
      # inf.method设置
      selectInput("pinf", label = "inf.method",
                  choices = list("hdi" , "ci" ,"iqr"), 
                  selected = 1),
      #GO按键
      actionButton("submit1", label ="GO！"),
      
    ),
    mainPanel(
      div(style="display:inline-block",numericInput("bheight", label = "height input", value = 800)),
      div(style="display:inline-block",numericInput("bwidth", label = "width input", value = 800)),
      plotOutput("pirates_plot"),
      hr(),
      downloadButton("download.pdf", label="pdf"),
      downloadButton("download.png", label="png"),
      downloadButton("download.jpeg", label="jpeg"),
    )
    
    
    
  )
  
  
)
)



