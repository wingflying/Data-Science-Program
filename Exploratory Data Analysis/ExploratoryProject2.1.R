#Exploratory Course Project, examining the PM2.5 emission from 1999~2008
setwd("D:/My Documents/GitHub/Exploratory Data Analysis")

#Download the file and unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl, "./data/data_assessment.zip", mode = "wb")
unzip(zipfile = "./data/data_assessment.zip", exdir = "./data")

#Read the data from files
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Plot the PM2.5 emission from 1999 to 2008
findata <- with(NEI, aggregate(Emissions, by = list(year), sum))
png("ProjectPlot1.png")
plot(findata, type = "o", main = "Total PM2.5 Emission in USA", xlab = "Year", ylab = "PM2.5 Emission", pch = 19, col = "blue")
dev.off()