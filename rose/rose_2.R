plot_rose_bar <- function(file,color1,color2,type,xname,yname){
  # data <-read.table("./www/rose.txt",sep = '\t',header = TRUE)
  data <-read.table(file,sep = '\t',header = TRUE)
  f<-factor(data[,1])
  df1<-data.frame(gene=f,data[,2])
  
  palette<-colorRampPalette(c(color1, color2))(length(f))  #bar颜色
  # df<-df1[sort(df1[,2],index.return=TRUE,decreasing=T),]#把表格按照第二列的值排序，索引
  df<-df1[order(df1[,2],decreasing=T),]#把表格按照第二列的值排序，但是索引没有变
  rownames(df) <- 1:nrow(df)
  # type = "bar"
  if(type == "1"){
    gplot <- ggplot(df)+
      # geom_bar(mapping=aes(x=reorder(df[,1], df[,2]),y=df[,2],fill=factor(df[,2])),width = 1,stat = "identity",colour="black",fill=palette)+
      geom_bar(mapping=aes(x=reorder(df[,1], df[,2]),y=df[,2],fill=factor(df[,2])),width = 1,stat = "identity",colour="black",fill=palette)+
      coord_polar(theta = "x",start = 0)
  } else {
    gplot <- ggplot(df,aes(x=reorder(df[,1], df[,2]),y=df[,2],fill=factor(df[,2])))+
      geom_bar(width = 1,stat = "identity",colour="black",fill=palette)
  }
  g=gplot+
    labs(x=xname, y=yname)+ #添加坐标轴名
    # theme(axis.title = element_text(10,"black"))+  #labs字体大小和颜???
    # theme(axis.text = element_text(10,"black"))+  #标签字体大小和颜???
    theme(panel.background = element_rect("white")) #图案背景颜色和边框颜???
  # theme(plot.background = element_rect("white","black")) #图片背景颜色和边框颜???
  g+stat_compare_means(aes(x=df[,1],y=df[,2]))
  
}

