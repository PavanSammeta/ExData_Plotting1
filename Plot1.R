## Function to convert the date format
setClass("ReqDate")
setAs("character","ReqDate",function(from) as.Date(from, format = "%d/%m/%Y"))

## Function to convert the date format
setClass("ReqTime")
setAs("character","ReqTime",function(from) strptime(from, format = "%T"))

## Read data from file
mySourceData <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";",
                         colClasses = c("ReqDate",NA,NA,NA,NA,NA,NA,NA,NA), na.strings = "?")

myWorkingData <- subset(mySourceData, Date >= "2007-02-01" & Date <= "2007-02-02")

## Start PNG device driver to save output to Plot1.png
png(filename="Plot1.png", height=480, width=480, bg="white")

with(myWorkingData, hist(Global_active_power,main = "Global Active Power", col = "red", xlab = "Global Active Power (Kilowatts)"))

## Turn off the device driver
dev.off()