#2021/10/7
#author: Yimeng Sang; Jinhui Li
#v1.0
# setwd("~/pirates")
# rm(list=ls())
#install.packages('yarrr')
library(yarrr)
pvalue <- function(file_aplha,alpha,file_meta,meta,stat_type){
      data_alpha = read.csv(file_aplha,header = TRUE)
      col <- colnames(data_alpha)
      len <- length(data_alpha)
      colnames(data_alpha)[1] <- 'ID'
      data_meta = read.csv(file_meta,header = TRUE)
      colnames(data_meta)[1] <- 'ID'
      all <- merge(data_alpha,data_meta,by="ID")
      y = all[,alpha]
      x = all[,len+meta-1]
      data = data.frame(y,x)
      if(stat_type  == "T-test/ANOVA"){
        aov1 <- aov(y~x,data)
        pv <- summary(aov1)[[1]]["Pr(>F)"][1,1]
        fv <- summary(aov1)[[1]]["F value"][1,1]
        return(paste0("p-value: ",pv,"; \n[ANOVA] F-value: ",fv))
      }else{
        return(paste0("[Kruskal-Wallis] p-value: ",kpvalue =kruskal.test(y~x, data)[3]))
      }
}


pirates <- function(file_aplha,alpha,file_meta,pal,theme,inf.method){
  alphadata = read.table(file_aplha,header = TRUE,sep="\t",)
  col <- colnames(alphadata)
  len <- length(alphadata)
  colnames(alphadata)[1] <- 'ID'
  mymetadata = read.table(file_meta,header = TRUE,sep="\t",)
  colnames(mymetadata)[1] <- 'ID'
  all <- merge(alphadata,mymetadata,by="ID")
  y = all[,alpha]
  x = all[,len+2-1]
  data = data.frame(y,x)
  lg = y ~ x
  main <- colnames(alphadata)[alpha]
  pirateplot(formula =lg ,data = data,main = main,pal=pal,theme = as.numeric(theme),inf.method = inf.method)
  
}


