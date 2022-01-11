vennplot <- function(file1,colors,opacity){

  a<-read.csv(file1,header = T,na.strings = c("NA",""))
  dataz <- list()
  i=length(a)
  for (j in 1:i){
    c<-array(a[,j])####写成数组，好清理空项;列list不能作为单项处理吧
    c2<-c[!is.na(c)]####删除数组中的空值
    dataz[j]<-list(c2)
  }
  col <- colnames(a)
  snames1<-paste(col,sep = ",")
  
  # color='user-defined'
  # clolor=paste("#ff3333",'#ff3333','#ff3333',sep = ',')
  
  # if(vcolor=="1"){
  #   vcolor = clolor
  # }
  # print(color)
  venn(dataz, zcolor = colors,snames = snames1,box = F,opacity=opacity)
}


















