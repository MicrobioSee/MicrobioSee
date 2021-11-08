#2021-40-14
#author:yimeng sang,jinhui li
#setwd("~/Stacked_column_charts/")
#rm(list = ls())
percentage <- function(arg1){
  arg1 <- arg1/sum(arg1) 
  return(arg1)} #前提准备

stack <- function(data,sline,stheme,color){
  tempdata <- data
  for (i in 2:ncol(data)){data[,i]<-percentage(data[,i])}
  data <- arrange(data,desc(data[,1]))
  for (i in 2:ncol(data)){
    x_name = paste0('mu',i)
    assign(x_name,cumsum(data[,i]))
    data <- cbind(data,get(paste0('mu',i)))
    colnames(data)[ncol(data)] <- paste0("mu",i)
  }
  datasum <- data
  data <- tempdata
  for (i in 2:ncol(data)){data[,i]<-percentage(data[,i])}
  data <- arrange(data,desc(data[,1]))
  mydata <- melt(data,id.vars = 1)
  mydata <- arrange(mydata,mydata[,1])
  #以上代码用于读数据并处理，得到data，mydata和datasum
  #下面开始画�?
  p <- ggplot(mydata,aes(variable,value,fill=Bacteria))+geom_bar(stat="identity",width = 0.5)+scale_y_continuous(expand=c(0,0)) #画柱�?,设边�?
  #先画出柱子，然后画连接线
  if(sline == "straight"){
    if(ncol(data) == 2){
      p <- p 
    } else if(ncol(data) == 3){
      p <- p + geom_segment(data = datasum,aes(x=1.25, xend=1.75, y=mu2, yend=mu3))
    } else if(ncol(data) == 4){
      p <- p + geom_segment(data = datasum,aes(x=1.25, xend=1.75, y=mu2, yend=mu3)) +
        geom_segment(data = datasum,aes(x=2.25, xend=2.75, y=mu3, yend=mu4))
    } else if(ncol(data) == 5){
      p <- p + geom_segment(data = datasum,aes(x=1.25, xend=1.75, y=mu2, yend=mu3)) +
        geom_segment(data = datasum,aes(x=2.25, xend=2.75, y=mu3, yend=mu4)) +
        geom_segment(data = datasum,aes(x=3.25, xend=3.75, y=mu4, yend=mu5))
    } else if(ncol(data) == 6){
      p <- p + geom_segment(data = datasum,aes(x=1.25, xend=1.75, y=mu2, yend=mu3)) +
        geom_segment(data = datasum,aes(x=2.25, xend=2.75, y=mu3, yend=mu4)) +
        geom_segment(data = datasum,aes(x=3.25, xend=3.75, y=mu4, yend=mu5)) +
        geom_segment(data = datasum,aes(x=4.25, xend=4.75, y=mu5, yend=mu6))
    } else if(ncol(data) == 7){
      p <- p + geom_segment(data = datasum,aes(x=1.25, xend=1.75, y=mu2, yend=mu3)) +
        geom_segment(data = datasum,aes(x=2.25, xend=2.75, y=mu3, yend=mu4)) +
        geom_segment(data = datasum,aes(x=3.25, xend=3.75, y=mu4, yend=mu5)) +
        geom_segment(data = datasum,aes(x=4.25, xend=4.75, y=mu5, yend=mu6)) +
        geom_segment(data = datasum,aes(x=5.25, xend=5.75, y=mu6, yend=mu7)) 
    } else if(ncol(data) == 8){
      p <- p + geom_segment(data = datasum,aes(x=1.25, xend=1.75, y=mu2, yend=mu3)) +
        geom_segment(data = datasum,aes(x=2.25, xend=2.75, y=mu3, yend=mu4)) +
        geom_segment(data = datasum,aes(x=3.25, xend=3.75, y=mu4, yend=mu5)) +
        geom_segment(data = datasum,aes(x=4.25, xend=4.75, y=mu5, yend=mu6)) +
        geom_segment(data = datasum,aes(x=5.25, xend=5.75, y=mu6, yend=mu7)) +
        geom_segment(data = datasum,aes(x=6.25, xend=6.75, y=mu7, yend=mu8))
    }
  }else if (sline == "curve"){
    if(ncol(data) == 2){
      p <- p 
    } else if(ncol(data) == 3){
      p <- p+ 
        geom_curve(data = datasum[-nrow(datasum),],aes(x=1.25, xend=1.5, y=mu2, yend=(mu2+mu3)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=1.5, xend=1.75, y=(mu2+mu3)/2, yend=mu3),curvature = -0.05,angle = 95)
    } else if(ncol(data) == 4){
      p <- p+ 
        geom_curve(data = datasum[-nrow(datasum),],aes(x=1.25, xend=1.5, y=mu2, yend=(mu2+mu3)/2),curvature = 0.05,angle = 80)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=1.5, xend=1.75, y=(mu2+mu3)/2, yend=mu3),curvature = -0.05,angle = 100)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=2.25, xend=2.5, y=mu3, yend=(mu3+mu4)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=2.5, xend=2.75, y=(mu3+mu4)/2, yend=mu4),curvature = -0.05,angle = 95)
    } else if(ncol(data) == 5){
      p <- p+ 
        geom_curve(data = datasum[-nrow(datasum),],aes(x=1.25, xend=1.5, y=mu2, yend=(mu2+mu3)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=1.5, xend=1.75, y=(mu2+mu3)/2, yend=mu3),curvature = -0.05,angle = 95)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=2.25, xend=2.5, y=mu3, yend=(mu3+mu4)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=2.5, xend=2.75, y=(mu3+mu4)/2, yend=mu4),curvature = -0.05,angle = 95) +
        geom_curve(data = datasum[-nrow(datasum),],aes(x=3.25, xend=3.5, y=mu4, yend=(mu4+mu5)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=3.5, xend=3.75, y=(mu4+mu5)/2, yend=mu5),curvature = -0.05,angle = 95)
    } else if(ncol(data) == 6){
      p <- p+ 
        geom_curve(data = datasum[-nrow(datasum),],aes(x=1.25, xend=1.5, y=mu2, yend=(mu2+mu3)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=1.5, xend=1.75, y=(mu2+mu3)/2, yend=mu3),curvature = -0.05,angle = 95)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=2.25, xend=2.5, y=mu3, yend=(mu3+mu4)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=2.5, xend=2.75, y=(mu3+mu4)/2, yend=mu4),curvature = -0.05,angle = 95) +
        geom_curve(data = datasum[-nrow(datasum),],aes(x=3.25, xend=3.5, y=mu4, yend=(mu4+mu5)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=3.5, xend=3.75, y=(mu4+mu5)/2, yend=mu5),curvature = -0.05,angle = 95)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=4.25, xend=4.5, y=mu5, yend=(mu5+mu6)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=4.5, xend=4.75, y=(mu5+mu6)/2, yend=mu6),curvature = -0.05,angle = 95)
    } else if(ncol(data) == 7){
      p <- p+ 
        geom_curve(data = datasum[-nrow(datasum),],aes(x=1.25, xend=1.5, y=mu2, yend=(mu2+mu3)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=1.5, xend=1.75, y=(mu2+mu3)/2, yend=mu3),curvature = -0.05,angle = 95)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=2.25, xend=2.5, y=mu3, yend=(mu3+mu4)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=2.5, xend=2.75, y=(mu3+mu4)/2, yend=mu4),curvature = -0.05,angle = 95) +
        geom_curve(data = datasum[-nrow(datasum),],aes(x=3.25, xend=3.5, y=mu4, yend=(mu4+mu5)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=3.5, xend=3.75, y=(mu4+mu5)/2, yend=mu5),curvature = -0.05,angle = 95)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=4.25, xend=4.5, y=mu5, yend=(mu5+mu6)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=4.5, xend=4.75, y=(mu5+mu6)/2, yend=mu6),curvature = -0.05,angle = 95)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=5.25, xend=5.5, y=mu6, yend=(mu6+mu7)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=5.5, xend=5.75, y=(mu6+mu7)/2, yend=mu7),curvature = -0.05,angle = 95) 
    } else if(ncol(data) == 8){
      p <- p+ 
        geom_curve(data = datasum[-nrow(datasum),],aes(x=1.25, xend=1.5, y=mu2, yend=(mu2+mu3)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=1.5, xend=1.75, y=(mu2+mu3)/2, yend=mu3),curvature = -0.05,angle = 95)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=2.25, xend=2.5, y=mu3, yend=(mu3+mu4)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=2.5, xend=2.75, y=(mu3+mu4)/2, yend=mu4),curvature = -0.05,angle = 95) +
        geom_curve(data = datasum[-nrow(datasum),],aes(x=3.25, xend=3.5, y=mu4, yend=(mu4+mu5)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=3.5, xend=3.75, y=(mu4+mu5)/2, yend=mu5),curvature = -0.05,angle = 95)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=4.25, xend=4.5, y=mu5, yend=(mu5+mu6)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=4.5, xend=4.75, y=(mu5+mu6)/2, yend=mu6),curvature = -0.05,angle = 95)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=5.25, xend=5.5, y=mu6, yend=(mu6+mu7)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=5.5, xend=5.75, y=(mu6+mu7)/2, yend=mu7),curvature = -0.05,angle = 95)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=6.25, xend=6.5, y=mu7, yend=(mu7+mu8)/2),curvature = 0.05,angle = 85)+
        geom_curve(data = datasum[-nrow(datasum),],aes(x=6.5, xend=6.75, y=(mu7+mu8)/2, yend=mu8),curvature = -0.05,angle = 95)
    }
  }
  #主题开关，定义背景色主要用了ggtheme
  if (stheme == "bw"){p<-p+theme_bw()}else if (stheme == "classic"){p<-p+theme_classic()}else if (stheme == "economist"){p<-p+theme_economist()}else if (stheme == "fivethirtyeight"){p<-p+theme_fivethirtyeight()}else if (stheme == "map"){p<-p+theme_map()}else if (stheme == "base"){p<-p+theme_base()}else if (stheme == "wsj"){p<-p+theme_wsj()}else if (stheme == "dark"){p<-p+theme_dark()}
  #柱子调色开关，定义柱子的颜色，主要参考ggsci
  if (color == "npg"){p<-p+scale_fill_npg()}else if (color == "nejm"){p<-p+scale_fill_nejm()}else if (color == "lancet"){p<-p+scale_fill_lancet()}else if (color == "rickandmorty"){p<-p+scale_fill_rickandmorty()}else if (color == "tron"){p<-p+scale_fill_tron()}else if (color == "grey"){p<-p+scale_fill_grey()}
  #出图
  p
  # if (pic == "png"){
  #   ggsave(filename = "user_plot/time.wc.png",plot = p,height =as.numeric(height) ,width =as.numeric(width) ,units =unit ,dpi =as.numeric(dpi))
  # } else if (pic == "pdf"){
  #   ggsave(filename = "user_plot/time.wc.pdf",plot = p,height =as.numeric(height) ,width =as.numeric(width) ,units =unit ,dpi =as.numeric(dpi))
  # } else if (pic == "jpeg"){
  #   ggsave(filename = "user_plot/time.wc.jpeg",plot = p,height =as.numeric(height) ,width =as.numeric(width) ,units =unit ,dpi =as.numeric(dpi))
  # }

}
#over

