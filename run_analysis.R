

###---------------- Downloading & Unzipping data file ----------------###

## Check for existence of Data folder to place the data
## If not present then creates the folder with name "data"
if(!file.exists("./data"))	{dir.create("./data")}

## Calling "setInternet2(TRUE)" helps R make use of the ‘internet2.dll’ library for Internet access, which makes use of Internet Explorer functions
setInternet2(TRUE)

## saving the url in a varibale "fileUrl"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## downloading the file in the data folder with the name "ProjectData.zip"
download.file(fileUrl, destfile = "./data/ProjectData.zip")
datedownloaded <- date()

## Unzipping the downloaded file
unzip("./data/ProjectData.zip", exdir = "./data")

###---------------- Exploring downloaded data folder & loading into r ----------------###

## exploring downloaded data folder
list.files("./data/UCI HAR Dataset/")

## Reading features (column header for measurement data) files into r

# Loading sample features file to get metadata (column names for measurement data in Test & Train sets)
SmpleFeatures <- read.table("./data/UCI HAR Dataset/features.txt", nrow = 5)
str(SmpleFeatures)
head(SmpleFeatures)

## Post looking at the "str", I noticed, that the features data has two columns without header
## Post looking at the "head", I noticed, first column is no of cloumns for the measurement data and second column is the column name for the measurement data

## Loading the entire features (column names for measurement data in Test & Train sets) data 
Features <- read.table("./data/UCI HAR Dataset/features.txt", colClasses = rep("character",2), col.names = c("SNo", "ColHdr"))


## Reading activity label file into r

# Loading sample activity label file to get metadata 
SmpleActLbl <- read.table("./data/UCI HAR Dataset/activity_labels.txt", nrow = 5)
str(SmpleActLbl)
head(SmpleActLbl)

## Post looking at the "str", I noticed, that the activity label data has two columns without header
## Post looking at the "head", I noticed, first column is the activity code and the second column is the activity label

## Loading the entire activity label data 
ActLbl <- read.table("./data/UCI HAR Dataset/activity_labels.txt", colClasses = rep("character",2), col.names = c("Act_Cd", "Act_Lbl"))
str(ActLbl)


## removing sample data frames
rm(SmpleFeatures)
rm(SmpleActLbl)
ls()

###---------------- Exploring train data folder & loading into r ----------------###

## exploring train data folder inside downloaded data folder
list.files("./data/UCI HAR Dataset/train/")

## Reading train files into r
## Subject - subject_train.txt
## Activity - y_train.txt
## Measurements - X_train.txt

## Loading sample train subject file to get metadata
SmplTrainSub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", nrow = 5)
str(SmplTrainSub)

## Post looking at the "str", I noticed, that the subject data has only one column without header

## Loading the entire subject data
TrainSub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "Subject", colClasses = "character")
str(TrainSub)

# Computing frequency of each subject in train dataset
table(TrainSub$Subject)


## Loading sample y_train file to get metadata
SmplTrainAct <- read.table("./data/UCI HAR Dataset/train/y_train.txt", nrow = 5)
str(SmplTrainAct)

## Post looking at the "str", I noticed, that the y_train data has only one column without header

## Loading the entire y_train (activities) data
TrainAct <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names = "Act_Code", colClasses = "character")
str(TrainAct)

# Computing frequency of each activity code in train dataset
table(TrainAct$Act_Code)


## Loading sample X_train file to get metadata
SmplTrainMeasure <- read.table("./data/UCI HAR Dataset/train/X_train.txt", nrow = 5)
str(SmplTrainMeasure)
dim(SmplTrainMeasure)

## Post looking at the "dim", I noticed, that the X_train data has 561 column without header

## Loading the entire X_train (measurement) data
TrainMeasure <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = Features[,2], colClasses = rep("numeric",561))
dim(TrainMeasure)

## removing sample data frames
rm(SmplTrainSub)
rm(SmplTrainAct)
rm(SmplTrainMeasure)
ls()


###---------------- Exploring test data folder & loading into r ----------------###


## exploring test data folder inside downloaded data folder
list.files("./data/UCI HAR Dataset/test/")

## Reading test files into r
## Subject - subject_test.txt
## Activity - y_test.txt
## Measurements - X_test.txt

## Loading sample test subject file to get metadata
SmplTestSub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", nrow = 5)
str(SmplTestSub)

## Post looking at the "str", I noticed, that the subject data has only one column without header

## Loading the entire subject data
TestSub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "Subject", colClasses = "character")
str(TestSub)

# Computing frequency of each subject in Test dataset
table(TestSub$Subject)


## Loading sample y_test file to get metadata
SmplTestAct <- read.table("./data/UCI HAR Dataset/test/y_test.txt", nrow = 5)
str(SmplTestAct)

## Post looking at the "str", I noticed, that the y_test data has only one column without header

