heatmap <- function(file,scale,cluster_rows,cluster_cols,clustering_method,border,display_numbers,main,show_colnames,show_rownames,fontsize_number,fontsize){
  data <- read.table(file,header = TRUE,row.names = 1,sep = "\t")
  # 
  # # data <- read.table("./www/heatmap.txt",row.names = 1,header = TRUE,sep = "\t")
  # pheatmap(test)
  # data 
  pheatmap(data,
           scale = scale,
           #kmeans_k = 3,
           cluster_rows = cluster_rows,
           cluster_cols = cluster_cols,
           clustering_method = clustering_method,
           #legend_breaks = c(-1, 0, 1), legend_labels = c("low", "median", "high"),
           border = border,
           # cellwidth = as.numeric(cellwidth), cellheight = as.numeric(cellheight),
           display_numbers = display_numbers,

           main = main,
           show_colnames = show_colnames,
           show_rownames = show_rownames,
           fontsize_number = fontsize_number,
           fontsize_col =fontsize
  )
}


