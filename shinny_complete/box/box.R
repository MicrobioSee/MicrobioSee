box <- function(file,xlab,ylab,main,notch,color,horizontal){
data <- read.csv(file)
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



