#Getting and Cleaning Data Week1 Quiz1
setwd("D:/My Documents/GitHub/Getting and Cleaning Data")

idahoHouse_ACS <- read.csv("./data/idaho_housing.csv")
idahoHouse_ACS10 <- ifelse(idahoHouse_ACS$ACR == 3 & idahoHouse_ACS$AGS == 6, TRUE, FALSE)

which(idahoHouse_ACS10)

#Week1 Quiz3
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, "./data/gas.xlsx", mode = "wb")
dateDownloaded <- date()

library(xlsx)
rowIndex = 18:23
colIndex = 7:15
dat <- read.xlsx("./data/gas.xlsx", sheetIndex = 1, rowIndex = rowIndex, colIndex = colIndex, header = TRUE)
sum(dat$Zip * dat$Ext, na.rm = T)

#Week1 Quiz4
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl, destfile = "./data/restaurants.xml", mode = "wb")
dateDownloaded <- date()

library(XML)
doc <- xmlTreeParse("./data/restaurants.xml", useInternal = TRUE)
rootNode <- xmlRoot(doc)

sum(xpathSApply(rootNode, "//zipcode", xmlValue) == "21231")
  #Methods2 for Quiz4
zipCodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
zipCodes <- xpathSApply(rootNode, "//zipcode", xmlValue)