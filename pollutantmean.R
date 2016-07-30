pollutantmean <- function(directory, pollutant, id = 1:332) {
  setwd(directory)
  
  for( i in id) {
    my_matrix <- read.csv(cat(directory, "/", i, ".csv")
    if (pollutant == "sulfate") {
       print(mean(my_matrix[, 2]))  
    }
    else {
       print(mean(my_matrix[, 3]))
    }
  }
}