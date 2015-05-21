corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  mydir <- directory 
  first <- TRUE
  id <- 1:332
  a <- numeric(length=0)


  
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
    
    gooddata <-subset(mydata,sulfate >= 0 & nitrate >=0)
    if (nrow(gooddata)>threshold){
      #print(gooddata)
      x <- gooddata[,2]
      y <- gooddata[,3]

      cr <- cor(x,y)
      a <- union(a,cr)
      
    }
    }
a
}
