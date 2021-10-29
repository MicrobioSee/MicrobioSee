box_plot <- function(file){
        data <- read.csv(file)
        boxplot(data[,1] ~ data[,2],data = data,xlab = xlab,ylab = ylab,col = col)
}