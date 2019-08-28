## CodeBook for Project for Getting and Cleaning Data

### Data Source
The data is obtained from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Description for the Data (refer to README.txt from the data source)
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Variable Information
For each record in the dataset it is provided: 
- Subject: an identifier of the subject who carried out the experiment. The total number of the subjects is 30.
- Activity: the six activities, including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
- 66 measurements related to the mean and standard deviation, at the unit of per activity per subject. These features include:
-- tBodyAcc-XYZ
-- tGravityAcc-XYZ
-- tBodyAccJerk-XYZ
-- tBodyGyro-XYZ
-- tBodyGyroJerk-XYZ
-- tBodyAccMag
-- tGravityAccMag
-- tBodyAccJerkMag
-- tBodyGyroMag
-- tBodyGyroJerkMag
-- fBodyAcc-XYZ
-- fBodyAccJerk-XYZ
-- fBodyGyro-XYZ
-- fBodyAccMag
-- fBodyAccJerkMag
-- fBodyGyroMag
-- fBodyGyroJerkMag
- These measurements summarized the 1) triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration, 2) triaxial Angular velocity from the gyroscope and 3) a 561-feature vector with time and frequency domain variables. 

## Transformation
- The data was created by merging two raw datasets: train and test. 
- The measurements only restricted to those related to mean and standard deviation (66 in total).
- The new dataset was further cleaned by calculating the average value for each measurement, at each of the six activities per subject. 
