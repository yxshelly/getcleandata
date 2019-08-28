# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#========== getting data ================#
setwd("/Users/yxshelly/Desktop/data_science/c3_getting and cleaning data/project")
path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

#========= loading data =================#
##### 1. Load activity labels + features #######
act <- read.table(file.path(path, "UCI HAR Dataset/activity_labels.txt")
                        , col.names = c("code", "actName"))
features <- read.table(file.path(path, "UCI HAR Dataset/features.txt")
                  , col.names = c("num", "feaName"))
head(actLab)
head(features)
str(features)

# keep needed features: only mean and standard deviation
  # need to exclude "mean****", e.g. meanFreq, 
featuresMS <- grep("(mean|std)\\", features[, "feaName"])
featuresMS

# restrict to list with only mean and std 
measurements <- features[featuresMS, "feaName"]

# rename feature names by getting rid of "()" after mean/std
measurements <- gsub("[()]", "", featuresMeanStd)
measurements

####### 2. Load train datasets ##########
# only get values related to mean and standard deviation
train <- read.table(file.path(path, "UCI HAR Dataset/train/X_train.txt"))[, featuresMS]
head(train)

# change column names to "measurements"
colnames(train) <- measurements
head(train)

# load activity code and subject
trainCode <- read.table(file.path(path, "UCI HAR Dataset/train/Y_train.txt")
                         , col.names = c("Activity"))
trainSub <- read.table(file.path(path, "UCI HAR Dataset/train/subject_train.txt")
                       , col.names = c("Subject"))

# combine the three datasets using column bind
train <- cbind(trainSub, Code, train)
str(train)

###### 3. Load test datasets ###########
test <- read.table(file.path(path, "UCI HAR Dataset/test/X_test.txt"))[, featuresMS]

# change column names
colnames(test) <- measurements
head(test)

testCode <- read.table(file.path(path, "UCI HAR Dataset/test/Y_test.txt")
                        , col.names = c("Activity"))
testSub <- read.table(file.path(path, "UCI HAR Dataset/test/subject_test.txt")
                      , col.names = c("Subject"))
test <- cbind(testSub, testCode, test)
str(test)

##========== Merge Train and Test Datasets =============##
## combine train and test using rbind
trainTest <- rbind(train, test)
str(trainTest)

##========== Appropriately name the activity names ========#
table(trainTest$Activity)
trainTest$Activity <- factor(trainTest$Activity, levels= c("1", "2", "3", "4", "5", "6"), 
                             labels = c("Walking", "Walking_Upstairs", "Walking_Downstairs",
                                        "Sitting", "Standing", "Laying"))
table(trainTest$Activity)
str(trainTest)
head(trainTest)

##======== A tidy data for the average of each var for each activity of each subject =====##
## calculate the mean by activity and subject 

##  Use "reshape2" function
library(reshape2)
bys <- melt(trainTest, id = c("Subject", "Activity"))
tidyData <- dcast(bys, Subject + Activity ~ variable, mean)

head(tidyData)
table(tidyData$Subject, tidyData$Activity)
write.table(tidyData, "tidyData.txt", row.names=FALSE)


