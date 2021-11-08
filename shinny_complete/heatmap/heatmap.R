#2021-10-10
#author:yimeng sang
# rm(list=ls())
# setwd(dir = "~/heatmap")
#install.packages('pheatmap')
library(pheatmap)

heatmap <- function(file,scale,cluster_rows,cluster_cols,clustering_method,border,cellwidth,cellheight,display_numbers,main,show_colnames,show_rownames,fontsize_number,fontsize){
# opt=t(read.csv("user_argv/time.opt.wc.csv",header = F))
# colnames(opt)=opt[1,]
# opt=data.frame(opt)[-c(1),]
# data <- read.csv(opt$data,row.names = 1),header = T,sep=","
  data <- read.csv(file,row.names = 1)
  
  
  
  # data_numeric <- as.numeric(unlist(data))
  # data_matrix  <-as.matrix(data)
  # # data =apply(data_matrix,2,as.numeric)
  # row(data_matrix,as.factor = FALSE)
  # rownames(data) <- data[1,]
  # data  <-data[-1,]
  
  # rt<-read.table(file="c:\\data.txt")
  # rownames(rt)<-rt[,1]   #?????ݿ??ĵ?һ????Ϊ????
  # rt<-rt[,-1]  #?????ݿ??ĵ?һ??ɾ????ֻ????ʣ????????Ϊ????
  # head(rt)  #?????ǲ??Ǵﵽ??????Ҫ??
  
  
  

# if(opt$pic == "png") {
#   png(file = "user_plot/time.wc.png",width = as.numeric(opt$width),height = as.numeric(opt$height),res = opt$res)
# } else if(opt$pic == "pdf") {
#   pdf(file = "user_plot/time.wc.pdf",)#width = as.numeric(opt$width),height = as.numeric(opt$height))
# } else {
#   jpeg(file = "user_plot/time.wc.jpeg",width = as.numeric(opt$width),height = as.numeric(opt$height),res = opt$res)
# }

pheatmap(data,
         scale = scale,
         #kmeans_k = 3,
         cluster_rows = cluster_rows,
         cluster_cols = cluster_cols,
         clustering_method = clustering_method,
         #legend_breaks = c(-1, 0, 1), legend_labels = c("low", "median", "high"),
         border = border,
         cellwidth = as.numeric(cellwidth), cellheight = as.numeric(cellheight),
         display_numbers = display_numbers,
         
         main = main,
         show_colnames = show_colnames,
         show_rownames = show_rownames,
         fontsize_number = as.numeric(fontsize_number),
         fontsize_row = as.numeric(fontsize),fontsize_col = as.numeric(fontsize)
         )
}

#dev.off()

