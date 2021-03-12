setwd("/Users/crios/coursera")
library(dplyr)
library(tidyverse)


##Downloading de data##

direc<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(direc, destfile = "/Users/crios93/curso/dataset.zip")

#Unzip the data#

zipfile<-"/Users/crios93/curso/dataset.zip"
out<-"/Users/crios93/curso/"
unzip(zipfile, exdir = out)
list.files("/Users/crios93/curso/UCI HAR Dataset")

##Reading the data frame###

activities<-read.table("/Users/crios93/curso/UCI HAR Dataset/activity_labels.txt")
features<-read.table("/Users/crios93/curso/UCI HAR Dataset/features.txt")
trainx<-read.table("/Users/crios93/curso/UCI HAR Dataset/train/X_train.txt")
trainy<-read.table("/Users/crios93/curso/UCI HAR Dataset/train/Y_train.txt")
testx<-read.table("/Users/crios93/curso/UCI HAR Dataset/test/X_test.txt")
testy<-read.table("/Users/crios93/curso/UCI HAR Dataset/test/Y_test.txt")
subjecttest<-read.table("/Users/crios93/curso/UCI HAR Dataset/test/subject_test.txt")
subjecttrain<-read.table("/Users/crios93/curso/UCI HAR Dataset/train/subject_train.txt")

#Renaming the Data#

activities<-activities %>%
  rename(code=V1, activity=V2)

features<-features %>%
  rename(code=V1, functions=V2)


colname1<-select(features,functions)
colname2<-t(colname1)



trainx<-trainx %>%
  setNames(colname2)

trainy<-trainy %>%
  rename(code=V1)


testx<- testx %>%
  setNames(colname2)
testy<-testy %>%
  rename(code=V1)



subjecttrain<- subjecttrain %>%
  rename(subject=V1)
subjecttest<- subjecttest %>%
  rename(subject=V1)


###1. Merges the training and the test sets to create one data set##

train<-rbind(trainx, testx)
test<-rbind(trainy, testy)
subject<-rbind(subjecttest, subjecttrain)

data<-cbind(subject, train, test)



#2 Extracts only the measurements on the mean and standard deviation for each measurement  ##


data1<-data %>%
  select(
    contains("subject"), 
    contains("code"), 
    contains ("mean"), 
    contains("std"))


##3 Use descriptive activity names to name the activities in the data set##

data2<-merge(data1, activities, by="code")


###4.Appropriately labels the data set with descriptive variable names.##

names(data2)<-gsub("Acc", "accelerometer", names(data2))
names(data2)<-gsub("Gyro", "gyroscope", names(data2))
names(data2)<-gsub("BodyBody", "body", names(data2))
names(data2)<-gsub("Mag", "magnitude", names(data2))
names(data2)<-gsub("^t", "time", names(data2))
names(data2)<-gsub("^f", "frequency", names(data2))
names(data2)<-gsub("tBody", "timebody", names(data2))
names(data2)<-gsub("-mean()", "nean", names(data2), ignore.case = TRUE)
names(data2)<-gsub("-std()", "STD", names(data2), ignore.case = TRUE)
names(data2)<-gsub("-freq()", "frequency", names(data2), ignore.case = TRUE)
names(data2)<-gsub("angle", "angle", names(data2))
names(data2)<-gsub("gravity", "gravity", names(data2))



###5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.##

data3<- data2 %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean))




write.table(data3, "data.txt", row.name=FALSE)

