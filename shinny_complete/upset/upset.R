#安装及加载R包
#install.packages("UpSetR")

#载入数据集
# data <- read.csv("upSet.csv",header=TRUE)
# #先大致浏览一下该数据集,数据集太长，就只看前几列
# head(data[,1:6],6)
# #View(data) #弹出窗口，可查看数据
#导入数据

upsetplot <-function(file1,comparison,xlabel,ylabel){
  data <- read.csv(file1, header = TRUE)
  
  # print(data1)
  #先大致浏览一下该数据集,数据集太长，就只看前几列
  # head(data[,1:10])
  # dc <-colnames(data)##读出列名
  
  
  # f1<-text#读入用户输入的所需列名
  # f2<-list(f1)#写成数组
  # len=length(f2)
  # 
  # 
  # for  (i in 1:len){
  #   
  #   sec=dc[as.numeric(f2[i])]
  #   a=sec
  #   
  #   paste(sec,sep=",")
  #   
  #upset(file,comparison,parameter1,parameter2,groupone,parameter3,parameter4,grouptwo,parameter5,parameter6,grouptree,model)  
    
  c=c(unlist(strsplit(comparison, ",", fixed = TRUE))) 
  dc <-colnames(data)  
  b="~"
  for (i in c){
    a=dc[as.numeric(i)]
    
    b=paste(b,a,sep=",")}
  se=gsub("~,","",b)
  set=c(unlist(strsplit(se,",",fixed=TRUE)))
  # 
  
  # set = c( dc[3],dc[4],dc[5],dc[6],dc[7],dc[8],dc[9])
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
        #六个数字，分别控制c(intersection size title, intersection size tick labels, set size title, set size tick labels, set names, numbers above bars)
        # queries = list(list( query = intersects, #UpSetR 内置的intersects query
        #                     params = list(as.character(parameter1)), ##指定作用的交集
        #                     # color = "red", ##设置颜色，未设置会调用默认调色板
        #                     active = F,   # TRUE：条形图被颜色覆盖，FALSE：条形图顶端显示三角形
        #                     query.name = as.character(groupone)), # 添加query图例
        #                list( query = intersects, params = list(as.character(parameter3),as.character(parameter4)), active = T,query.name = as.character(grouptwo)), 
        #                list( query = intersects, params = list(as.character(parameter5),as.character(parameter6),as.character(parameter2)), active = T,query,name=as.character(groupthree))),
        # query.legend = "top")
  
}