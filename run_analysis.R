# Course Project  for Getting and Cleaning Data
# setwd("Your path here")

#1 Merge the training and test sets to create one data set.
#2 Extract only the measurements on the mean and standard deviation for each measurement. 

# fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileURL, ".\\Dataset.zip")
# unzip(".\\Dataset.zip")

#Read each file from the unzipped archive into a separate  R data.frame 
X_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")[,c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,
                                                                 163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,
                                                                 345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)]
y_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
X_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")[,c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,
                                                                163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,
                                                                345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)]
y_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

#Combine the six data.frames into a single data.frame
ds1 <- rbind(cbind(X_train,subject_train,y_train),cbind(X_test,subject_test,y_test))
 
#3 Use descriptive activity names to name the activities in the data set
names(ds1) <- c('tBodyAccMeanX', 'tBodyAccMeanY', 'tBodyAccMeanZ', 'tBodyAccStdX',
                'tBodyAccStdY', 'tBodyAccStdZ', 'tGravityAccMeanX', 'tGravityAccMeanY',
                'tGravityAccMeanZ', 'tGravityAccStdX', 'tGravityAccStdY', 'tGravityAccStdZ',
                'tBodyAccJerkMeanX', 'tBodyAccJerkMeanY', 'tBodyAccJerkMeanZ',
                'tBodyAccJerkStdX', 'tBodyAccJerkStdY', 'tBodyAccJerkStdZ', 'tBodyGyroMeanX',
                'tBodyGyroMeanY', 'tBodyGyroMeanZ', 'tBodyGyroStdX', 'tBodyGyroStdY',
                'tBodyGyroStdZ', 'tBodyGyroJerkMeanX', 'tBodyGyroJerkMeanY',
                'tBodyGyroJerkMeanZ', 'tBodyGyroJerkStdX', 'tBodyGyroJerkStdY',
                'tBodyGyroJerkStdZ', 'tBodyAccMagMean', 'tBodyAccMagStd', 'tGravityAccMagMean',
                'tGravityAccMagStd', 'tBodyAccJerkMagMean', 'tBodyAccJerkMagStd',
                'tBodyGyroMagMean', 'tBodyGyroMagStd', 'tBodyGyroJerkMagMean',
                'tBodyGyroJerkMagStd', 'fBodyAccMeanX', 'fBodyAccMeanY', 'fBodyAccMeanZ',
                'fBodyAccStdX', 'fBodyAccStdY', 'fBodyAccStdZ', 'fBodyAccJerkMeanX',
                'fBodyAccJerkMeanY', 'fBodyAccJerkMeanZ', 'fBodyAccJerkStdX',
                'fBodyAccJerkStdY', 'fBodyAccJerkStdZ', 'fBodyGyroMeanX', 'fBodyGyroMeanY',
                'fBodyGyroMeanZ', 'fBodyGyroStdX', 'fBodyGyroStdY', 'fBodyGyroStdZ',
                'fBodyAccMagMean', 'fBodyAccMagStd', 'fBodyBodyAccJerkMagMean',
                'fBodyBodyAccJerkMagStd', 'fBodyBodyGyroMagMean', 'fBodyBodyGyroMagStd',
                'fBodyBodyGyroJerkMagMean', 'fBodyBodyGyroJerkMagStd','subject','activity')

