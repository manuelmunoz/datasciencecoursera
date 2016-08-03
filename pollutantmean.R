pollutantmean <- function(directory, pollutant, id = 1:332) {
  # Initializing counters
  i <- 0
  suma <- 0
  contador <- 0
  
  # Retrieving list of data files
  ficheros <- dir(directory)
  
  # Going through data files
  for(i in id) {
    # Dumping a single file in a data frame
    datos <- read.csv(paste("/home/manuel/datasciencecoursera/", directory, "/", ficheros[i], sep = ""))
    # Depending on the toxic component...
    if(pollutant == "sulfate") {
      # Adding all non NA values
      suma <- suma + sum(datos[, 2], na.rm = TRUE)
      # Adding number of valid rows processed
      contador <- contador + sum(!is.na(datos$sulfate))
    }  
    else {
      suma <- suma + sum(datos[, 3], na.rm = TRUE)
      contador <- contador + sum(!is.na(datos$nitrate))
    }
  }
  # Calculating mean
  media <- suma / contador
  # Printing solution
  #print(round(media, 3))
  print(media)
}