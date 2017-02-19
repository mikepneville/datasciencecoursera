# Institution: Johns Hopkins Coursera
# Program: Certificate in Data Science
# Course: Getting and Cleaning Data
# Assignment: Week 4 Course Project
# Title: run_analysis.R
# Purpose: Demonstrate ability to collect, work with, and 
# clean a data set. 
# Goal: Prepare a tidy data set that can be used for later 
# analysis.

# Code Follows #

# Load the plyr, dplyr and data.table libraries
library(plyr); library(dplyr); library(data.table)

# Download the Raw data files and unzip to the
# current working directory
if(!file.exists("UCI_HAR_Dataset.zip")) {
     data_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     download.file(data_URL, "UCI_HAR_Dataset.zip")
     unzip("UCI_HAR_Dataset.zip")
}
# Get column names from features.txt file
features <- read.table("UCI HAR Dataset/features.txt",stringsAsFactors = F, check.names = FALSE)[,2]
# Import the measurement, subject and activity labels data
# and consolidate to two data frames called 'test_data' and 
# 'train_data'
test_data <- read.table("UCI HAR Dataset/test/x_test.txt", col.names = features, check.names = FALSE)
test_lbls <- read.table("UCI HAR Dataset/test/y_test.txt", check.names = FALSE)
test_subj <- read.table("UCI HAR Dataset/test/subject_test.txt", check.names = FALSE)
train_data <- read.table("UCI HAR Dataset/train/x_train.txt", col.names = features, check.names = FALSE)
train_lbls <- read.table("UCI HAR Dataset/train/y_train.txt", check.names = FALSE)
train_subj <- read.table("UCI HAR Dataset/train/subject_train.txt", check.names = FALSE)
train_data <- cbind(train_lbls,train_subj,train_data)
test_data <- cbind(test_lbls,test_subj,test_data)

# 1. Merge training and test datasets to one set
# called 'MData'   
MData <- rbind(train_data, test_data)
# 2. Extract measurements on the mean and standard 
# deviation for each measurement.  
sub_MData <- MData[,grep("V1|mean|std", colnames(MData))]

# 3. Use descriptive activity names to name the 
# activities in the data set
Acts <- read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors = F)[[2]]
sub_MData$V1 <- factor(sub_MData$V1, labels =  Acts)
# 4. Appropriately label the data set with descriptive 
# variable names
colnames(sub_MData)[1:2] <- c("Activity","Subject")

# 5. From the data set in step 4, create a second, 
# independent tidy data set with the average of each 
# variable for each activity and each subject.
# 
TidyData <-  ddply(sub_MData,.(Subject, Activity),
                   function(x) colMeans(x[, 2:ncol(x)]))
head(TidyData[,1:10],10)
write.csv(TidyData,file = "TidyData.csv")
