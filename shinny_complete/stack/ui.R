library(shinythemes)
library(shiny)
library(stringr)
library(shinyBS)
library(DT)
shinyUI(fluidPage(
  # theme = shinytheme("paper"),
  # el <- div(HTML("I like <h1>turtles</h1>")),
  # cat(as.character(el)),
  titlePanel("MicrobioSee: Stack column charts",windowTitle = "MicrobioSee"),
#   callback = JS("
#       
#       var format = function(d) {
#         return '<style type=\"text/css\">		a{	color:black}		div{display:inline-block;background-color:white ;	text-align:justify;text-justify:distribute-all-lines;border: 0px solid white;height:600px;height:800px		}		li{ style=\"display : inline-block;\"		}	</style>
# <div><ul style=\"display : inline-block;color:white\">
# <li ><a href=\"index.html\">Home</a></li>&nbsp;&nbsp;
# <li > <a href=\"services.html\">Models</a></li>&nbsp;&nbsp;
# <li ><a href=\"products.html\">SeeStore</a></li>&nbsp;
# <li ><a href=\"https://microbiosee.github.io/en\" target=\"_blank\">Instruction</a></li>&nbsp;&nbsp;
# <li ><a href=\"about.html\">About</a></li>
# </ul>
# </div>'"),
  hr(),
  sidebarLayout(
    sidebarPanel(width = 3,
      fileInput("sfile", label = h5("File input")),
      p("You can download sample data ",a("here", href = "./stack.csv",download="stack.csv")),
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
      # numericInput("sheight", label = h5("height"), value = 200),
      # numericInput("swidth", label = h5("width"), value = 200),
      # selectInput("sunit", label = h5("units"),
      #             choices = list("in" , "cm", "mm"),
      #             selected = "in"),
      # numericInput("snum", label = h5("dpi"), value = 300),
      
      actionButton("submit1", label=("Go!")),
    ),
    mainPanel(
      div(style="display:inline-block",numericInput("bheight", label = "height input", value = 800)),
      div(style="display:inline-block",numericInput("bwidth", label = "width input", value = 800)),
      plotOutput("stacks"),
      hr(),
      downloadButton("download.pdf", label="pdf"),
      downloadButton("download.png", label="png"),
      downloadButton("download.jpeg", label="jpeg"),
    )
  )
))
