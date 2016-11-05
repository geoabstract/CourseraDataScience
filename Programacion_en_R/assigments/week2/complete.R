
source("pollutantmean.R")

complete <- function(directory, id = 1:3) {
  
  setwd(directory)
  
  nobs <- numeric(0)
  
  # list files in wd
  files_names <- list.files(directory)
  
  for (i in id) {
    # filename <- paste(as.character(i), ".csv", sep="")
    filename <- files_names[i]
    dataframe <- read.csv(filename)
    
    numbers <- as.numeric(complete.cases(dataframe))
    total <- sum(numbers)
    nobs <- c(nobs, total)
  }
  
  result = data.frame(id = id, nobs = nobs)
  return(result)
  
  
  #   la opcion siguiente lista todos los csv y une las filas con lapply  
  #   file_names <- dir() #where you have your files
  #   your_data_frame <- do.call(rbind,lapply(file_names,read.csv))
  
}