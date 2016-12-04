#RR Course Project 2
setwd("D:/My Documents/GitHub/Reproducible Research/Course Project 2")
library(ggplot2)
Sys.setlocale(category = "LC_ALL", locale = "english")

#Loading and preprocessing the data
fileurl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
download.file(fileurl, "./activity.zip", mode = "wb")