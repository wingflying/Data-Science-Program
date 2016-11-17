#Project Assignment for Getting and Cleaning Data
setwd("D:/My Documents/Data Files")
library(reshape2)

#download the file 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "./Human_SF.zip", mode = "wb")

#unzip the file
unzip(zipfile = "./Human_SF.zip", exdir = "./.")

#read data from files into the variables
dataFeatures <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
dataActivityType <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
dataSubTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
dataXTrain <- read.table("./UCI HAR Dataset/train/x_train.txt", header = FALSE)
dataYTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

#assign column names to Training data
colnames(dataActivityType) <- c("activityId","dataActivityType")
colnames(dataSubTrain) <- "subjectId"
colnames(dataXTrain) <- dataFeatures[,2] 
colnames(dataYTrain) <- "activityId"

combineTrainData <- cbind(dataSubTrain, dataYTrain, dataXTrain)

#read in test data
dataSubTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
dataXTest <- read.table("./UCI HAR Dataset/test/x_test.txt", header = FALSE)
dataYTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

#assign column names to Test data
colnames(dataSubTest) <- "subjectId"
colnames(dataXTest) <- dataFeatures[,2]
colnames(dataYTest) <- "activityId"

combineTestData <- cbind(dataSubTest, dataYTest, dataXTest)

#extracts the measurements on the mean and standard deviation 
featuresWanted <- grep(".*mean.*|.*std.*", dataFeatures[,2])
featuresWanted.names <- dataFeatures[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)

#merge training data and test data into one data set
allDataSet <- rbind(combineTrainData,combineTestData)
colnames(allDataSet) <- c("subject", "activity", featuresWanted.names)

#turn activities and subjects into factors
allDataSet$activity <- factor(allDataSet$activity, levels = dataActivityType[,1], labels = dataActivityType[,2])
allDataSet$subject <- as.factor(allDataSet$subject)

#merge the final data and write into tidy.txt
dataMelted <- melt(allDataSet, id = c("subject", "activity"))
tidyData <- dcast(dataMelted,subject + activity ~variable, mean)

write.table(tidyData,"tidy.txt", sep = "|", row.names = FALSE, quote = FALSE)



