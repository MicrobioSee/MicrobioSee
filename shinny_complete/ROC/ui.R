library(shiny)
library(shinythemes)
shinyUI(fluidPage(
  #theme = shinytheme("paper"),
  titlePanel("MicrobioSee:ROC",windowTitle = "MicrobioSee"),
  hr(),
  sidebarLayout(
    sidebarPanel(width = 3,
      # fiel,outcome,outcome_colum,index1,index1_colum,index2,index2_colum,index3,index3_colum
      fileInput("Rfile", label = "File input"),
      p("You can download sample data ",a("here", href = "./ROC.csv",download="ROC.csv")),
      textInput("Routcome", label = "State variables", value = "outcome"),
      numericInput("Routcome_colum", label = "The column number of the state variable",value=NULL),
      textInput("Rindex1", label = "Test variable1", value = "index1"),
      numericInput("Rindex1_colum", label = "The column number of the test variable1",value=NULL),
      textInput("Rindex2", label = "Test variable2", value = "index2"),
      numericInput("Rindex2_colum", label = "The column number of the test variable2",value =NULL),
      textInput("Rindex3", label = "Test variable3", value = "index3"),
      numericInput("Rindex3_colum", label = "The column number of the test variable3",value=NULL),
      actionButton("submit1", label ="GO!")
    ),
    mainPanel(
      div(style="display:inline-block",numericInput("bheight", label = "height input", value = 800)),
      div(style="display:inline-block",numericInput("bwidth", label = "width input", value = 800)),
      # downloadButton("download.pdf", label="Download_pdf"),
      # downloadButton("download.png", label="Download_png"),
      # downloadButton("download.jpeg", label="Download_jpeg"),
      # downloadButton("download.svg", label="Download_svg"),
      plotOutput("ROC_plot"),
      hr(),
      downloadButton("download.pdf", label="pdf"),
      downloadButton("download.png", label="png"),
      downloadButton("download.jpeg", label="jpeg"),
    )
    
    
    
  )
)
  
  
)