# output$downloadvenn.pdf <- downloadHandler(
#   filename <- function() { paste('venn.pdf') },
#   content <- function(file) {
#     pdf(file, width = venn.width/72, height = venn.height/72)
#     venn::venn(venn.list, zcolor = color, cexil = input$textsize, ilabels=TRUE, snames = data.name.vec,
#                cexsn=input$labelsize)
#     dev.off()
#   }, contentType = 'application/pdf')




# down_type <- function(output,width,height,unit,dpi,data,sline,stheme,color){
#         ## Download PDF file
#         output$downloadstack.pdf <- downloadHandler(
#           filename <- function() { paste('stack_column_charts',format(Sys.time(), "%s"),"pdf",sep = ".") },
#           content <- function(file) {
#             # ggsave(paste0(filename(),'.pdf') , p,height ,width , unit ,dpi)
#             pdf(file, width = width , height = height )
#             print(stack(data,sline,stheme,color))
#             dev.off()
#           }, contentType = 'application/pdf')
#         ## Download PNG file
#         output$downloadstack.png <- downloadHandler(
#           filename <- function() { paste('stack_column_charts',format(Sys.time(), "%s"),"png",sep = ".") },
#           content <- function(file) {
#             png(file, width , height , res=dpi , units = "px")
#             print(stack(data,sline,stheme,color))
#             dev.off()
#           }, contentType = 'image/png')
#         ## Download jpeg file
#         output$downloadstack.jpeg <- downloadHandler(
#           filename <- function() { paste('stack_column_charts',format(Sys.time(), "%s"),"jpeg",sep = ".") },
#           content <- function(file) {
#             jpeg(file,  width ,  height ,units = "px",res=dpi)
#             print(stack(data,sline,stheme,color))
#             dev.off()
#           }, contentType = 'image/jpeg')







