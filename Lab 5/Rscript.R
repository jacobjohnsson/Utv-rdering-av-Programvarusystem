
# function for plotting data
plotresult <- function(file, start = 1){
  data <- read.csv("resources/utfil.txt", header = T)
  data <- data[start:nrow(data),]
  plot(data, type = 'l')
}

system("java -cp bin sorter.Lab infil.txt utfil.txt 600")
plotresult("resources/utfil.txt", 200)

pdf("result1.pdf")
plotresult("resources/utfil.txt", 200)
#plot(data, typ = 'l')

dev.off()
