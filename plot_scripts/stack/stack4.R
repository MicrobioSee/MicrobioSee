
# rm(list=ls())
percentage <- function(arg1){
  arg1 <- arg1/sum(arg1) 
  return(arg1)} 
get_abc <- function(x0,y0,x1,y1) {
  a = (y1-y0)/(x0-x1)^2
  b = 2*x0*(y0-y1)/(x0-x1)^2
  c = y0+(y1-y0)/(x1-x0)^2*x0^2
  return(c(a,b,c))
}#前提准备

stack <- function(a,sline,stheme,color){
  tempdata <- a
  for (i in 2:ncol(a)){a[,i]<-percentage(a[,i])}
  a <- arrange(a,desc(a[,1]))
  for (i in 2:ncol(a)){
    x_name = paste0('mu',i)
    assign(x_name,cumsum(a[,i]))
    a <- cbind(a,get(paste0('mu',i)))
    colnames(a)[ncol(a)] <- paste0("mu",i)
  }
  datasum <- a
  a <- tempdata
  for (i in 2:ncol(a)){a[,i]<-percentage(a[,i])}
  a <- arrange(a,desc(a[,1]))
  mydata <- melt(a,id.vars = 1)
  mydata <- arrange(mydata,mydata[,1])
  newword<-paste("p =ggplot()+
    geom_bar(data =mydata,mapping = aes(variable,value,fill=",as.character(colnames(a)[1]),"),stat='identity',width = 0.5)+
    scale_y_continuous(expand=c(0,0))")
  eval(parse(text=newword))
  
  
  # p <- ggplot()+
  #   geom_bar(data =mydata,mapping = aes(variable,value,fill=Bacteria),stat="identity",width = 0.5)+
  #   scale_y_continuous(expand=c(0,0))
  #p
  if(sline == "straight"){
    if(ncol(a) == 2){
      p <- p 
    } else if(ncol(a) == 3){
      p <- p + geom_segment(data = datasum,aes(x=1.25, xend=1.75, y=mu2, yend=mu3))
    } else if(ncol(a) == 4){
      p <- p + geom_segment(data = datasum,aes(x=1.25, xend=1.75, y=mu2, yend=mu3)) +
        geom_segment(data = datasum,aes(x=2.25, xend=2.75, y=mu3, yend=mu4))
    } else if(ncol(a) == 5){
      p <- p + geom_segment(data = datasum,aes(x=1.25, xend=1.75, y=mu2, yend=mu3)) +
        geom_segment(data = datasum,aes(x=2.25, xend=2.75, y=mu3, yend=mu4)) +
        geom_segment(data = datasum,aes(x=3.25, xend=3.75, y=mu4, yend=mu5))
    } else if(ncol(a) == 6){
      p <- p + geom_segment(data = datasum,aes(x=1.25, xend=1.75, y=mu2, yend=mu3)) +
        geom_segment(data = datasum,aes(x=2.25, xend=2.75, y=mu3, yend=mu4)) +
        geom_segment(data = datasum,aes(x=3.25, xend=3.75, y=mu4, yend=mu5)) +
        geom_segment(data = datasum,aes(x=4.25, xend=4.75, y=mu5, yend=mu6))
    } else if(ncol(a) == 7){
      p <- p + geom_segment(data = datasum,aes(x=1.25, xend=1.75, y=mu2, yend=mu3)) +
        geom_segment(data = datasum,aes(x=2.25, xend=2.75, y=mu3, yend=mu4)) +
        geom_segment(data = datasum,aes(x=3.25, xend=3.75, y=mu4, yend=mu5)) +
        geom_segment(data = datasum,aes(x=4.25, xend=4.75, y=mu5, yend=mu6)) +
        geom_segment(data = datasum,aes(x=5.25, xend=5.75, y=mu6, yend=mu7)) 
    } else if(ncol(a) == 8){
      p <- p + geom_segment(data = datasum,aes(x=1.25, xend=1.75, y=mu2, yend=mu3)) +
        geom_segment(data = datasum,aes(x=2.25, xend=2.75, y=mu3, yend=mu4)) +
        geom_segment(data = datasum,aes(x=3.25, xend=3.75, y=mu4, yend=mu5)) +
        geom_segment(data = datasum,aes(x=4.25, xend=4.75, y=mu5, yend=mu6)) +
        geom_segment(data = datasum,aes(x=5.25, xend=5.75, y=mu6, yend=mu7)) +
        geom_segment(data = datasum,aes(x=6.25, xend=6.75, y=mu7, yend=mu8))
    }
    
  }else if (sline == "curve"){
    
    number <-ncol(a)-2
    # for (i in 1:number){
    #   assign(paste0("x",3*i-3),1.25+i-1)
    #   assign(paste0("y",3*i-3),datasum[,as.numeric(number)+i+2])
    #   assign(paste0("x",3*i-2),1.5+i-1)
    #   assign(paste0("y",3*i-2),(datasum[,as.numeric(number)+i+2]+datasum[,as.numeric(number)+i+3])/2)
    #   assign(paste0("x",3*i-1),1.75+i-1)
    #   assign(paste0("y",3*i-1),datasum[,as.numeric(number)+i+3])
    # }
    dff <-c(1,2,3)
    y<-nrow(a)
    for (i in 1:number){#i=2,a=1
      for (a in 1:y){
        # get_abc <- function(x0,y0,x1,y1)
        
        assign(paste0("abc_",i,"_R_",a),
               get_abc(
                 assign(paste0("x",3*i-1),1.75+i-1),#x2,x5
                 assign(paste0("y",3*i-1),datasum[,as.numeric(number)+i+3])[a],#y2,y5
                 assign(paste0("x",3*i-2),1.5+i-1),#x1,x4
                 assign(paste0("y",3*i-2),(datasum[,as.numeric(number)+i+2]+datasum[,as.numeric(number)+i+3])/2)[a]))#y1,y4
        assign(paste0("abc_",i,"_l_",a),
               get_abc(assign(paste0("x",3*i-3),1.25+i-1),#x0
                       assign(paste0("y",3*i-3),datasum[,as.numeric(number)+i+2])[a],#y0
                       assign(paste0("x",3*i-2),1.5+i-1),#x1
                       assign(paste0("y",3*i-2),(datasum[,as.numeric(number)+i+2]+datasum[,as.numeric(number)+i+3])/2)[a]))#y1
        col2<-c(as.numeric(assign(paste0("abc_",i,"_R_",a),get_abc(assign(paste0("x",3*i-1),1.75+i-1),assign(paste0("y",3*i-1),datasum[,as.numeric(number)+i+3])[a],assign(paste0("x",3*i-2),1.5+i-1),assign(paste0("y",3*i-2),(datasum[,as.numeric(number)+i+2]+datasum[,as.numeric(number)+i+3])/2)[a]))))
        col1 <-c(as.numeric(assign(paste0("abc_",i,"_l_",a),get_abc(assign(paste0("x",3*i-3),1.25+i-1),assign(paste0("y",3*i-3),datasum[,as.numeric(number)+i+2])[a],assign(paste0("x",3*i-2),1.5+i-1),assign(paste0("y",3*i-2),(datasum[,as.numeric(number)+i+2]+datasum[,as.numeric(number)+i+3])/2)[a]))))
        dff <-cbind.data.frame(dff,col1,col2)
      }
    }
    
    
    
    rownames(dff)=dff[,1]
    dff=dff[,-1]
    
    word<-"+"
    for (o in 1:number){
      for (z in 1:y){
        
        # word<-paste(word,paste0(
        #   "stat_function(fun = function(x){dff[1,10*(",
        #   as.numeric(o),"-1)+2*",
        #   as.numeric(z),"-1]*x^2+dff[2,10*(",
        #   as.numeric(o),"-1)+2*",
        #   as.numeric(z),"-1]*x+dff[3,10*(",
        #   as.numeric(o),"-1)+2*",
        #   as.numeric(z),"-1]},xlim=c(x=1.25+",
        #   as.numeric(o),"-1, xend=1.5+",
        #   as.numeric(o),"-1))+stat_function(fun =function(x){dff[1,10*(",
        #   as.numeric(o),"-1)+2*",
        #   as.numeric(z),"]*x^2+dff[2,10*(",
        #   as.numeric(o),"-1)+2*",as.numeric(z),"]*x+dff[3,10*(",
        #   as.numeric(o),"-1)+2*",as.numeric(z),"]},xlim=c(x=1.5+",
        #   as.numeric(o),"-1, xend=1.75+",as.numeric(o),"-1))+"))
        # 
        word<-paste(word,paste0(
          "stat_function(fun = function(x){dff[1,2*y*(",
          as.numeric(o),"-1)+2*",
          as.numeric(z),"-1]*x^2+dff[2,2*y*(",
          as.numeric(o),"-1)+2*",
          as.numeric(z),"-1]*x+dff[3,2*y*(",
          as.numeric(o),"-1)+2*",
          as.numeric(z),"-1]},xlim=c(x=1.25+",
          as.numeric(o),"-1, xend=1.5+",
          as.numeric(o),"-1))+stat_function(fun =function(x){dff[1,2*y*(",
          as.numeric(o),"-1)+2*",
          as.numeric(z),"]*x^2+dff[2,2*y*(",
          as.numeric(o),"-1)+2*",as.numeric(z),"]*x+dff[3,2*y*(",
          as.numeric(o),"-1)+2*",as.numeric(z),"]},xlim=c(x=1.5+",
          as.numeric(o),"-1, xend=1.75+",as.numeric(o),"-1))+"))
        
      }
    }
    
    
    
    # newword<-paste("p =ggplot()+
    # geom_bar(data =mydata,mapping = aes(variable,value,fill=",as.character(colnames(a)[1]),"),stat='identity',width = 0.5)+
    # scale_y_continuous(expand=c(0,0))")
    # eval(parse(text=newword))
    
    word2<-paste("p=p",word)
    # parse(text=word2)
    nchar(word2)
    word3<-substring(word2,1,nchar(word2)-1)
    eval(parse(text=word3))
  }
  #主题开关，定义背景色主要用了ggtheme
  if (stheme == "bw"){p<-p+theme_bw()}else if (stheme == "classic"){p<-p+theme_classic()}else if (stheme == "economist"){p<-p+theme_economist()}else if (stheme == "fivethirtyeight"){p<-p+theme_fivethirtyeight()}else if (stheme == "map"){p<-p+theme_map()}else if (stheme == "base"){p<-p+theme_base()}else if (stheme == "wsj"){p<-p+theme_wsj()}else if (stheme == "dark"){p<-p+theme_dark()}
  #柱子调色开关，定义柱子的颜色，主要参考ggsci
  if (color == "npg"){p<-p+scale_fill_npg()}else if (color == "nejm"){p<-p+scale_fill_nejm()}else if (color == "lancet"){p<-p+scale_fill_lancet()}else if (color == "rickandmorty"){p<-p+scale_fill_rickandmorty()}else if (color == "tron"){p<-p+scale_fill_tron()}else if (color == "grey"){p<-p+scale_fill_grey()}
  
  p<- p+guides(fill =
                 guide_legend(
                   label.theme = element_text(
                     size = 7,
                     face = "italic", ##粗斜体
                     
                     angle = 0  ##角度
                   )
                 ))
  p
}
