setwd("D:/My Documents/GitHub/Exploratory Data Analysis")

#Read the file and Subset the date
dataFile <- "D:/My Documents/Data Files/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert data and time to specific format
subSetData$Date <- as.Date(subSetData$Date, format = '%d/%m/%Y')
subSetData$DateTime <- as.POSIXct(paste(subSetData$Date, subSetData$Time))

#Plot the data by Global Active power and Date
png(filename = './plot2.png', width = 480, height = 480, units='px')
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(subSetData$DateTime, subSetData$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
dev.off()