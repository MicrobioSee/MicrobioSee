pieplot<-function(file1,color_mode){
  # color_mode="rainbow"
  # data<-read.table(file1,sep = "\t",header = TRUE)
  # pie(x,labels=piepercent, main="pie chart",col= rainbow (length(x)),radius=-1)
  data<-read.table(file1,sep = "\t",header = TRUE)
  x<-c(data[,2])
  label<-data[,1]
  piepercent<-round(100*x/sum(x), 1)
  
  piepercent <-paste(label,'(',piepercent, "%)", sep = "")
  
  if (color_mode=='terrain.colors'){
    pie(x,labels=piepercent, main="pie chart",col= terrain.colors (length(x)))
  }else if(color_mode=='cm.color'){
    pie(x,labels=piepercent, main="pie chart",col= cm.colors (length(x)))
  }else if(color_mode=='rainbow'){
    pie(x,labels=piepercent, main="pie chart",col= rainbow (length(x)))
  }else if(color_mode=='topo.colors'){
    pie(x,labels=piepercent, main="pie chart",col= topo.colors (length(x)))
  }else if(color_mode=='heat.colors'){
    pie(x,labels=piepercent, main="pie chart",col= heat.colors (length(x)))
  }
}
