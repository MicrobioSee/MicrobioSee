Bubble_chartplot <-function(bfile,bx,by,bsize,bcolor,btitle){
  data= read.table(bfile,header=TRUE,check.names = FALSE,sep = "\t") 
  # data= read.table("./www/bubble_chart.txt",header=TRUE,sep = "\t") 
  newdata<-NULL
  words<-paste('newdata=list(data$',bx,',data$',by,',data$',bsize,',data$',bcolor,')',sep = '')
  eval(parse(text = words))
  # newdata<-list(data$bx,data$by,data$bsize,data$bcolor)
  newdata1<-data.frame(newdata)
  colnames(newdata1)=c('x','y','size','color')

  p = ggplot(newdata1,aes(x,y))
  
  p=p + geom_point() 
  
  # # 修稿点的大小
   p=p + geom_point(aes(size=size))
  # # 展示三维数据
  pbubble = p+ geom_point(aes(size=size,color=color))
  # # 设置渐变色
  # # pr = pbubble+scale_color_gradient(low="green",high = "red")
  # 绘制p气泡图
  # pr = pr+labs(color=expression(number),size="Count",  
  #              x="Pvalue",y="Pathway name",title="Pathway enrichment")
  pbubble= pbubble+labs(color=bcolor,size=bsize,x=bx,y=by,title=btitle)
  pbubble

}
# library(ggplot2)
# library(tidyverse)
# library(dplyr)
# data1 = diamonds %>% sample_n(200)
# write.csv(data1,"~/shiny12_3/shinny/Bubble_chart/data2.csv")
# data= read.csv("~/shiny12_3/shinny/Bubble_chart/data2.csv",header=TRUE,check.names = FALSE)
# 
# newdata<-NULL
# xx<-"carat"
# newdata<-list(data$xx,data$color)
# newdata1<-data.frame(newdata)
# colnames(newdata1)=c('x','y')
# # # p = ggplot(data,aes(clarity,depth))
# # 
# # p=p + geom_point()
# # # 修稿点的大小
# p=p + geom_point(aes(size=carat))
# # 展示三维数据
# pbubble = p+ geom_point(aes(size=carat,color=color))
# # 设置渐变色
# pr = pbubble+scale_color_gradient(low="green",high = "red")
# # 绘制p气泡图
# # pr = pr+labs(color=expression(number),size="Count",
# #              x="Pvalue",y="Pathway name",title="Pathway enrichment")
# # pr = pr+labs(color=expression(color),size=size,x=x,y=y,title=title)
# pr
