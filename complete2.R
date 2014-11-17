complete2 <- function(d, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  #completedata=data.frame(id=vector("integer",length(id)),nobs=vector("integer",length(id)))
  #filenames=list.files("specdata")[id]
  
  
  #fullpath=paste(directory,list.files("specdata")[id],sep="/")
  
  #data <- lapply(paste(directory,list.files("specdata")[id],sep="/"),read.csv)

  #completecases=lapply(lapply(paste(directory,list.files("specdata")[id],sep="/"),read.csv),complete.cases)
  #goodcases=lapply(lapply(lapply(paste(directory,list.files("specdata")[id],sep="/"),read.csv),complete.cases),sum)
  goodcases=sapply(lapply(lapply(paste(d,list.files("specdata")[id],sep="/"),read.csv),complete.cases),sum)
  
  completedata$id=id
  #completedata=data.frame(id=id,nobs=unlist(lapply(lapply(lapply(paste(directory,list.files("specdata")[id],sep="/"),read.csv),complete.cases),sum)))
  completedata$nobs=goodcases
  
  
  completedata
  
  
}