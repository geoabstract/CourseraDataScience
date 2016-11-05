source("pollutantmena.R")
source("complete.R")

corr <- function(directory, threshold = 0) {
  
  all.cases <- complete(directory, id = 1:332)
  needed.cases <- subset(all.cases, all.cases$nobs > threshold)
  result <- numeric(0)
  id <- needed.cases$id
  
  for (i in id) {
    data <- read.csv(files_names[i])
    crl <- cor(data$sulfate, data$nitrate, use = "pairwise.complete.obs")
    result <- c(result, crl)
  }
  return (result)

  }