PCoA <-function(pdata,pdata.env,annotates,method){
  d1 <- read.table(pdata,header = TRUE,sep = "\t",row.names = 1)
  d2 <- read.table(pdata.env,header = TRUE,sep = "\t",row.names = 1)
  d1.dist <- vegdist(d1,method=method)#构造距离矩阵。
  res=pcoa(d1.dist,correction="none")
  d1.ano <- with(d2, anosim(d1.dist, d1[,1]))#相似性分析，Goup是指输入pdata.env中的分组信息列
  plot(d1.ano)
  P= d1.ano$signif
  R=round( d1.ano$statistic,3)
  data=res$vectors[,1:2]
  data=data.frame(data)
  colnames(data)=c('x','y')
  eig=as.numeric(res$value[,1])
  type=d2[,1]
  data=cbind(data,type)
  p = ggplot(data, aes(x=x, y=y, color=type))+
    geom_point(alpha=.7, size=2) +
    labs(x=paste("PCoA 1 (",format(100* eig[1] / sum(eig), digits=4), "%)", sep=""),
         y=paste("PCoA 2 (", format(100*eig[2] / sum(eig), digits=4), "%)", sep=""),
         title="PCoA")+ 
    theme_classic()+stat_ellipse(type ="t", linetype = 2)
  if(annotates == "yes"){
    p + annotate("text",x=0.5,y=-1,parse=TRUE,size=4,label=paste('R:',R),family="serif",fontface="italic",colour="darkred")+
      annotate("text",x=-0.5,y=-1,parse=TRUE,size=4,label=paste('p:',P),family="serif",fontface="italic",colour="darkred")
  }else{p}
}

pcaplot<-function(file_abun,file_group,scale,ellipse,addlabel,labelposition,labelsize){
  df<-read.table(file_abun,header = T,sep = "\t",row.names = 1)
  dfGroup<-read.table(file_group,header = T,sep = "\t")
  pca_result <- prcomp(df, scale=T ) # 一个逻辑值，指示在进行分析之前是否应该将变量缩放到具有单位方差
  g=ggbiplot(pca_result,
             var.axes = F,
             obs.scale = scale,         # 横纵比例
             groups = dfGroup[,2],  # 添加分组信息，为分组文件的第一列
             ellipse = ellipse,           # 是否围绕分组画椭圆
             # circle = circle
  )+theme_bw()+#####去背景线
    theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line= element_line(colour = "black"))
  if(addlabel==1){
    g=g+geom_text(                      # geom_text一个在图中添加标注的函数
      aes(label=rownames(df)),   # 指定标注的内容为数据框df的行名
      vjust=labelposition,            # 指定标记的位置，vjust=1.5 垂直向下1.5个距离。   负数为位置向上标记，正数为位置向下标记
      size=labelsize                # 标记大小
    )
    g
  }else{
    g
  }
}

strss_value<- function(ndata,ndata.group,standardization,dist){
  spe <- read.table(ndata,header = TRUE,sep = "\t",row.names = 1)#读取物种数据
  group <- read.table(ndata.group,header = TRUE,sep = "\t")
  colnames(group) <- c("X", "group")
  spe.h <- decostand(spe,standardization)#数据标准化#
  #NMDS分析
  spe.h.nmds <- metaMDS(spe.h,distance=dist)#NMDS分析-基于Bray-Curtis距离
  return(paste0("The Stress value is ",spe.h.nmds$stress))
}
nmds <- function(ndata,ndata.group,standardization,dist){
  # strss_value(ndata,ndata.group,standardization,dist)
  
  spe <- read.table(ndata,header = TRUE,sep = "\t",row.names = 1)#读取物种数据
  group <- read.table(ndata.group,header = TRUE,sep = "\t")
  colnames(group) <- c("X", "group")
  spe.h <- decostand(spe,standardization)#数据标准化#
  #NMDS分析
  spe.h.nmds <- metaMDS(spe.h,distance=dist)#NMDS分析-基于Bray-Curtis距离
  map<- scores(spe.h.nmds)#提取前两轴坐标/spe.h.nmds$points#查看前两轴物种
  #ggplot2绘图
  
  #我们将nmds_dis_site数据导出来，然后加上分组信息再读入
  map<-data.frame(map)
  map$X <- rownames(map)
  map <- merge(group,map,by = "X")
  
  #正式绘图
  ggplot(data = map, aes(NMDS1, NMDS2))+
    geom_point(size = 2,#绘制散点图
               aes(color = group, shape = group))+
    stat_ellipse(aes(fill = group),#加上置信椭圆
                 geom = 'polygon',
                 level = 0.95, #置信区间95%
                 alpha = 0.1, #透明度
                 segments = 51, #椭圆类型
                 show.legend = F)+
    theme_bw()+#主题
    geom_vline(xintercept = 0, color = 'black', size = 1, linetype = 3)+ #添加过原点线(y)
    geom_hline(yintercept = 0, color = 'black', size = 1, linetype = 3)+ #添加过原点线(x)
    xlab("NMDS1")+#x轴标题
    ylab("NMDS2")+#y轴标题
    theme(axis.title.y = element_text(size = 14))+ #y轴标题大小
    theme(axis.title.x = element_text(size = 14))+ #x轴标题大小
    # geom_text(aes(x=3,y=2,label=paste0("stress = ",spe.h.nmds$stress)))+ #设置文字位置、内容和大小
    # geom_text(aes(x=-0.8,y=0.50,label="R^2 = 0.995"),size = 6)+ #添加R^2
    theme(axis.text.x=element_text(size=14,angle=0,color="Black"),#设置x和y轴字体大小和颜色
          axis.text.y=element_text(size=14,angle=0,color="Black"))+
    #theme(legend.position=c(0.95,0.9))+#设置图例位置
    theme(legend.text=element_text(size=14))+ #设置图例字体大小
    theme(legend.title = element_text(face = "bold", size = 14))#设置图例标题字和大小
}
nmds.stress <- function(ndata,ndata.group,standardization,dist){
  spe <- read.table(ndata,header = TRUE,sep = "\t",row.names = 1)#读取物种数据
  # spe <- read.table("./www/beta.txt",header = TRUE,sep = "\t")#读取物种数据
  # group <- read.table("./www/metadata.txt",header = TRUE,sep = "\t")
  
  group <- read.table(ndata.group,header = TRUE,sep = "\t")
  colnames(group) <- c("X", "group")
  spe.h <- decostand(spe,standardization)#数据标准化#
  #NMDS分析
  spe.h.nmds <- metaMDS(spe.h,distance=dist)#NMDS分析-基于Bray-Curtis距离
  # spe.h.nmds$stress#查看stress值
  stressplot(spe.h.nmds, main = "Shepard")
}
