
upsetplot <-function(file1,comparison,xlabel,ylabel){
  data <- read.csv(file1, header = TRUE)
  
  
  c=c(unlist(strsplit(comparison, ",", fixed = TRUE))) 
  dc <-colnames(data)  
  b="~"
  for (i in c){
    a=dc[as.numeric(i)]
    
    b=paste(b,a,sep=",")}
  se=gsub("~,","",b)
  set=c(unlist(strsplit(se,",",fixed=TRUE)))
  
  upset(data, 
        sets = set,#查看特定的几个集合
        mb.ratio = c(0.55, 0.45),#控制上方条形图以及下方点图的比例
        order.by = "freq", #如何排序，这里freq表示从大到小排序展示
        keep.order = TRUE, #keep.order按照sets参数的顺序排序
        number.angles = 30, #调整柱形图上数字角度
        point.size = 2, line.size = 1, #点和线的大小
        # mainbar.y.label = ylabel, sets.x.label = xlabel,
        mainbar.y.label = as.character(ylabel), sets.x.label = as.character(xlabel), #坐标轴名称
        text.scale = c(1.3, 1.3, 1, 1, 1.5, 1))
  
  
}