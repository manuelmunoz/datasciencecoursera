complete <- function(directory, id = 1:332) {
  # Initializing counters
  h <- 0
  suma <- 0
  contador <- 0
  
  final <- data.frame()
  
  # Retrieving list of data files
  ficheros <- dir("specdata")
  
  # Going through data files
  for(h in id) {
    # Dumping a single file in a data frame
    datos <- read.csv(paste("/home/manuel/datasciencecoursera/", directory, "/", ficheros[h], sep = ""))
    resultado <- subset(datos, (!is.na(datos[, 2])) & (!is.na(datos[, 3])))
    final <- rbind(final, c(h, nrow(resultado)))
  }  
  
  final <- setNames(final, c("id","nobs"))
  final
}