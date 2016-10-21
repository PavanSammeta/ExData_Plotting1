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

## Start PNG device driver to save output to Plot3.png
png(filename="Plot3.png", height=480, width=480, bg="white")

with(myWorkingData, plot(DayTime,Sub_metering_1, type = "n"))

with(myWorkingData, plot(Sub_metering_1~DayTime, type = "l",main = "", xlab = "",ylab = "Energy Sub metering"))

with(myWorkingData,lines(Sub_metering_2~DayTime, type = "l", col = "red"))

with(myWorkingData,lines(Sub_metering_3~DayTime, type = "l", col = "blue"))

legend("topright", col = c("black","red", "blue"), lty=1, lwd=2,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## Turn off the device driver
dev.off()