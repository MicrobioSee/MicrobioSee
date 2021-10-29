percentage <- function(arg1){
  for (i in 1:ncol(arg1)){arg1[,i]<-arg1[,i]/sum(arg1[,i])} 
  return(arg1)} 
#将传入的数据计算为每组不同值的百分占比
getsum <- function(arg2){
  arg2 <- arrange(arg2,desc(arg2[,1]))
  for (i in 1:ncol(arg2)){
    x_name = paste0('mu',i)
    assign(x_name,cumsum(arg2[,i]))
    arg2 <- cbind(arg2,get(paste0('mu',i)))
    colnames(arg2)[ncol(arg2)] <- paste0("mu",i)
  }
  return(arg2)
}
#在表格末尾新加行进行累加
res_arr <- function(arg3){
  arg3 <- arrange(melt(arg3),melt(arg3)[,1])
  return(arg3)
}
#reshape表格数据，并排序
##用法: 
#data <- read.csv("Shiny_Stacked_column_charts/default.csv",row.names = 1)
#percentage(data)
#getsum(percentage(data))
#res_arr(percentage(data))