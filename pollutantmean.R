pollutantmean <- function(directory="specdata", pollutant="sulfate", id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  mydir <- directory
  if (pollutant == "sulfate"){
    col <- 2
  }
  else {
    col <- 3
  }
  first <- TRUE
  
  myfile = paste(directory, "\\001.csv",sep="")
#  alldata <- read.csv(myfile, header = TRUE)
 # somedata <- read.csv(myfile, header = TRUE)  
 # last <- 332
  for (i in id){
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
    gooddata <-subset(mydata,pollutant>=0, select=pollutant)
  
if (first) {
  somedata <- gooddata
  first <-FALSE
}
    else {
    
  somedata <- rbind(somedata,gooddata)
    }
  }

y <- somedata

use <- !is.na(y)
goody <- y[use]
ybar<-mean(goody)

print(ybar)
  
 
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
}