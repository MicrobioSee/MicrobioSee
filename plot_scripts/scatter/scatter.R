scatterplot<-function(file_input,xlabel,ylabel,groups,input,addtext){
  data<-read.csv(file_input)
  
  c<-colnames(data)
  
  if (length(c)>2){
    if(addtext==T){
      colnames(data)<-c(xlabel,ylabel,groups)
      eval(parse(text=paste('g=ggplot (data, aes (x = ',xlabel,', y = ',ylabel,', colour =',groups,'))+geom_point ()' )))
      # ggplot (data, aes (x = data[,1], y = data[,2], colour = data[,3])) +
      #   # 散点图函数
      # xlabel='a'
      # ylabel='b'
      # groups='c'
      # input<-'b'
      g=g+geom_text(                      # geom_text一个在图中添加标注的函数
        aes(label=data[,input]),   # 指定标注的内容为数据框df的行名
        vjust=-1.5,            # 指定标记的位置，vjust=1.5 垂直向下1.5个距离。   负数为位置向上标记，正数为位置向下标记
        size=2 ,show.legend = FALSE             # 标记大小
      )+theme_bw()+#####去背景线
        theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line= element_line(colour = "black"))
      g
    }else{
      colnames(data)<-c(xlabel,ylabel,groups)
      eval(parse(text=paste('g=ggplot (data, aes (x = ',xlabel,', y = ',ylabel,', colour =',groups,'))+geom_point ()' )))
      g=g+theme_bw()+#####去背景线
        theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line= element_line(colour = "black"))
      g
    }
    
    
    
  }else if(length(c)==2){
    if(addtext==T){
      colnames(data)<-c(xlabel,ylabel)
      eval(parse(text=paste('g=ggplot (data, aes (x = ',xlabel,', y = ',ylabel,'))+geom_point ()' )))
      # ggplot (data, aes (x = data[,1], y = data[,2], colour = data[,3])) +
      #   # 散点图函数
      # xlabel='a'
      # ylabel='b'
      # groups='c'
      # input<-'b'
      g=g+geom_text(                      # geom_text一个在图中添加标注的函数
        aes(label=data[,input]),   # 指定标注的内容为数据框df的行名
        vjust=-1.5,            # 指定标记的位置，vjust=1.5 垂直向下1.5个距离。   负数为位置向上标记，正数为位置向下标记
        size=2 ,show.legend = FALSE             # 标记大小
      )+theme_bw()+#####去背景线
        theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line= element_line(colour = "black"))
      g
    }else{
      colnames(data)<-c(xlabel,ylabel,groups)
      eval(parse(text=paste('g=ggplot (data, aes (x = ',xlabel,', y = ',ylabel,', colour =',groups,'))+geom_point ()' )))
      g=g+theme_bw()+#####去背景线
        theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line= element_line(colour = "black"))
      g
    }
    
  }
}
