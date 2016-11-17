#Examine the PM2.5 emission in the Baltimore City
setwd("D:/My Documents/GitHub/Exploratory Data Analysis")

#Read the data from files
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# PM2.5 emission in Baltimore city
sub1 <- subset(NEI, fips =="24510")
balt <- tapply(sub1$Emissions, sub1$year, sum)
png("ProjectPlot2.png")
plot(balt, type = "o", main = "Total PM2.5 emission in Baltimore County", xlab = "Year", ylab = "PM2.5 Emission", pch = 18, color = "green", lty = 5)
dev.off()