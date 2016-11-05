#https://rstudio-pubs-static.s3.amazonaws.com/79471_51be2d274ec04b13b769195e549b4863.html

#set working directory to csv folder
directory <- "C:/00_Datos/00_trabajo/02_Biblio/04_Data_Science/coursera/DataScienceSpecialization/Programacion_en_R/assigments/data/specdata"

pollutantmean <- function(directory, pollutant, id = 1:332) {
#   directory is a character vector indicating the location of CSV files
#   
#   pollutant is a character vector of length 1 indicating
#   the name of the pollutant for which we calculate the mean
  
  setwd(directory)
  
  # create/reset data frame
  dataframe <- data.frame()
  
  # list files in wd
  files_names <- list.files(directory, full.names = TRUE)
  
  for (i in id) {
    # filename <- paste(as.character(i), ".csv", sep="")
    filename <- files_names[i]
    dataframe <- rbind(dataframe, read.csv(filename))
  }
  
  mean(dataframe[[pollutant]], na.rm = TRUE)
  
  #   la opcion siguiente lista todos los csv y une las filas con lapply  
  #   file_names <- dir() #where you have your files
  #   your_data_frame <- do.call(rbind,lapply(file_names,read.csv))
  
}