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


pirates <- function(file_aplha,alpha,file_meta,meta,pal,theme,inf.method){
      
      # opt = t(read.csv(file = "user_argv/time.opt.wc.csv",header = FALSE))
      # colnames(opt)=opt[1,]
      # opt=data.frame(opt)[-c(1),]
        
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
      # col = colnames(data)
      # try({y=data[,1];x=data[,2];z=data[,3];m=data[,4]},silent = TRUE)
      # if(opt$pic == "png") {
      #   png(file = "user_plot/time.wc.png",width = 300*3,height = 500)
      # } else if(opt$pic == "pdf") {
      #   pdf(file = "user_plot/time.wc.pdf",length =1000,width = 300)
      # } else {
      #   jpeg(file = "user_plot/time.wc.jpeg")
      # }
      # len = length(col)
      # 
      # if(len == 2){
      #   langu = y ~ x
      # } else if(len == 3){
      #   langu = y ~ x + z
      # } else if(len == 4){
      #   langu = y ~ x + z + m
      # }else{
      #   print("You have more than 4 columns in your data")
      # }
      langu = y ~ x
      main <- colnames(data_alpha)[alpha]
      pirateplot(formula =langu ,data = data,main = main,pal=pal,theme = as.numeric(theme),inf.method = inf.method)

}
# dev.off()


