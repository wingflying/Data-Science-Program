#Getting and Cleaning Data Quiz2
setwd("D:/My Documents/GitHub/Getting and Cleaning Data")

fileUrl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

download.file(fileUrl, "./data/jeff.jpg", mode = "wb")

library(jpeg)

picture <- readJPEG("./data/jeff.jpg", native = TRUE)

quantile(picture, probs = c(0.3, 0.8))