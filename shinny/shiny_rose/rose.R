#2021-10-10
#author:sangyimeng,lijinhui

# rm(list=ls())
setwd(dir = "~/rose_plot")
#install.packages("reshape2")
#library(ggplot2)??????????????Ҫ?Ӱ???


rose_plot <- function(file,color1,color2,type,xname,yname){
data <-read.csv(file)
f<-factor(data[,1])
df<-data.frame(gene=f,data[,2])
palette<-colorRampPalette(c(color1, color2))(length(f))  #bar颜色

if(type == "rose"){
gplot <- ggplot(df,aes(x=reorder(df[,1], df[,2]),y=df[,2],fill=factor(df[,2])))+
          geom_bar(width = 1,stat = "identity",colour="black",fill=palette)+
          coord_polar(theta = "x",start = 0)
} else {
  gplot <- ggplot(df,aes(x=reorder(df[,1], df[,2]),y=df[,2],fill=factor(df[,2])))+
    geom_bar(width = 1,stat = "identity",colour="black",fill=palette)
}
g=gplot+
  labs(xname, yname)+ #添加坐标轴名???
  # theme(axis.title = element_text(10,"black"))+  #labs字体大小和颜???
  # theme(axis.text = element_text(10,"black"))+  #标签字体大小和颜???
  theme(panel.background = element_rect("white")) #图案背景颜色和边框颜???
  # theme(plot.background = element_rect("white","black")) #图片背景颜色和边框颜???
g
}

######下载功能
down_type <- function(width,height,dpi,file2,color1,color2,type,xname,yname){
  ## Download PDF file
  output$downloadpdf <- downloadHandler(
    filename <- function() { paste('stack_column_charts',format(Sys.time(), "%s"),"pdf",sep = ".") },
    content <- function(file) {
      # ggsave(paste0(filename(),'.pdf') , p,height ,width , unit ,dpi)
      pdf(file, width = width , height = height )
      rose_plot(file2,color1,color2,type,xname,yname)
      dev.off()
    }, contentType = 'application/pdf')
  ## Download PNG file
  output$downloadpng <- downloadHandler(
    filename <- function() { paste('stack_column_charts',format(Sys.time(), "%s"),"png",sep = ".") },
    content <- function(file) {
      png(file, width , height , res=dpi , units = "px")
      rose_plot(file2,color1,color2,type,xname,yname)
      dev.off()
    }, contentType = 'image/png')
  ## Download jpeg file
  output$downloadjpeg <- downloadHandler(
    filename <- function() { paste('stack_column_charts',format(Sys.time(), "%s"),"jpeg",sep = ".") },
    content <- function(file) {
      jpeg(file,  width ,  height ,units = "px",res=dpi)
      rose_plot(file2,color1,color2,type,xname,yname)
      dev.off()
    }, contentType = 'image/jpeg')
}
