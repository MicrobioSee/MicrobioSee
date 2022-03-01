#建立曲线
conf_out<-function(file,outcome,outcome_colum,index1,index1_colum,index2,index2_colum,index3,index3_colum){
  cat(outcome,'\n',outcome_colum,'\n',index1,'\n',index1_colum,'\n',index2,'\n',index2_colum,'\n',index3,'\n',index3_colum)
}
ROC <-function(file,outcome,outcome_colum,index1,index1_colum,index2,index2_colum,index3,index3_colum){
  # data(aSAH)
  data=read.table(file,sep = "\t",header = TRUE)
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
  
  g.list
  
}

