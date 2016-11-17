#Getting and Cleaning Data Quiz1
setwd("D:/My Documents/GitHub/Getting and Cleaning Data")

fielUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(fileUrl1, "./data/GDP-ranking.csv", mode = "wb")
download.file(fileUrl2, "./data/ed-stats.csv", mode = "wb")

rowNames <- seq(10,200, 2)

gdp <- read.csv("./data/GDP-ranking.csv", header = F, skip = 5, nrows = 190)
View(gdp)
fedu <- read.csv("./data/ed-stats.csv")

combinedCoun <- merge(gdp,fedu, by.x = "V1", by.y = "CountryCode", sort = TRUE)
View(combinedCoun)

combinedCoun[with(combinedCoun, order(-V2))]
                                        