
# function for plotting data
plotresult <- function(file, start = 1){
  data <- read.csv(file, header = T)
  data <- data[start:nrow(data),]
  plot(data, type = 'l')
}

# Returnerar en vektor med genomsnitten för N körningar
loopfunction <- function(n){
  vectorOfMeans <- 1:n
  for(index in 1:n){
    system("java -cp bin sorter.LabEgenSort data1.txt utfil.txt 600")
    data <- read.csv("resources/utfil.txt", header = T)
    data <- data[150:nrow(data),]
    vectorOfMeans[index] <- mean(data[,2])
  }
  plot(vectorOfMeans, type = 'l')
  return(vectorOfMeans)
}

## Dessa två används då det ska köras EN gång!
#system("java -cp bin sorter.LabEgenSort data1.txt utfil.txt 600")
#plotresult("resources/utfil.txt", 1)

vectorOfMeans <- loopfunction(100)
plot(vectorOfMeans, type = 'l')

source("/usr/local/cs/EDAA35/R_resources.R")
confIntValue <- confidenceInterval(vectorOfMeans, confidenceLevel = 0.95)

averageOfMeans <- mean(vectorOfMeans)

pdf("result1.pdf")
plot(vectorOfMeans, type = 'l')
#plotresult("resources/utfil.txt", 1)

dev.off()