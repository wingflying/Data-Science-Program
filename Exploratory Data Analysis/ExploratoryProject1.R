#Exploratory Course Project 1
setwd("D:/My Documents/GitHub/Exploratory Data Analysis")

#Download the file and unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, "D:/My Documents/Data Files/household_power_consumption.zip", mode = "wb")
unzip(zipfile = "D:/My Documents/Data Files/household_power_consumption.zip", exdir = "./.")

#Plot1
#Read the file and Subset the date
dataFile <- "D:/My Documents/Data Files/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#Plot the data by Global Active Power and Frequency
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("./plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


#Plot2
#Convert data and time to specific format
subSetData$Date <- as.Date(subSetData$Date, format = '%d/%m/%Y')
subSetData$DateTime <- as.POSIXct(paste(subSetData$Date, subSetData$Time))
#Plot the data by Global Active power and Date
png(filename = './plot2.png', width = 480, height = 480, units='px')
plot(subSetData$DateTime, subSetData$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
dev.off()

#Plot3
png(filename = './plot3.png', width = 480, height = 480, units='px')
plot(subSetData$DateTime, subSetData$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(subSetData$DateTime, subSetData$Sub_metering_2, col = 'red')
lines(subSetData$DateTime, subSetData$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
dev.off()

# Plot 4
png(filename = './plot4.png', width = 480, height = 480, units='px')
par(mfrow = c(2, 2))
plot(subSetData$DateTime, subSetData$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(subSetData$DateTime, subSetData$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(subSetData$DateTime, subSetData$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(subSetData$DateTime, subSetData$Sub_metering_2, col = 'red')
lines(subSetData$DateTime, subSetData$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(subSetData$DateTime, subSetData$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()
