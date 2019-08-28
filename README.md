Getting and Cleaning Data
## The files are organized as: 
1. run_analysis.R: the analysis R script showing how the tidy data is constructed.
2. tidyData.txt: A tidy data set including the required variables, which is produced by run_analysis.R.
3. CodeBook.md: A code book that describes the project, the data source, variables and steps of contruction.

## The data are constructed as followed:
1. Merge the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
