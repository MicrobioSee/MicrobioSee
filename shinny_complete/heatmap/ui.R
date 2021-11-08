library(shiny)
library(shinythemes)
library(pheatmap)

shinyUI(fluidPage(
  
  titlePanel("heatmap_plot",windowTitle = "MicrobioSee"),
  hr(),
  sidebarLayout(
    position = "left",
    sidebarPanel(width = 3,
      # 输入文件
      fileInput("hfile", label = "File input"),
      p("You can download sample data ",a("here", href = "./heatmap.csv",download="heatmap.csv")),
      # scale设置
      selectInput("hscale", label = "scale",
                  choices = list("row","column","none"), 
                  selected = 3),
      # cluster_rows设置
      checkboxInput("hcluster_rows", label = "cluster_rows", value = TRUE),
      # radioButtons("radio", label = h5("cluster_rows"),
      #              choices = list("ture" = 1, "false" = 2), 
      #              selected = 1),
      # cluster_cols设置
      checkboxInput("hcluster_cols", label = "cluster_cols", value = TRUE),
      # radioButtons("radio", label = h5("cluster_cols"),
      #              choices = list("ture" = 1, "false" = 2), 
      #              selected = 1),
      # clustering_method设置
      selectInput("hclustering_method", label = "clustering_method",
                   choices = list("ward","ward.D","ward.D2","single","complete","average","mcquitty","median","centroid"), 
                   selected = 5),
      # border设置\
      checkboxInput("hborder", label = "border", value = TRUE),
      # radioButtons("radio", label = h5("border"),
      #              choices = list("ture" = 1, "false" = 2), 
      #              selected = 1),
      #cellwidth文字输入
      textInput("hcellwidth", label = "cellwidth", value = 15),
      #cellheight文字输入
      textInput("hcellheight", label = "cellheight", value = 15),
      # display_numbers设置
      checkboxInput("hdisplay_numbers", label = "display_numbers", value = TRUE),
      # radioButtons("radio", label = h5("display_numbers"),
      #              choices = list("ture" = 1, "false" = 2), 
      #              selected = 1),
      #main文字输入
      textInput("hmain", label = "main", value = "text gene"),
      #show_colnames文字输入
      checkboxInput("hshow_colnames", label = "show_colnames", value = TRUE),
      # radioButtons("radio", label = h5("show_colnames"),
      #              choices = list("ture" = 1, "false" = 2), 
      #              selected = 1),
      #show_rownames文字输入
      checkboxInput("hshow_rownames", label = "show_rownames", value = TRUE),
      
      # radioButtons("radio", label = h5("show_rownames"),
      #              choices = list("ture" = 1, "false" = 2), 
      #              selected = 1),
      #fontsize_number文字输入
      textInput("hfontsize_number", label = "fontsize_number", value = 5),
      #fontsize文字输入
      textInput("hfontsize", label = "fontsize", value = 7),
      #height文字输入
      #textInput("hheight", label = "height", value = 10),
      #width文字输入
      #textInput("hwidth", label = "width", value = 10),
      #res文字输入
      textInput("hres", label = "res", value = 300),
      
      #GO按键
      actionButton("submit1", label = "GO"),
      
      
    ),
    mainPanel(
      div(style="display:inline-block",numericInput("hheight", label = "height input", value = 800)),
      div(style="display:inline-block",numericInput("hwidth", label = "width input", value = 800)),
      hr(),
      plotOutput("heatmap_plot"),
      hr(),
      downloadButton("download.pdf", label="Download pdf"),
      downloadButton("download.png", label="Download png"),
      downloadButton("download.jpeg", label="Download jpeg")
      
      
    )
    
    
  )
  
  
)
)