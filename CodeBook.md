Data:
=========

Original data can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Original data description is avaiable at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

More info about the original data can be found in the following files (downloaded original data):

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.


Data transformation:
======================

run_analyysis.R script will do the following (as indicated in the script as well):

- Step 1 - sets the working directory
- Step 2 -loads the relevant packages
- Step 3 - reads the relevant datasets into R
- Step 4 - merges the measurements for the test and training dataset; labels the data set with descriptive variable names
- Step 5 - merges the activity codes for the test and training dataset; labels the data set with descriptive variable names
- Step 6 - merges the subjects identification numbers for the test and training dataset and labels the data set with descriptive variable names
- Step 7 - Extracts only the measurements on the mean and standard deviation for each measurement.
- Step 8 - merges the 3 different datasets (with subject id, activity codes, measurements) into one.
- Step 9 - reshapes the data using the melt and dcast function. tidy_data will have average of each variable for each activity and each subject.
- Step 10 - uses descriptive activity names instead of activity codes.
- Step 11 - saves the tidy_data dataset into the working directory, called tidy_data_with_averages.txt

Variable description:
===========================

Final tidy dataset (called: tidy_data_with_averages) will contain the average of each variable for each activity and each subject. 

Number of rows: 180 (30 subjects * 6 activities)
Number of columns: 81 
 - column #1: subject
	- identifies the volunteer who participated in the experiment
	- values: integer numbers from 1 to 30
 - column #2: activity
	- identifies the activity that was performed
	- values: 1 = WALKING, 2 = WALKING_UPSTAIRS 3 = WALKING_DOWNSTAIRS, 4 = SITTING, 5 = STANDING, 6  = LAYING.
 - column #3- column #81
	- contain the average of each variable (only on the mean and standard deviation for each measurement) for the relevant activity and relevant subject.


