pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  
  #First I read the data in the given directory
  sumall=0.0
  goodelements=0;
  
  for(j in id){
    filename=sprintf("%03d.csv",j)
    fullpath=paste(directory,filename,sep="/")
    data <- read.csv(fullpath)
    datavector=data[[pollutant]]
    sumall=sumall+sum(datavector,na.rm = TRUE)
    goodelements=goodelements+sum(!is.na(datavector))

  }
  meanall= sumall/goodelements
  meanall
}