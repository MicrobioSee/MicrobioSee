
library(pROC)
library(ggplot2)
rm(list = ls())
#建立曲线
ROC <-function(file,outcome,outcome_colum,index1,index1_colum,index2,index2_colum,index3,index3_colum){

  # data(aSAH)
  data=read.csv(file)
  df <-data.frame(data)

#roc(aSAH$outcome, aSAH$s100b)
  outcome <-df[,as.numeric(outcome_colum)]
  if(is.numeric(index1_colum)){
  
    
    index11 <-df[,as.numeric(index1_colum)]
  # len =2
  } else{index11=0}
  
  if(is.numeric(index2_colum)){
  index22 <-df[,as.numeric(index2_colum)]
  # len =3
  }else{index22=0}
  if(is.numeric(index3_colum)){
  index33 <-df[,as.numeric(index3_colum)]
  # len =4
  }else{index33=0}
  
  # col <-c(outcome_colum,index1_colum,index2_colum,index3_colum)
  if(index11==0){
    len =1
  }else if(index22==0){
    len =2
  }else if(index33==0){
    len =3
  }else {len =4}
  
  
  try({outcome <-df[,as.numeric(outcome_colum)];index11 <-df[,as.numeric(index1_colum)];index22 <-df[,as.numeric(index2_colum)];index33 <-df[,as.numeric(index3_colum)]},silent = TRUE)
  # len = length(col)
  
  if(len == 2){
    # as.character(index1) <-index1
    langu = outcome ~ index11
  } else if(len == 3){
    langu = outcome ~ index11+index22
  } else if(len == 4){
    langu = outcome ~ index11+index22+index33
  }else if(len ==1){
    print("You have more than 2 columns in your data")
  }
  # df$name<-factor(df$name,
  #                        levels = c('index11','index22','index33'),
  #                        labels = c(as.character(index1),as.character(index2),as.character(index3)))
  roc.list <- roc(formula =langu, data = df)
  g.list <- ggroc(roc.list)+scale_colour_discrete(
    name=NULL,
    breaks = c('index11','index22','index33'),
    labels = c(as.character(index1),as.character(index2),as.character(index3)))

  #+theme_base()
  g.list
  # outcome_colum
  # index1_colum
  # index2_colum
  # index3_colum
# rocobj1<-roc(aSAH$outcome, aSAH$s100b)
# # rocobj2<-roc(aSAH$outcome,aSAH$wfns)
# # rocobj3<-roc(aSAH$outcome,aSAH$ndka)
# #计算full AUC
# auc(rocobj1)
# # auc(rocobj2)
# # auc(rocobj3)
# #绘制曲线
# plot(rocobj1)
  
  
#ggplot plot
# s100 <- df[,6]
# roc.list <- roc(df[,2] ~ s100+wfns+ndka, data = aSAH)
# 
# g.list <- ggroc(roc.list)+theme_base()
# g.list


#其他参数美化
# plot(rocobj1,print.auc=TRUE,auc.polygon=TRUE,grid=c(0.1,0.2),grid.col=c("green","red"),max.auc.polygon=TRUE,auc.polygon.col="skyblue",print.thres=TRUE)
# #计算partial AUC选择关注一定范围数据
# plot(rocobj1,print.auc=TRUE,auc.polygon=TRUE,partial.auc=c(0.8,0.4),partial.auc.focus="sp",grid=c(0.1,0.2),grid.col=c("green","red"),max.auc.polygon=TRUE,auc.polygon.col="skyblue",print.thres=TRUE,reuse.auc=FALSE)
# # #比较两个曲线，pROC提供三种方法比较"delong", "bootstrap"或"venkatraman"
# # roc.test(rocobj1,rocobj2,method = "bootstrap")
# # #ggroc(功能仍在测试中)绘制Multiple curves
# # jc(list(s100b=rocobj1,wfns=rocobj2,ndka=rocobj3))
# # g3
}

