# ui.R

library(shiny)
library(shinyBS)
library(RLumShiny)

shinyUI(fluidPage(
  titlePanel(h3("shiny pubmed")),
  
  sidebarLayout(
    sidebarPanel(width = 3,
      textInput("API", label = h5("pubmed-API"), value = "6d39f3480ac1537f32e093bd23fd9988c208"),
      textInput("keyword", label = h5("keyword"), value = "Bioinformatics"),
      numericInput("number",label = h5("nuber of paper"),value = 20)
    ),
    mainPanel(
      wordcloud2Output("plot1"),
      DT::dataTableOutput("table")
    )
)
))
