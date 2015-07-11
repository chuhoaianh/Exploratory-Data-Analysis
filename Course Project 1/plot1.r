#########################################################################################
# Creator: Anh Chu
# Course: Exploratory Data Analysis
# Course Project 1 - plot1.R
# This assignment load data from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and practice plotting base on the data
# detail is in https://github.com/rdpeng/ExData_Plotting1
#########################################################################################

plot1 <- function(){
  #using sqldf package to load data in 1 function without using subset
  library(sqldf)
  fn <- "household_power_consumption.txt"
  df <- read.csv.sql(fn, sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep = ";", header = TRUE)
  
  #plotting
  png("plot1.png", width = 480, height = 480)
  hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
}