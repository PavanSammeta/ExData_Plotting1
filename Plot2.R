## Read data from file
mySourceData <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
mySourceData$Date <- as.Date(mySourceData$Date, format = "%d/%m/%Y")

## extract the subset data
myWorkingData <- subset(mySourceData, Date >= "2007-02-01" & Date <= "2007-02-02")

## remove the original data frame which is no more used.
rm(mySourceData)

#create a new column with date time
DayTime <- paste(myWorkingData$Date,myWorkingData$Time)
myWorkingData$DayTime <- as.POSIXct(DayTime)
  
## Start PNG device driver to save output to Plot2.png
png(filename="Plot2.png", height=480, width=480, bg="white")

with(myWorkingData, plot(DayTime,Global_active_power, type = "l",main = "", xlab = "",ylab = "Global Active Power (Kilowatts)"))

## Turn off the device driver
dev.off()