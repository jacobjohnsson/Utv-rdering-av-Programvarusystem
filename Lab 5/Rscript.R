
# function for plotting data
plotresult <- function(file, start = 1){
  data <- read.csv("resources/utfil.txt", header = T)
  data <- data[start:nrow(data),]
  plot(data, type = 'l')
}

loopfunction <- function(n){
  totalmean <- 1:n
  for(index in 1:n){
    system("java -cp bin sorter.Lab infil.txt utfil.txt 600")
    plotresult("resources/utfil.txt", 200)
    data <- read.csv("resources/utfil.txt", header = T)
    data <- data[200:nrow(data),]
    totalmean[index] <- mean(data[,2])
  }
  #fullhax för att få en linje av verkliga medelvärdet
  truemean <- 1:n
  for(index in 1:n){
    truemean[index] <- mean(totalmean)
  }
  plot(totalmean, type = 'l')
  lines(truemean, type = 'l')
}
system("java -cp bin sorter.Lab infil.txt utfil.txt 600")
plotresult("resources/utfil.txt", 200)
loopfunction(50)

pdf("result1.pdf")
plotresult("resources/utfil.txt", 200)

dev.off()