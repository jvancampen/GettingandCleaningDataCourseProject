GettingandCleaningDataCourseProject
===================================

Contains R code and documentation for Getting and Cleaning Data course project


## Project 

This is the documentation for the course project for the Coursera class "Getting and Cleaning Data".

The project involves writing an R program (run_analyses.R) that reads six files containing data from a mobile computing experiment. Note, my program contains code to set the working directory and download the original zip archive from the web, but it is commented out. Three of the files constitute the test data (2947 records), and the other three make up the training data (7352 records). It was assumed that the records in the three files in each group were in the correct order and they could be combined using the cbind() function. Once a single test file and a single training file were created then they were combined using rbind(). A subset of 68 variables was kept which included subject, activity, 33 mean variables, and 33 standard deviation (std) variables. A new data file was created which contains the means of the 66 mean and std variables grouped by subject and activity. This summary file was exported to a text file called "Averages.txt".

## Data Dictionary for Averages.txt

* Pos	Name				Description
* 1	subject				Subject ID
* 2	activity			Activity (WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING)
* 3	avgtBodyAccMeanX		Average of tBodyAcc-mean()-X by subject and activity 
* 4	avgtBodyAccMeanY		Average of tBodyAcc-mean()-Y by subject and activity 
* 5	avgtBodyAccMeanZ		Average of tBodyAcc-mean()-Z by subject and activity 
* 6	avgtBodyAccStdX			Average of tBodyAcc-std()-X by subject and activity 
* 7	avgtBodyAccStdY			Average of tBodyAcc-std()-Y by subject and activity 
* 8	avgtBodyAccStdZ			Average of tBodyAcc-std()-Z by subject and activity 
* 9	avgtGravityAccMeanX		Average of tGravityAcc-mean()-X by subject and activity 
* 10	avgtGravityAccMeanY		Average of tGravityAcc-mean()-Y by subject and activity 
* 11	avgtGravityAccMeanZ		Average of tGravityAcc-mean()-Z by subject and activity 
* 12	avgtGravityAccStdX		Average of tGravityAcc-std()-X by subject and activity 
* 13	avgtGravityAccStdY		Average of tGravityAcc-std()-Y by subject and activity 
* 14	avgtGravityAccStdZ		Average of tGravityAcc-std()-Z by subject and activity 
* 15	avgtBodyAccJerkMeanX		Average of tBodyAccJerk-mean()-X by subject and activity 
* 16	avgtBodyAccJerkMeanY		Average of tBodyAccJerk-mean()-Y by subject and activity 
* 17	avgtBodyAccJerkMeanZ		Average of tBodyAccJerk-mean()-Z by subject and activity 
* 18	avgtBodyAccJerkStdX		Average of tBodyAccJerk-std()-X by subject and activity 
* 19	avgtBodyAccJerkStdY		Average of tBodyAccJerk-std()-Y by subject and activity 
* 20	avgtBodyAccJerkStdZ		Average of tBodyAccJerk-std()-Z by subject and activity 
* 21	avgtBodyGyroMeanX		Average of tBodyGyro-mean()-X by subject and activity 
* 22	avgtBodyGyroMeanY		Average of tBodyGyro-mean()-Y by subject and activity 
* 23	avgtBodyGyroMeanZ		Average of tBodyGyro-mean()-Z by subject and activity 
* 24	avgtBodyGyroStdX		Average of tBodyGyro-std()-X by subject and activity 
* 25	avgtBodyGyroStdY		Average of tBodyGyro-std()-Y by subject and activity 
* 26	avgtBodyGyroStdZ		Average of tBodyGyro-std()-Z by subject and activity 
* 27	avgtBodyGyroJerkMeanX		Average of tBodyGyroJerk-mean()-X by subject and activity 
* 28	avgtBodyGyroJerkMeanY		Average of tBodyGyroJerk-mean()-Y by subject and activity 
* 29	avgtBodyGyroJerkMeanZ		Average of tBodyGyroJerk-mean()-Z by subject and activity 
* 30	avgtBodyGyroJerkStdX		Average of tBodyGyroJerk-std()-X by subject and activity 
* 31	avgtBodyGyroJerkStdY		Average of tBodyGyroJerk-std()-Y by subject and activity 
* 32	avgtBodyGyroJerkStdZ		Average of tBodyGyroJerk-std()-Z by subject and activity 
* 33	avgtBodyAccMagMean		Average of tBodyAccMag-mean() by subject and activity 
* 34	avgtBodyAccMagStd		Average of tBodyAccMag-std() by subject and activity 
* 35	avgtGravityAccMagMean		Average of tGravityAccMag-mean() by subject and activity 
* 36	avgtGravityAccMagStd		Average of tGravityAccMag-std() by subject and activity 
* 37	avgtBodyAccJerkMagMean		Average of tBodyAccJerkMag-mean() by subject and activity 
* 38	avgtBodyAccJerkMagStd		Average of tBodyAccJerkMag-std() by subject and activity 
* 39	avgtBodyGyroMagMean		Average of tBodyGyroMag-mean() by subject and activity 
* 40	avgtBodyGyroMagStd		Average of tBodyGyroMag-std() by subject and activity 
* 41	avgtBodyGyroJerkMagMean		Average of tBodyGyroJerkMag-mean() by subject and activity 
* 42	avgtBodyGyroJerkMagStd		Average of tBodyGyroJerkMag-std() by subject and activity 
* 43	avgfBodyAccMeanX		Average of fBodyAcc-mean()-X by subject and activity 
* 44	avgfBodyAccMeanY		Average of fBodyAcc-mean()-Y by subject and activity 
* 45	avgfBodyAccMeanZ		Average of fBodyAcc-mean()-Z by subject and activity 
* 46	avgfBodyAccStdX			Average of fBodyAcc-std()-X by subject and activity 
* 47	avgfBodyAccStdY			Average of fBodyAcc-std()-Y by subject and activity 
* 48	avgfBodyAccStdZ			Average of fBodyAcc-std()-Z by subject and activity 
* 49	avgfBodyAccJerkMeanX		Average of fBodyAccJerk-mean()-X by subject and activity 
* 50	avgfBodyAccJerkMeanY		Average of fBodyAccJerk-mean()-Y by subject and activity 
* 51	avgfBodyAccJerkMeanZ		Average of fBodyAccJerk-mean()-Z by subject and activity 
* 52	avgfBodyAccJerkStdX		Average of fBodyAccJerk-std()-X by subject and activity 
* 53	avgfBodyAccJerkStdY		Average of fBodyAccJerk-std()-Y by subject and activity 
* 54	avgfBodyAccJerkStdZ		Average of fBodyAccJerk-std()-Z by subject and activity 
* 55	avgfBodyGyroMeanX		Average of fBodyGyro-mean()-X by subject and activity 
* 56	avgfBodyGyroMeanY		Average of fBodyGyro-mean()-Y by subject and activity 
* 57	avgfBodyGyroMeanZ		Average of fBodyGyro-mean()-Z by subject and activity 
* 58	avgfBodyGyroStdX		Average of fBodyGyro-std()-X by subject and activity 
* 59	avgfBodyGyroStdY		Average of fBodyGyro-std()-Y by subject and activity 
* 60	avgfBodyGyroStdZ		Average of fBodyGyro-std()-Z by subject and activity 
* 61	avgfBodyAccMagMean		Average of fBodyAccMag-mean() by subject and activity 
* 62	avgfBodyAccMagStd		Average of fBodyAccMag-std() by subject and activity 
* 63	avgfBodyBodyAccJerkMagMean	Average of fBodyBodyAccJerkMag-mean() by subject and activity 
* 64	avgfBodyBodyAccJerkMagStd	Average of fBodyBodyAccJerkMag-std() by subject and activity 
* 65	avgfBodyBodyGyroMagMean		Average of fBodyBodyGyroMag-mean() by subject and activity 
* 66	avgfBodyBodyGyroMagStd		Average of fBodyBodyGyroMag-std() by subject and activity 
* 67	avgfBodyBodyGyroJerkMagMean	Average of fBodyBodyGyroJerkMag-mean() by subject and activity 
* 68	avgfBodyBodyGyroJerkMagStd	Average of fBodyBodyGyroJerkMag-std() by subject and activity 
