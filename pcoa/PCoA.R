PCoA <-function(pdata,pdata.env,annotates,method){
  d1 <- read.table(pdata,header = TRUE,sep = "\t",row.names = 1)
  d2 <- read.table(pdata.env,header = TRUE,sep = "\t",row.names = 1)
  d1.dist <- vegdist(d1,method=method)#构造距离矩阵。
  pcoaOUT=pcoa(d1.dist,correction="none")
  d1.ano <- with(d2, anosim(d1.dist, d1[,1]))#相似性分析，Goup是指输入pdata.env中的分组信息列
  plot(d1.ano)
  P= d1.ano$signif
  R=round( d1.ano$statistic,3)
  data=pcoaOUT$vectors[,1:2]
  data=data.frame(data)
  colnames(data)=c('x','y')
  pcoaOUT1=as.numeric(pcoaOUT$value[,1])
  type=d2[,1]
  data=cbind(data,type)
  p = ggplot(data, aes(x=x, y=y, color=type))+
    geom_point(alpha=.7, size=2) +
    labs(x=paste("PCoA 1 (",format(100* pcoaOUT1[1] / sum(pcoaOUT1), digits=4), "%)", sep=""),
         y=paste("PCoA 2 (", format(100*pcoaOUT1[2] / sum(pcoaOUT1), digits=4), "%)", sep=""),
         title="PCoA")+ 
    theme_classic()+stat_ellipse(type ="t", linetype = 2)
  if(annotates == "yes"){
    p + annotate("text",x=0.5,y=-1,parse=TRUE,size=4,label=paste('R:',R),family="serif",fontface="italic",colour="darkred")+
      annotate("text",x=-0.5,y=-1,parse=TRUE,size=4,label=paste('p:',P),family="serif",fontface="italic",colour="darkred")
  }else{p}
}