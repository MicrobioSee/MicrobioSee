library(shinythemes)
shinyUI(fluidPage(
  theme = shinytheme("paper"),
  # el <- div(HTML("I like <h1>turtles</h1>")),
  # cat(as.character(el)),
  titlePanel(h4("MicrobioSee: Stack column charts"),windowTitle = "MicrobioSee"),
  sidebarLayout(
    sidebarPanel(width = 3,
      fileInput("sfile", label = h5("File input")),

      selectInput("sline", label = h5("straight or curve"), 
                  choices = list("straight", "curve"), 
                  selected = "straight"),
      # selectInput("spic", 
      #             label = "Choose a variable to display",
      #             choices = c("pdf", "png",
      #                         "jpeg"),
      #             selected = "pdf"),
      selectInput("stheme", label = h5("theme"), 
                  choices = list("bw", "classic", "economist", "fivethirtyeight", "map", "base", "wsj", "dark"), 
                  selected = "bw"),
      selectInput("scolor", label = h5("color"), 
                    choices = list("npg", "nejm", "lancet", "rickandmorty", "tron", "grey"), 
                  selected = "npg"),
      numericInput("sheight", label = h5("height"), value = 200),
      numericInput("swidth", label = h5("width"), value = 200),
      selectInput("sunit", label = h5("units"),
                  choices = list("in" , "cm", "mm"),
                  selected = "in"),
      numericInput("snum", label = h5("dpi"), value = 300),
      
      actionButton("submit1", strong("Go!")),
    ),
    mainPanel(
      downloadButton("downloadstack.pdf", "Download pdf-file"),
      downloadButton("downloadstack.png", "Download png-file"),
      downloadButton("downloadstack.jpeg", "Download jpeg-file"),
      plotOutput("stacks")
    )
  )
))
