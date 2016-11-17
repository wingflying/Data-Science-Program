#Getting and Cleaning Data Week4 
setwd("D:/My Documents/GitHub/Getting and Cleaning Data")

#Quiz1
idahoHouse_ACS <- read.csv("./data/idaho_housing.csv")
names <- names(idahoHouse_ACS)

strsplit(names, 'wgtp')[123]

#Quiz2
GDP_ranking <- read.csv("./data/GDP-ranking.csv", skip = 4, nrows = 190)
GDPdol <- gsub(",","", GDP_ranking$X.4)
GDPdol <- as.integer(GDPdol)
mean(GDPdol, na.rm = TRUE)

attach(GDP_ranking)
grep("^United", GDP_ranking$V4)

#Quiz4
GDP <- read.csv("./data/GDP-ranking.csv", skip = 4, nrows = 190)
edu <- read.csv("./data/ed-stats.csv")

merged <- merge(GDP, edu, by.x = "X", by.y = "CountryCode", all = TRUE)
fy.june <- grep("Fiscal year end: June", merged$Special.Notes)
length(fy.june)

#Quiz5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
addmargins(table(year(sampleTimes), weekdays(sampleTimes)))