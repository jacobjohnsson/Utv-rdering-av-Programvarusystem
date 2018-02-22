# Returnerar en vektor med genomsnitten för N körningar
loopfunction <- function(n){
  vectorOfMeans <- 1:n
  for(index in 1:n){
    system("java -cp bin sorter.LabCollectionSort data1.txt utfil.txt 600")
    data <- read.csv("resources/utfil.txt", header = T)
    data <- data[150:nrow(data),]
    vectorOfMeans[index] <- mean(data[,2])
  }
  return(vectorOfMeans)
}

# Returnerar en vektor med genomsnitten för N körningar
loopfunction2 <- function(n){
  vectorOfMeans <- 1:n
  for(index in 1:n){
    system("java -cp bin sorter.LabEgenSort data2.txt utfil.txt 600")
    data <- read.csv("resources/utfil.txt", header = T)
    data <- data[150:nrow(data),]
    vectorOfMeans[index] <- mean(data[,2])
  }
  return(vectorOfMeans)
}

vectorOfMeansCollection <- loopfunction(10)
vectorOfMeansEgen <- loopfunction2(10)

data <- data.frame(vectorOfMeansCollection, vectorOfMeansEgen)
names(data) <- c("Collection", "Egen")

## Detta måste köras i konsollen. Obs: data sparas i global environment! VARFÖR!?
#t.test(data$Collection, data$Egen)

#dev.off()