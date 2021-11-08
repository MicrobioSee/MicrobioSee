#2021/10/7
#author: Yimeng Sang; Jinhui Li
#v1.0
# setwd("~/pirates")
# rm(list=ls())
#install.packages('yarrr')
library(yarrr)
pirates <- function(file,main,pal,theme,inf.method){

# opt = t(read.csv(file = "user_argv/time.opt.wc.csv",header = FALSE))
# colnames(opt)=opt[1,]
# opt=data.frame(opt)[-c(1),]
  
data = read.csv(file,header = TRUE)
col = colnames(data)
try({y=data[,1];x=data[,2];z=data[,3];m=data[,4]},silent = TRUE)
# if(opt$pic == "png") {
#   png(file = "user_plot/time.wc.png",width = 300*3,height = 500)
# } else if(opt$pic == "pdf") {
#   pdf(file = "user_plot/time.wc.pdf",length =1000,width = 300)
# } else {
#   jpeg(file = "user_plot/time.wc.jpeg")
# }
len = length(col)

if(len == 2){
  langu = y ~ x
} else if(len == 3){
  langu = y ~ x + z
} else if(len == 4){
  langu = y ~ x + z + m
}else{
  print("You have more than 4 columns in your data")
}

pirateplot(formula =langu ,data = data,main = main,pal=pal,theme = as.numeric(theme),inf.method = inf.method)

}
# dev.off()


