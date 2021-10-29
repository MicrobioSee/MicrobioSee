
options(shiny.maxRequestSize = 200*1024^2)

shinyServer(function(input, output, session) {
  
  # venn
  observe({
    if (input$submit1>0) {
      isolate({
        venn.height <<- input$vennHeight
        venn.width <<- input$vennWidth
        
        data1 <- NULL
        data1name <- NULL
        color1<-NULL
        if(input$seluploaddata1 == "2" && !is.null(input$uploaddata1)){
          data1 <- readLines(input$uploaddata1$datapath)
          data1name <- input$Data1name
          color1<-input$color1cus
        }else {
          NULL
        }
        if(input$seluploaddata1 == "3" && !is.null(input$pastedata1)){
          data1 <- unlist(strsplit(input$pastedata1,split="\\n"))
          data1name <- input$Data1name
          color1<-input$color1cus
        }else {
          NULL
        }
        
        data2 <- NULL
        data2name <- NULL
        color2<-NULL
        if(input$seluploaddata2 == "2" && !is.null(input$uploaddata2)){
          data2 <- readLines(input$uploaddata2$datapath)
          data2name <- input$Data2name
          color2<-input$color2cus
        }else {
          NULL
        }
        if(input$seluploaddata2 == "3" && !is.null(input$pastedata2)){
          data2 <- unlist(strsplit(input$pastedata2,split="\\n"))
          data2name <- input$Data2name
          color2<-input$color2cus
        }else {
          NULL
        }
        
        data3 <- NULL
        data3name <- NULL
        color3<-NULL
        if(input$seluploaddata3 == "2" && !is.null(input$uploaddata3)){
          data3 <- readLines(input$uploaddata3$datapath)
          data3name <- input$Data3name
          color3<-input$color3cus
        }else {
          NULL
        }
        if(input$seluploaddata3 == "3" && !is.null(input$pastedata3)){
          data3 <- unlist(strsplit(input$pastedata3,split="\\n"))
          data3name <- input$Data3name
          color3<-input$color3cus
        }else {
          NULL
        }
        
        data4 <- NULL
        data4name <- NULL
        color4<-NULL
        if(input$seluploaddata4 == "2" && !is.null(input$uploaddata4)){
          data4 <- readLines(input$uploaddata4$datapath)
          data4name <- input$Data4name
          color4<-input$color4cus
        }else {
          NULL
        }
        if(input$seluploaddata4 == "3" && !is.null(input$pastedata4)){
          data4 <- unlist(strsplit(input$pastedata4,split="\\n"))
          data4name <- input$Data4name
          color4<-input$color4cus
        }else {
          NULL
        }
        
        data5 <- NULL
        data5name <- NULL
        color5<-NULL
        if(input$seluploaddata5 == "2" && !is.null(input$uploaddata5)){
          data5 <- readLines(input$uploaddata5$datapath)
          data5name <- input$Data5name
          color5<-input$color5cus
        }else {
          NULL
        }
        if(input$seluploaddata5 == "3" && !is.null(input$pastedata5)){
          data5 <- unlist(strsplit(input$pastedata5,split="\\n"))
          data5name <- input$Data5name
          color5<-input$color5cus
        }else {
          NULL
        }
        
        data6 <- NULL
        data6name <- NULL
        color6<-NULL
        if(input$seluploaddata6 == "2" && !is.null(input$uploaddata6)){
          data6 <- readLines(input$uploaddata6$datapath)
          data6name <- input$Data6name
          color6<-input$color6cus
        }else {
          NULL
        }
        if(input$seluploaddata6 == "3" && !is.null(input$pastedata6)){
          data6 <- unlist(strsplit(input$pastedata6,split="\\n"))
          data6name <- input$Data6name
          color6<-input$color6cus
        }else {
          NULL
        }
        
        data7 <- NULL
        data7name <- NULL
        color7<-NULL
        if(input$seluploaddata7 == "2" && !is.null(input$uploaddata7)){
          data7 <- readLines(input$uploaddata7$datapath)
          data7name <- input$Data7name
          color7<-input$color7cus
        }else {
          NULL
        }
        if(input$seluploaddata7 == "3" && !is.null(input$pastedata7)){
          data7 <- unlist(strsplit(input$pastedata7,split="\\n"))
          data7name <- input$Data7name
          color7<-input$color7cus
        }else {
          NULL
        }
        
        venn.list <- list(data1,data2,data3,data4,data5,data6,data7)
        venn.list[sapply(venn.list,is.null)] <- NULL
        
        data.name.vec <- c(data1name, data2name, data3name, data4name, data5name, 
                           data6name, data7name)
        data.name.vec <- data.name.vec[!is.null(data.name.vec)]
        
        color<-c(color1,color2,color3,color4,color5,color6,color7)
        color<-color[!is.null(color)]
        
        
        output$venn <- renderPlot({
          venn::venn(venn.list, zcolor = color, cexil = input$textsize, ilabels=TRUE, snames = data.name.vec,
                     cexsn=input$labelsize)
        }, height = venn.height, width = venn.width)
        
        
        ## Download PDF file of venn
        output$downloadvenn.pdf <- downloadHandler(
          filename <- function() { paste('venn.pdf') },
          content <- function(file) {
            pdf(file, width = venn.width/72, height = venn.height/72)
            venn::venn(venn.list, zcolor = color, cexil = input$textsize, ilabels=TRUE, snames = data.name.vec,
                       cexsn=input$labelsize)
            dev.off()
          }, contentType = 'application/pdf')
        
        
        ## Download SVG file of venn
        output$downloadvenn.svg <- downloadHandler(
          filename <- function() { paste('venn.svg') },
          content <- function(file) {
            svg(file, width = venn.width/72, height = venn.height/72)
            venn::venn(venn.list, zcolor = color, cexil = input$textsize, ilabels=TRUE, snames = data.name.vec,
                       cexsn=input$labelsize)
            dev.off()
          }, contentType = 'image/svg')
        
        ## Download csv file of venn
        output$downloadvenn.csv <- downloadHandler(
          filename <- function() { paste('venn.csv') },
          content <- function(file) {
            ff <- tempfile()
            png(filename=ff)
            file.csv<-venn::venn(venn.list, zcolor = color, cexil = input$textsize, ilabels=TRUE, snames = data.name.vec,
                                 cexsn=input$labelsize)
            dev.off()
            unlink(ff)
            file.csv1<-attr(file.csv,"intersections")
            file.csv2<-ldply(file.csv1,function(x){
              data.frame(x)
            })
            names(file.csv2) <- c("Tag", "Elements")
            write.csv(file.csv2, file, row.names = F)
          }, contentType = 'text/csv')
        
      })
    }
    else {
      NULL
    }
  })
})
