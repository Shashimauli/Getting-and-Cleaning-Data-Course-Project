
## Getting and Cleaning Data Course Project


### Objective: 
To work with the raw data and prepare a tidy dataset which can be used for further analysis purposes

### Introduction
This assignment uses data collected from the accelerometers from the Samsung Galaxy S smartphone

* Dataset: UCI HAR Dataset [269 MB]
* Dataset Url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Steps Used To Prepare Tidy Dataset:

#### To merge the Training & Test datasets

1. Downloaded the data using download.file() function & unzipped it using unzip() function

2. Loaded features & activity labels in R using read.table() function
* features.txt: List of names of all measurement variables
* activity_labels.txt: Links the class labels with their activity name

3. Read 3 tables from each of train & test dataset:
* subject_train.txt - Train subjects, 70% of the volunteers (Each row identifies the subject who performed the activity for each window sample)
* y_train.txt: Training activity labels
* X_train.txt: Training set (a 561-feature vector with time and frequency domain variables) 
* subject_test.txt: Test subjects, 30% of the volunteers (Each row identifies the subject who performed the activity for each window sample)
* y_test.txt: Test activity labels
* X_test.txt: Training set (a 561-feature vector with time and frequency domain variables)

4. Combining the 3 Train & Test data frames in one single data frame
* Combined 3 Train data files (subject_train.txt, y_train.txt, X_train.txt) in one using cbind() function
* Combined 3 Train data files (subject_test.txt, y_test.txt, X_test.txt) in one using cbind() function
* Combined the above two consolidated Train & Test data files using rbind() function - This completes the merging of Training & Test datasets

#### Extraction of only the measurements on the mean and standard deviation for each measurement

1. Used grep() function to get column indices of merged data containing "mean" & "std" in column names
2. Sub-setted the merged data using the column indices along with "Subject" & "Activity code" - This completes the extraction of measurements consisting of mean or standard deviation

#### Assigning descriptive activity names to activity code

* The dataset created in the last step was merged to Activity labels dataset using merge() function

#### Labelling the data set with descriptive variable names

1. Used the dataset created using features.txt to allocate column names to a dataset of X_train.txt & X_test.txt (561-feature vector with time and frequency domain variables)
* Note: This step was done while loading the X_train.txt & X_test.txt in R

#### Creating a second, independent tidy data set with the average of each variable for each activity and each subject

1. Used melt() command to Restructre the data frame in such a way that all measurement variables and their values are listed in two columns, i.e., variable & value, against each set of id variables (combination of Subject & Activity Labels)
2. Used dcast() command in pivoting the data in the required format i.e., creating a second, independent tidy data set with the average of each variable for each activity and each subject

## This completes the project assignment