## Loading the entire y_test (activities) data
TestAct <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = "Act_Code", colClasses = "character")
str(TestAct)

# Computing frequency of each activity code in Test dataset
table(TestAct$Act_Code)


## Loading sample X_test file to get metadata
SmplTestMeasure <- read.table("./data/UCI HAR Dataset/test/X_test.txt", nrow = 5)
str(SmplTestMeasure)
dim(SmplTestMeasure)

## Post looking at the "dim", I noticed, that the X_test data has 561 column without header

## Loading the entire x_test (measurement) data
TestMeasure <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = Features[,2], colClasses = rep("numeric",561))
dim(TestMeasure)

## removing sample data frames
rm(SmplTestSub)
rm(SmplTestAct)
rm(SmplTestMeasure)
ls()

###---------------- Combining 3 train data frames in one data frame ----------------###

## To merge the Subject, Activity & Measurement data frames together, no of rows in each data frame should be same

# Checking dimensions of each train data frame
dim(TrainSub)
dim(TrainAct)
dim(TrainMeasure)

## All the data frames have same no of rows, we can bind them together in one data frame

TrainDf <- data.frame(cbind(TrainSub, TrainAct, TrainMeasure))
dim(TrainDf)


###---------------- Combining 3 test data frames in one data frame ----------------###

## To merge the Subject, Activity & Measurement data frames together, no of rows in each data frame should be same

# Checking dimensions of each test data frame
dim(TestSub)
dim(TestAct)
dim(TestMeasure)

## All the data frames have same no of rows, we can bind them together in one data frame

TestDf <- data.frame(cbind(TestSub, TestAct, TestMeasure))
dim(TestDf)

###---------------- Merging the training and the test sets to create one data set ----------------###

## To combine the two data frames one below the other, no of columns should be same in both the data frames

#Checking dimensions of each data frame
dim(TrainDf)
dim(TestDf)

## Both the data frames have same no of Columns, we can bind them together in one data frame

DataDf <- data.frame(rbind(TrainDf, TestDf))
dim(DataDf)

###---------------- List down the no of object in the current session ----------------###

ls()

## Removing redundant data frames

rm(TrainSub)
rm(TrainAct)
rm(TrainMeasure)
rm(TrainDf)

rm(TestSub)
rm(TestAct)
rm(TestMeasure)
rm(TestDf)

rm(fileUrl)
rm(Features)

ls()

###---------------- Extracting only the measurements on the mean and standard deviation for each measurement ----------------###

## Finding column indices where "mean" or "std" is present in column names
ColIndMeanStd <- grep("MEAN|STD", toupper(names(DataDf)))

## Subsetting the data with the column indices along with the "Subject" & "Act_Code"
DataDfMeanStd <- DataDf[,c(1, 2,ColIndMeanStd)]

## Checking the dimension & structure of the subset data
dim(DataDfMeanStd)
str(DataDfMeanStd)

## Listing the objects
ls()

## Removing redundant objects
rm(ColIndMeanStd)

ls()

###---------------- Assigning descriptive activity names to activity code ----------------###

## Checking the names of activity code variable in both the data frames
names(DataDfMeanStd)
names(ActLbl)

## Merging DataDfMeanStd & ActLbl using "Act_Cd"
DataDfMeanStd <- merge(DataDfMeanStd, ActLbl, by.x = "Act_Code", by.y = "Act_Cd", all.x = TRUE)

## Creating a frequency distribution of Activity codes & activity labels to authenticate the merging of two data frames
table(DataDfMeanStd$Act_Code)
table(DataDfMeanStd$Act_Lbl)


## Removing redundant objects
ls()
rm(ActLbl)

###---------------- Creating a second, independent tidy data set with the average of each variable for each activity and each subject ----------------###

## Loading "reshape2" library to use melt & cast functions
library(reshape2)


## melt command helps to Restructre the data frame in such a way that all measurement variables and their values are listed in two columns, i.e., variable & value, against each set of id variables (combination of Subject & Activity Labels) 
DataDfMeanStd_Melt <- melt(DataDfMeanStd, id = c("Subject", "Act_Lbl"), measure.vars = names(DataDfMeanStd)[3:88])

## dcast command helps in pivoting the data in the required format i.e.,
## creating a second, independent tidy data set with the average of each variable for each activity and each subject
TidyData <- dcast(DataDfMeanStd_Melt, Subject+Act_Lbl ~ variable, mean, na.rm = TRUE)
dim(TidyData)


library(plyr)

## arranging the final data by Subject & Activity labels 
TidyData <- arrange(TidyData, Subject, Act_Lbl)
dim(TidyData)


## Removing redundant objects
ls()
rm(DataDfMeanStd_Melt)

## Writing Tidy data to data folder
write.table(TidyData, "./data/TidyData.txt", row.name = FALSE)

###---------------- End of Code Line ----------------###
