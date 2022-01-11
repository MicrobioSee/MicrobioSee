
# rm(list=ls())
# data(dune)
# data(dune.env)
PCoA <-function(pdata,pdata.env,annotates){
# data(pdata)
# data(pdata.env)
  d1 <- read.csv(pdata,row.names = 1)
  d2 <- read.csv(pdata.env,row.names = 1)
d1.dist <- vegdist(d1)#构造距离矩阵。
res=pcoa(d1.dist,correction="none")

# head(res$value)
# head(res$vectors)
# biplot(res)#可视化PCOA 的结果
# anosim(x, grouping, permutations = 999, distance = "bray", strata = NULL, parallel = getOption("mc.cores"))
d1.ano <- with(d2, anosim(d1.dist, d1[,1]))#相似性分析，Goup是指输入pdata.env中的分组信息列


# summary(d1.ano)
plot(d1.ano)
P= d1.ano$signif
R=round( d1.ano$statistic,3)
data=res$vectors[,1:2]
data=data.frame(data)
colnames(data)=c('x','y')
eig=as.numeric(res$value[,1])

# type=dune.env$Management
type=d2[,1]

data=cbind(data,type)

p = ggplot(data, aes(x=x, y=y, color=type))+
  
    geom_point(alpha=.7, size=2) +
    
    labs(x=paste("PCoA 1 (",format(100* eig[1] / sum(eig), digits=4), "%)", sep=""),
         
         y=paste("PCoA 2 (", format(100*eig[2] / sum(eig), digits=4), "%)", sep=""),
         
         title="PCoA")+ 
  
    theme_classic()+stat_ellipse(type ="t", linetype = 2)

if(annotates == "yes"){p + annotate("text",x=0.5,y=-1,parse=TRUE,size=4,label=paste('R:',R),family="serif",fontface="italic",colour="darkred")+
    annotate("text",x=-0.5,y=-1,parse=TRUE,size=4,label=paste('p:',P),family="serif",fontface="italic",colour="darkred")
}else{p}
}