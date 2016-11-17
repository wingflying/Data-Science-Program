#Explore the four source of PM2.5 emission in the Baltimore City
setwd("D:/My Documents/GitHub/Exploratory Data Analysis")
library(ggplot2)

#Read the data from files
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

#Explore the four source of PM2.5 Emission
sub2 <- subset(NEI, fips =="24510")
balt.sources <- aggregate(sub2[c("Emissions")], list(type = sub2$type, year = sub2$year), sum)
png("ProjectPlot3.png")
qplot(year, Emissions, data = balt.sources, color = type, geom = "line") + ggtitle("PM2.5 in Baltimore by source type") + xlab("Year") + ylab("PM2.5 Emissions")
dev.off()
