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
