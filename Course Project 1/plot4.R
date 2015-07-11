#########################################################################################
# Creator: Anh Chu
# Course: Exploratory Data Analysis
# Course Project 1 - plot4.R
# This assignment load data from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and practice plotting base on the data
# detail is in https://github.com/rdpeng/ExData_Plotting1
#########################################################################################

plot4 <- function(){
  #using sqldf package to load data in 1 function without using subset
  library(sqldf)
  fn <- "household_power_consumption.txt"
  df <- read.csv.sql(fn, sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep = ";", header = TRUE)
  
  #Convert 'Date' column from 'character' class to 'Date' class
  df$Date <- as.Date(df$Date, format="%d/%m/%Y")
  
  #Convert DateTime and add to df
  datetime <- paste(as.Date(df$Date), df$Time)
  df$Datetime <- as.POSIXct(datetime) #convert to calendar Dates and times and add that column to df
  
  #plotting
  png("plot4.png", width = 480, height = 480)
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(df, {
    plot(df$Global_active_power~df$Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    
    plot(df$Voltage~df$Datetime, type="l", 
         ylab="Voltage (Volts)", xlab="datetime")
    
    plot(df$Sub_metering_1~df$Datetime, type="l", 
         ylab="Energy Sub Metering", xlab="")
    lines(df$Sub_metering_2~df$Datetime,col='Red')
    lines(df$Sub_metering_3~df$Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(df$Global_reactive_power~df$Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="datetime")
  })
  
  dev.off()
}

