histogram<-function(file1,transpose1,Sort1,datalabel){
  # data<-read.csv("~/shiny12_3/shinny/Histogram/simple2.csv")
  data<-read.table(file1,sep = "\t",header = TRUE)
  # colors for bar // green, blue, orange
  # CPCOLS <- c("#8DA1CB", "#FD8D62", "#66C3A5")
  
  len<-length(data[,2])
  charat<-unique(data[,2])###遍历出type中的不同类型
  
  a<-NULL
  for (i in 1:len){
    for(j in 1:length(charat)){
      if (data[,2][i]==charat[j]){
        a[i]<-j
      }
    }
  }
  
  data<-data.frame(data,a)
  
  
  legend='   '
  tlegend='   '
  
  
  
  
  if(Sort1==1 && transpose1==1){
    # if(){
    # word=paste0('p=ggplot(data=data, aes(x=reorder(reorder(data[,1],data[,3]),data[,4]), y=',colnames(data)[3],',fill=',colnames(data)[2],'))')
    #word=paste0('p=ggplot(data=data, aes(x=reorder(reorder(data[,1],data[,3]),data[,4]), y=',colnames(data)[3],',fill=',colnames(data)[2],'))')
    
    word=paste0('p=ggplot(data=data, aes(x=reorder(reorder(data$',colnames(data)[1],',data$',colnames(data)[3],'),data$',colnames(data)[4],'), y=',colnames(data)[3],',fill=',colnames(data)[2],'))')
    eval(parse(text=word))
    p=p+
      geom_bar(stat="identity", width=0.8,) +
      coord_flip()+ ###决定是否翻转
      # scale_fill_manual(values = CPCOLS) +
      # scale_fill_manual() +
      theme_bw() + 
      # scale_x_discrete(labels=labels) +
      xlab(legend) +
      theme(axis.text=element_text(face = "bold", color="gray50")) +
      labs(title = tlegend)+
      theme(axis.text.x = element_text(angle=90,hjust = 1)
      )
    
    if(datalabel==1){
      p=p+geom_text(                      # geom_text一个在图中添加标注的函数
        aes(y=data[,3]+max(data[,3])/30,label=data[,3]),   # 指定标注的内容为数据框df的行名
        vjust=0.5,            # 指定标记的位置，vjust=1.5 垂直向下1.5个距离。   负数为位置向上标记，正数为位置向下标记
        size=2                # 标记大小
      )
    }else{
      
    }
    
    
    
    
    p
  }else if (Sort1==1 && transpose1 !=1 ){#不转置
    word=paste0('p=ggplot(data=data, aes(x=reorder(reorder(data$',colnames(data)[1],',data$',colnames(data)[3],'),data$',colnames(data)[4],'), y=',colnames(data)[3],',fill=',colnames(data)[2],'))')
    eval(parse(text=word))
    p <-p + #ggplot(data=data, aes(x=reorder(reorder(data$term,data$Count),data$a), y=Count, fill=type)) +
      geom_bar(stat="identity", width=0.8,) +
      # coord_flip()+ ###决定是否翻转
      # scale_fill_manual(values = CPCOLS) +
      # scale_fill_manual() +
      theme_bw() + 
      # scale_x_discrete(labels=labels) +
      xlab(legend) +
      theme(axis.text=element_text(face = "bold", color="gray50")) +
      labs(title = tlegend)+
      theme(axis.text.x =   element_text(angle=90,hjust = 1))
    if(datalabel==1){
      p=p+geom_text(                      # geom_text一个在图中添加标注的函数
        aes(y=data[,3]+max(data[,3])/30,label=data[,3]),  # 指定标注的内容为数据框df的行名
        vjust=0.5,            # 指定标记的位置，vjust=1.5 垂直向下1.5个距离。   负数为位置向上标记，正数为位置向下标记
        size=2                # 标记大小
      )
    }else{
      
    }
    
    p
  }else if(Sort1 !=1 && transpose1 ==1){
    
    # if(transpose1==1){
    word=paste0('p=ggplot(data=data, aes(x=',colnames(data)[1],',y=',colnames(data)[3],',fill=',colnames(data)[2],'))')
    eval(parse(text=word))
    p <-p + # ggplot(data=data, aes(x=term, y=Count, fill=type)) +
      geom_bar(stat="identity", width=0.8,) +
      coord_flip()+ ###决定是否翻转
      # scale_fill_manual(values = CPCOLS) +
      # scale_fill_manual() +
      theme_bw() + 
      # scale_x_discrete(labels=labels) +
      xlab(legend) +
      theme(axis.text=element_text(face = "bold", color="gray50")) +
      labs(title = tlegend)+
      theme(axis.text.x =   element_text(angle=90,hjust = 1))
    if(datalabel==1){
      p=p+geom_text(                      # geom_text一个在图中添加标注的函数
        aes(y=data[,3]+max(data[,3])/30,label=data[,3]),   # 指定标注的内容为数据框df的行名
        vjust=0.5,            # 指定标记的位置，vjust=1.5 垂直向下1.5个距离。   负数为位置向上标记，正数为位置向下标记
        size=2                # 标记大小
      )
    }else{
      
    }
    
    
    p
  }else{
    word=paste0('p=ggplot(data=data, aes(x=',colnames(data)[1],',y=',colnames(data)[3],',fill=',colnames(data)[2],'))')
    eval(parse(text=word))
    p <-p + #ggplot(data=data, aes(x=term, y=Count, fill=type)) +
      geom_bar(stat="identity", width=0.8,) +
      # coord_flip()+ ###决定是否翻转
      # scale_fill_manual(values = CPCOLS) +
      # scale_fill_manual() +
      theme_bw() + 
      # scale_x_discrete(labels=labels) +
      xlab(legend) +
      theme(axis.text=element_text(face = "bold", color="gray50")) +
      labs(title = tlegend)+
      theme(axis.text.x =   element_text(angle=90,hjust = 1)
      ) # 横坐标文字旋转九十度
    
    if(datalabel==1){
      p=p+geom_text(                      # geom_text一个在图中添加标注的函数
        aes(y=data[,3]+max(data[,3])/30,label=data[,3]),  # 指定标注的内容为数据框df的行名
        vjust=0.5,            # 指定标记的位置，vjust=1.5 垂直向下1.5个距离。   负数为位置向上标记，正数为位置向下标记
        size=2                # 标记大小
      )
    }else{
      
    }
    p
  }
  
}
