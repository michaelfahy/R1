complete <- function(directory="specdata", id = 1:332) {
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
  mydir <- directory

  #first <- TRUE
  
  #myfile = paste(directory, "\\001.csv",sep="")

  
  #cd <- data.frame(id=integer(), nobs=integer())
  n <- length(id)
  nobs = integer(n)
  myindex <-0
  
  for (i in id){
    myindex <- myindex+1
    if (i<10){
      myfile = paste(directory, "\\00",i,".csv",sep="")
    }
    else if (i<100){
      myfile = paste(directory,"\\0",i,".csv",sep="")
    }
    else{
      myfile = paste(directory,"\\",i,".csv",sep="")
      
    }
    
    #print(myfile)  
    mydata <- read.csv(myfile, header = TRUE)
    
    gooddata <-subset(mydata,sulfate >= 0 & nitrate >=0)
    nobs[myindex]<-nrow(gooddata)
   
    
    
  }
  cd <- data.frame(id,nobs)
  print(cd)

}