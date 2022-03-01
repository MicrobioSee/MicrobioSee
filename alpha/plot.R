# conf_out <- function(file_aplha,alpha,file_meta,stat_type){
  # cat(file_aplha,alpha,file_meta,stat_type)
# }
pvalue <- function(file_aplha,alpha,file_meta,stat_type){
  alphadata = read.table(file_aplha,header = TRUE,sep = '\t')
  col <- colnames(alphadata)
  len <- length(alphadata)
  colnames(alphadata)[1] <- 'ID'
  mymetadata = read.table(file_meta,header = TRUE,sep = '\t')
  colnames(mymetadata)[1] <- 'ID'
  all <- merge(alphadata,mymetadata,by="ID")
  y = all[,alpha]
  x = all[,len+2-1]
  data = data.frame(y,x)
  if(stat_type  == "T-test/ANOVA"){
    tableaov <- aov(y~x,data)
    pv <- round(summary(tableaov)[[1]]["Pr(>F)"][1,1],3)
    fv <- round(summary(tableaov)[[1]]["F value"][1,1],3)
    return(paste0("p-value: ",pv,"; \n[ANOVA] F-value: ",fv))
  }else{
    kpvalue=kruskal.test(y~x, data)[3]
    return(paste0("[Kruskal-Wallis] p-value: ",kpvalue))
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
box <- function(file_aplha,alpha,file_meta){#,main,notch,color,horizontal){
  alphaOTU = read.table(file_aplha, header=T, row.names=1, sep="\t", comment.char="")
  metadata = read.table(file_meta, header=T, row.names=1, sep="\t", comment.char="", stringsAsFactors = F)
  alpha_boxplot(alphaOTU=alphaOTU,metadata=metadata, index = colnames(alphaOTU)[alpha-1],groupID = colnames(metadata))
}


cloudyrainplot<-function(file_alpha,file_meta,alpha,dotposition,dotsize,dotbinwidth,boxwidth,boxposition,transpose){
  meta=2
  alphadata<-read.table(file_alpha,sep = "\t", header=T)
  mymetadata<-read.table(file_meta,sep = "\t", header=T )
  col <- colnames(alphadata)
  len <- length(alphadata)
  colnames(alphadata)[1] <- 'ID'
  colnames(mymetadata)[1] <- 'ID'
  all <- merge(alphadata,mymetadata,by="ID")
  y = all[,alpha]
  x = all[,len+meta-1]
  data = data.frame(y,x)
  if(transpose==0){
    ggplot(data, aes(x = x,
                     y = y, 
                     fill = x)) +
      geom_violindot(position = position_nudge(x=dotposition),dots_size =dotsize,binwidth =dotbinwidth) +
      geom_boxplot(width=boxwidth,position = position_nudge(x=boxposition),outlier.colour =NA,show.legend = FALSE)+
      
      theme_modern()
  }else{
    ggplot(data, aes(x = x,
                     y = y, 
                     fill = x)) +
      geom_violindot(position = position_nudge(x=dotposition),dots_size =dotsize,binwidth =dotbinwidth) +
      geom_boxplot(width=boxwidth,position = position_nudge(x=boxposition),outlier.colour =NA,show.legend = FALSE)+
      theme_modern()+
      coord_flip()
  }
}


violinplot<-function(file_alpha,file_meta,alpha,xlabel,ylabel){
  meta=2
  alphadata <- read.table(file_alpha,sep = "\t", header=T)
  mymetadata <- read.table(file_meta,sep = "\t", header=T)
  theme_set(theme_bw())
  col <- colnames(alphadata)
  len <- length(alphadata)
  colnames(alphadata)[1] <- 'ID'
  colnames(mymetadata)[1] <- 'ID'
  all <- merge(alphadata,mymetadata,by="ID")
  y = all[,alpha]
  x = all[,len+meta-1]
  data = data.frame(y,x)
  ggplot(data, aes(x,y))+
    geom_violin(aes(fill=x)) +
    labs(
      x=xlabel,
      y=ylabel)
}    



