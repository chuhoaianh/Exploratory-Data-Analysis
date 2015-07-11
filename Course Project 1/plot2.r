#########################################################################################
# Creator: Anh Chu
# Course: Exploratory Data Analysis
# Course Project 1 - plot2.R
# This assignment load data from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and practice plotting base on the data
# detail is in https://github.com/rdpeng/ExData_Plotting1
#########################################################################################


plot2 <- function(){
  #using sqldf package to load data in 1 function without using subset
  library(sqldf)
  fn <- "household_power_consumption.txt"
  df <- read.csv.sql(fn, sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep = ";", header = TRUE)
  
  #Convert 'Date' column from 'character' class to 'Date' class with format %d%m%Y
  df$Date <- as.Date(df$Date, format="%d/%m/%Y")
  
  #Convert DateTime and add to df
  datetime <- paste(as.Date(df$Date), df$Time)
  df$Datetime <- as.POSIXct(datetime) #convert to calendar Dates and times and add that column to df
  
  #plotting
  png("plot2.png", width = 480, height = 480)
  plot(df$Global_active_power~df$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  dev.off()
}

