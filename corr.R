corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations

  vec=vector("numeric",0)
  for(j in 1:332) {
    filename=sprintf("%03d.csv",j)
    fullpath=paste(directory,filename,sep="/")
    data <- read.csv(fullpath)
    goodcases=sum(complete.cases(data))
    if(goodcases>threshold){
      vec=c(vec,cor(data$nitrate,data$sulfate,"pairwise.complete.obs"))
    }
  
  }
  
  vec
  
  
}