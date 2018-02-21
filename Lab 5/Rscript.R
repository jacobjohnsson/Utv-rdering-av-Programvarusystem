
# function for plotting data
plotresult <- function(file, start = 1){
  data <- read.csv("resources/utfil.txt", header = T)
  data <- data[start:nrow(data),]
  plot(data, type = 'l')
}

# Returnerar en vektor med genomsnitten för N körningar
loopfunction <- function(n){
  vectorOfMeans <- 1:n
  for(index in 1:n){
    system("java -Xint -cp bin sorter.Lab infil.txt utfil.txt 600")
    data <- read.csv("resources/utfil.txt", header = T)
    data <- data[200:nrow(data),]
    vectorOfMeans[index] <- mean(data[,2])
  }
  plot(vectorOfMeans, type = 'l')
  return(vectorOfMeans)
}
system("java -Xint -cp bin sorter.Lab infil.txt utfil.txt 600")
vectorOfMeans <- loopfunction(10)
#plot(vectorOfMeans, type = 'l')

source("/usr/local/cs/EDAA35/R_resources.R")
confIntValue <- confidenceInterval(vectorOfMeans, confidenceLevel = 0.95)

averageOfMeans <- mean(vectorOfMeans) 

pdf("result1.pdf")
plotresult("resources/utfil.txt", 200)

dev.off()