plot2 <- function(){
  #using sqldf package to load data in 1 function without using subset
  library(sqldf)
  fn <- "household_power_consumption.txt"
  df <- read.csv.sql(fn, sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep = ";", header = TRUE)
  
  #Convert 'Date' column from 'character' class to 'Date' class
  df$Date <- as.Date(df$Date, format="%d/%m/%Y")
  df$Date <- as.Date(df$Date)
  
  #Convert DateTime and add to df
  datetime <- paste(as.Date(df$Date), df$Time)
  df$Datetime <- as.POSIXct(datetime) #convert to calendar Dates and times and add that column to df
  
  png("plot2.png", width = 480, height = 480)
  plot(df$Global_active_power~df$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  dev.off()
}