#4 Appropriately label the data set with descriptive activity names. 
ds1$activity <- factor(x=ds1$activity, levels=c(1:6), labels=c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING'))

#5 Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(sqldf)

ds2 <- sqldf("select subject, activity, avg(tBodyAccMeanX), avg(tBodyAccMeanY), avg(tBodyAccMeanZ), avg(tBodyAccStdX),
            avg(tBodyAccStdY), avg(tBodyAccStdZ), avg(tGravityAccMeanX),
            avg(tGravityAccMeanY), avg(tGravityAccMeanZ), avg(tGravityAccStdX),
            avg(tGravityAccStdY), avg(tGravityAccStdZ), avg(tBodyAccJerkMeanX),
            avg(tBodyAccJerkMeanY), avg(tBodyAccJerkMeanZ), avg(tBodyAccJerkStdX),
            avg(tBodyAccJerkStdY), avg(tBodyAccJerkStdZ), avg(tBodyGyroMeanX),
            avg(tBodyGyroMeanY), avg(tBodyGyroMeanZ), avg(tBodyGyroStdX),
            avg(tBodyGyroStdY), avg(tBodyGyroStdZ), avg(tBodyGyroJerkMeanX),
            avg(tBodyGyroJerkMeanY), avg(tBodyGyroJerkMeanZ), avg(tBodyGyroJerkStdX),
            avg(tBodyGyroJerkStdY), avg(tBodyGyroJerkStdZ), avg(tBodyAccMagMean),
            avg(tBodyAccMagStd), avg(tGravityAccMagMean), avg(tGravityAccMagStd),
            avg(tBodyAccJerkMagMean), avg(tBodyAccJerkMagStd), avg(tBodyGyroMagMean),
            avg(tBodyGyroMagStd), avg(tBodyGyroJerkMagMean), avg(tBodyGyroJerkMagStd),
            avg(fBodyAccMeanX), avg(fBodyAccMeanY), avg(fBodyAccMeanZ), avg(fBodyAccStdX),
            avg(fBodyAccStdY), avg(fBodyAccStdZ), avg(fBodyAccJerkMeanX),
            avg(fBodyAccJerkMeanY), avg(fBodyAccJerkMeanZ), avg(fBodyAccJerkStdX),
            avg(fBodyAccJerkStdY), avg(fBodyAccJerkStdZ), avg(fBodyGyroMeanX),
            avg(fBodyGyroMeanY), avg(fBodyGyroMeanZ), avg(fBodyGyroStdX),
            avg(fBodyGyroStdY), avg(fBodyGyroStdZ), avg(fBodyAccMagMean),
            avg(fBodyAccMagStd), avg(fBodyBodyAccJerkMagMean), avg(fBodyBodyAccJerkMagStd),
            avg(fBodyBodyGyroMagMean), avg(fBodyBodyGyroMagStd),
            avg(fBodyBodyGyroJerkMagMean), avg(fBodyBodyGyroJerkMagStd)
      from ds1
      group by subject, activity") 
 
 names(ds2) <- c('subject','activity','avgtBodyAccMeanX', 'avgtBodyAccMeanY', 'avgtBodyAccMeanZ', 'avgtBodyAccStdX',
                 'avgtBodyAccStdY', 'avgtBodyAccStdZ', 'avgtGravityAccMeanX',
                 'avgtGravityAccMeanY', 'avgtGravityAccMeanZ', 'avgtGravityAccStdX',
                 'avgtGravityAccStdY', 'avgtGravityAccStdZ', 'avgtBodyAccJerkMeanX',
                 'avgtBodyAccJerkMeanY', 'avgtBodyAccJerkMeanZ', 'avgtBodyAccJerkStdX',
                 'avgtBodyAccJerkStdY', 'avgtBodyAccJerkStdZ', 'avgtBodyGyroMeanX',
                 'avgtBodyGyroMeanY', 'avgtBodyGyroMeanZ', 'avgtBodyGyroStdX',
                 'avgtBodyGyroStdY', 'avgtBodyGyroStdZ', 'avgtBodyGyroJerkMeanX',
                 'avgtBodyGyroJerkMeanY', 'avgtBodyGyroJerkMeanZ', 'avgtBodyGyroJerkStdX',
                 'avgtBodyGyroJerkStdY', 'avgtBodyGyroJerkStdZ', 'avgtBodyAccMagMean',
                 'avgtBodyAccMagStd', 'avgtGravityAccMagMean', 'avgtGravityAccMagStd',
                 'avgtBodyAccJerkMagMean', 'avgtBodyAccJerkMagStd', 'avgtBodyGyroMagMean',
                 'avgtBodyGyroMagStd', 'avgtBodyGyroJerkMagMean', 'avgtBodyGyroJerkMagStd',
                 'avgfBodyAccMeanX', 'avgfBodyAccMeanY', 'avgfBodyAccMeanZ', 'avgfBodyAccStdX',
                 'avgfBodyAccStdY', 'avgfBodyAccStdZ', 'avgfBodyAccJerkMeanX',
                 'avgfBodyAccJerkMeanY', 'avgfBodyAccJerkMeanZ', 'avgfBodyAccJerkStdX',
                 'avgfBodyAccJerkStdY', 'avgfBodyAccJerkStdZ', 'avgfBodyGyroMeanX',
                 'avgfBodyGyroMeanY', 'avgfBodyGyroMeanZ', 'avgfBodyGyroStdX',
                 'avgfBodyGyroStdY', 'avgfBodyGyroStdZ', 'avgfBodyAccMagMean',
                 'avgfBodyAccMagStd', 'avgfBodyBodyAccJerkMagMean', 'avgfBodyBodyAccJerkMagStd',
                 'avgfBodyBodyGyroMagMean', 'avgfBodyBodyGyroMagStd',
                 'avgfBodyBodyGyroJerkMagMean', 'avgfBodyBodyGyroJerkMagStd')
 
#  write.csv(ds2,".\\Averages.csv",row.names=F)
 write.table(ds2,".\\Averages.txt", row.names=F)
 
 
 

