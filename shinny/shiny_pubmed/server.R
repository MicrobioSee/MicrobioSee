# server.R

library(shiny)
library(pubmedR)
library(PubMedWordcloud)
library(wordcloud2)
library(stringr)
library(shinyBS)
library(DT)
source("pubmed.R")

shinyServer(function(input, output) {
  observe({
  
  output$table = renderDataTable(server = FALSE,{
    M <<- get_all(input$API,input$keyword,input$number)
    dt <- datatable(
      cbind(' ' = '&oplus;', M),
      rownames = FALSE,
      escape = -1,
      options = list(
        columnDefs = list(
          list(visible = FALSE, targets = c( 8, 11, 12, 28, 2,23,24,1,10,17,25,9,13,14,16,18)),
          list(orderable = FALSE, className = 'details-control', targets = 0)
        )
      ),
      callback = JS("
      table.column(1).nodes().to$().css({cursor: 'pointer'});
      var format = function(d) {
        return '<table cellpadding=\"5\" cellspacing=\"0\" border=\"0\" style=\"padding-left:50px;\">'+
            '<tr>'+
                '<td>keywords:</td>'+
                '<td>'+d[8]+'</td>'+
            '</tr>'+
            '<tr>'+
                '<td>AB:</td>'+
                '<td>'+d[11]+'</td>'+
            '</tr>'+
            '<tr>'+
                '<td>Department:</td>'+
                '<td>'+d[12]+'</td>'+
            '</tr>'+
            '<tr>'+
                '<td>Dp-detail:</td>'+
                '<td>'+d[28]+'</td>'+
            '</tr>'+
            '<tr>'+
                '<td>AF:</td>'+
                '<td>'+d[2]+'</td>'+
            '</tr>'+
        '</table>';
      };
      table.on('click', 'td.details-control', function() {
        var td = $(this), row = table.row(td.closest('tr'));
        if (row.child.isShown()) {
          row.child.hide();
          td.html('&oplus;');
        } else {
          row.child(format(row.data())).show();
          td.html('&CircleMinus;');
        }
      });"
      ))
    })
  
  output$plot1 = renderWordcloud2({
      s = input$table_rows_selected
      if (length(s)) {
        abs <- ""
        for (i in s) {
          abs <- paste(abs,M[,11][i],sep = " ")
          }

      get_worldcloud(abs)

      }else{
        wordcloud2(demoFreq)
        }
      })
  })
})