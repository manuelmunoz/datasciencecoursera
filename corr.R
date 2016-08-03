corr <- function(directory, threshold = 0) {
  # Initializing counters
  i <- 0
  final <- c()
  
  # Retrieving list of data files
  ficheros <- dir("specdata")
  
  # Going through data files
  for(fichero in ficheros) {
    # Dumping a single file in a data frame
    datos <- read.csv(paste("/home/manuel/datasciencecoursera/", directory, "/", fichero, sep = ""))
    datos <- subset(datos, (!is.na(datos$sulfate) & (!is.na(datos$sulfate))))
    filasbuenas <- nrow(datos)
    if(filasbuenas > threshold) {
      resultado <- cor(datos[, 2], datos[, 3])
      final <- append(final, resultado)
    }
  }
  final
}