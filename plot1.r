plot1 <- function(){
  library(sqldf)
  
  fn <- "household_power_consumption.txt"
  df <- read.csv.sql(fn, sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep = ";", header = TRUE)
  
  png("plot1.png", width = 480, height = 480)
  hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
}

plot1()
