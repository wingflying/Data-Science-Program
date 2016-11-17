setwd("D:/My Documents/GitHub/Exploratory Data Analysis")

#Read the file and Subset the date
dataFile <- "D:/My Documents/Data Files/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert data and time to specific format
subSetData$Date <- as.Date(subSetData$Date, format = '%d/%m/%Y')
subSetData$DateTime <- as.POSIXct(paste(subSetData$Date, subSetData$Time))

#Plot3
png(filename = './plot3.png', width = 480, height = 480, units='px')
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(subSetData$DateTime, subSetData$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(subSetData$DateTime, subSetData$Sub_metering_2, col = 'red')
lines(subSetData$DateTime, subSetData$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
dev.off()