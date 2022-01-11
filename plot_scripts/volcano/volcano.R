#####火山图
volcanoplot<-function(vfile,p,lFC){
#读取数据
data <- read.table(vfile,header = TRUE)

data<-subset(data,logFC!="NA") #删除log2FoldChange中的空值
data<-subset(data,P.Value!="NA") #删除pvalue中的空值
threshold <- as.factor(ifelse(data$P.Value < p&
                                abs(data$logFC) >= lFC ,
                              ifelse(data$logFC >= lFC ,'Up','Down'),'Not'))
ggplot(data,aes(x=logFC,y=-log10(P.Value),colour=threshold)) +
  xlab("log2(Fold Change)")+ylab("-log10(qvalue)") +
  geom_point(size = 2,alpha=1) +####这里什么意思
  scale_color_manual(values=c("blue","grey", "red"))
}