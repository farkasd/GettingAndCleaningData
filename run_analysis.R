## Step 1 - set the working directory
setwd("C:/Users/dfar/Desktop/Getting_and_cleaning_data/Course_Project/UCI HAR Dataset/")

## Step 2 -load the relevant packages
library(plyr)
library(reshape2)

## Step 3 - read the relevant datasets into R
X_test <- read.table("./test/X_test.txt")
X_train <- read.table("./train/X_train.txt")

y_test <- read.table("./test/y_test.txt")
y_train <- read.table("./train/y_train.txt")

subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")

features <- read.table("./features.txt")
activities <- read.table("activity_labels.txt")

## Step 4 - merge the measurements for the test and training dataset; labels the data set with descriptive variable names
X <- rbind(X_test, X_train)
names(X) <- features[,2]

## Step 5 - merge the activity codes for the test and training dataset; labels the data set with descriptive variable names
Y <- rbind(y_test, y_train)
names(Y) <- c("activity")

## Step 6 - merge the subjects identification numbers for the test and training dataset; 
## labels the data set with descriptive variable names
subject <- rbind(subject_test, subject_train)
names(subject) <- "subject"

## Step 7 - Extracts only the measurements on the mean and standard deviation for each measurement.
small <- X[,grep("mean|std", colnames(X))]

## Step 8 - merge the 3 different datasets (with subject id, activity codes, measurements) into one.
dataset <- cbind(subject, Y, small)

## Step 9 - reshape the data using the melt and dcast function. 
## tidy_data will have average of each variable for each activity and each subject.
melt_dataset <- melt(dataset, id = c("subject","activity"), measure.vars = colnames(small))
tidy_data <- dcast(melt_dataset, subject + activity ~ variable, mean)

## Step 10 - use descriptive activity names instead of activity codes.
tidy_data[,2] <- factor(tidy_data[,2], labels = activities[,2])

## Step 11 - save the tidy_data dataset into the working directory, called tidy_data_with_averages.txt
write.table(tidy_data, "tidy_data_with_averages.txt")
