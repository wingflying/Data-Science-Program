#Compare the vehicle emission in Baltimore vs LA
setwd("D:/My Documents/GitHub/Exploratory Data Analysis")
library(ggplot2)

#Read the data from files
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

#Explore PM2.5 emission from motor vehicle
sub4 <- subset(NEI, fips == "06037" & type=="ON-ROAD")
lamot.sources <- aggregate(sub4[c("Emissions")], list(type = sub4$type, year = sub4$year, zip = sub4$fips), sum)
comp.mv <- rbind(baltmot.sources, lamot.sources)

png("ProjectPlot6.png")
qplot(year, Emissions, data = comp.mv, color = zip, geom= "line", ylim = c(-100, 5500)) + ggtitle("Motor Vehicle Emissions in Baltimore (24510) \nvs. Los Angeles (06037) Counties") + xlab("Year") + ylab("Emission Levels")
dev.off()