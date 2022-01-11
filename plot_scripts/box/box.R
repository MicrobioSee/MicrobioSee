box <- function(file,xlab,ylab,main,notch,color,horizontal){

  
# alpha_div <- as.data.frame(t(read.csv(file))) 
# alpha_boxplot(alpha_div, index = opts$alpha_index, metadata, groupID = opts$group)

data <- read.table(file,header = TRUE,sep = '\t')
boxplot(data[,1] ~ data[,2], data = data, 
  xlab = xlab,
  ylab = ylab, 
  main =main,
  notch =notch, 
  varwidth = TRUE, 
  col=color,
  # names=names,
  horizontal =horizontal 
)
}



