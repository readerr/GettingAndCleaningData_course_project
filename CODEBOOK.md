# CODEBOOK
#### Raw Data source:
> Description and link: 
        > http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
> Direct download link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#### Steps the script run_analysis.r executes to clean the data
1. Getting the data
  - 1.1 Check if dataset exists and if not 
  - 1.1.1 Download the dataset
  - 1.1.2 Unzip the dataset
  - 1.1.3 Rename the dataset 
2. Check if packages exists and if not download them
  - required: data.table & dplyr
3. Execute the steps as outlined in the assignment:
  - 3.1 Merges the training and the test sets to create one data set.
        - 3.1.1 load test & train subject data / x data / load y data
        - 3.1.2 Merge on rows test & train subject data / x data / y data
        - 3.1.3 Merge subject, x and y data by column
        - 3.1.4 Sort the dataset to make inspection easier
  - 3.2 Extracts only the measurements on the mean and standard deviation for each measurement.
        - 3.2.1 Change names of merged dataset to ids v1 = 1
        - 3.2.2 Load features.txt
        - 3.2.3 Find the mean and std variables with grep. Results in extract_id which can be used directly to subset the main dataset
        - 3.2.4 Subset the merged dataset
  - 3.3 Uses descriptive activity names to name the activities in the data set
        - 3.3.1 Load activities
        - 3.3.2 Match the loaded activities id to subset activity_id
        - 3.3.3 Change to descriptive names and check result
```
summary(subseted$activity_id)
LAYING            SITTING           STANDING            WALKING WALKING_DOWNSTAIRS   WALKING_UPSTAIRS 
1944               1777               1906               1722               1406               1544        
```
  - 3.4 Appropriately labels the data set with descriptive variable names. 
        - 3.4.1 Create format_names which uses gsub to change abbreviations in variables to actual labels
``` sh
format_names <- function(variable) {
        process_names <- gsub('^t', 'time', variable)
        process_names <- gsub('^f', 'frequency', process_names)
        process_names <- gsub('\\(\\)', '', process_names)
        process_names
}
```        
        - 3.4.2 Rename ids to descriptive names, where format_names substitutes abbreviated names with descriptive names
``` sh
names(subseted) <- c('subject', 
                     'activity_id', 
                     as.character(format_names( features[extract_id, 'measure'] ))
)        
```
  - 3.5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### The Output:
        -  *tidy_dataset.txt* : 1 tidy dataset containing the extracted from the raw dataset mean and std variables across the 30 subjects and 6 activities. This dataset contains **10299 rows and 68 variables**  
        -  *tidy_mean_dataset.txt* : 1 tidy dataset calculating the average of each variable. This dataset contains **180 rows (30 subject x 6 activities) and 68 variables (subject, activity_id and 66 variables)**. 

#### Variables

| Variable_name                     | Variable                          | Long name                       | 
|-----------------------------------|-----------------------------------|---------------------------------| 
| timeBodyAcc-mean-X                | timeBodyAcc-mean-X                |  Time Linear Acceleration       | 
| timeBodyAcc-mean-Y                | timeBodyAcc-mean-Y                |                                 | 
| timeBodyAcc-mean-Z                | timeBodyAcc-mean-Z                |                                 | 
| timeBodyAcc-std-X                 | timeBodyAcc-std-X                 |                                 | 
| timeBodyAcc-std-Y                 | timeBodyAcc-std-Y                 |                                 | 
| timeBodyAcc-std-Z                 | timeBodyAcc-std-Z                 |                                 | 
|                                   |                                   |                                 | 
| timeGravityAcc-mean-X             | timeGravityAcc-mean-X             | Time Gravity Acceleration       | 
| timeGravityAcc-mean-Y             | timeGravityAcc-mean-Y             |                                 | 
| timeGravityAcc-mean-Z             | timeGravityAcc-mean-Z             |                                 | 
| timeGravityAcc-std-X              | timeGravityAcc-std-X              |                                 | 
| timeGravityAcc-std-Y              | timeGravityAcc-std-Y              |                                 | 
| timeGravityAcc-std-Z              | timeGravityAcc-std-Z              |                                 | 
|                                   |                                   |                                 | 
| timeBodyAccJerk-mean-X            | timeBodyAccJerk-mean-X            | Time Acceleration Jerk          | 
| timeBodyAccJerk-mean-Y            | timeBodyAccJerk-mean-Y            |                                 | 
| timeBodyAccJerk-mean-Z            | timeBodyAccJerk-mean-Z            |                                 | 
| timeBodyAccJerk-std-X             | timeBodyAccJerk-std-X             |                                 | 
| timeBodyAccJerk-std-Y             | timeBodyAccJerk-std-Y             |                                 | 
| timeBodyAccJerk-std-Z             | timeBodyAccJerk-std-Z             |                                 | 
|                                   |                                   |                                 | 
| timeBodyGyro-mean-X               | timeBodyGyro-mean-X               | Time Gyroscope                  | 
| timeBodyGyro-mean-Y               | timeBodyGyro-mean-Y               |                                 | 
| timeBodyGyro-mean-Z               | timeBodyGyro-mean-Z               |                                 | 
| timeBodyGyro-std-X                | timeBodyGyro-std-X                |                                 | 
| timeBodyGyro-std-Y                | timeBodyGyro-std-Y                |                                 | 
| timeBodyGyro-std-Z                | timeBodyGyro-std-Z                |                                 | 
|                                   |                                   |                                 | 
| timeBodyGyroJerk-mean-X           | timeBodyGyroJerk-mean-X           | Time Gyroscope Jerk             | 
| timeBodyGyroJerk-mean-Y           | timeBodyGyroJerk-mean-Y           |                                 | 
| timeBodyGyroJerk-mean-Z           | timeBodyGyroJerk-mean-Z           |                                 | 
| timeBodyGyroJerk-std-X            | timeBodyGyroJerk-std-X            |                                 | 
| timeBodyGyroJerk-std-Y            | timeBodyGyroJerk-std-Y            |                                 | 
| timeBodyGyroJerk-std-Z            | timeBodyGyroJerk-std-Z            |                                 | 
|                                   |                                   |                                 | 
| timeBodyAccMag-mean               | timeBodyAccMag-mean               | Time Fast Furier Transform      | 
| timeBodyAccMag-std                | timeBodyAccMag-std                |                                 | 
|                                   |                                   |                                 | 
| timeGravityAccMag-mean            | timeGravityAccMag-mean            |                                 | 
| timeGravityAccMag-std             | timeGravityAccMag-std             |                                 | 
|                                   |                                   |                                 | 
| timeBodyAccJerkMag-mean           | timeBodyAccJerkMag-mean           |                                 | 
| timeBodyAccJerkMag-std            | timeBodyAccJerkMag-std            |                                 | 
|                                   |                                   |                                 | 
| timeBodyGyroMag-mean              | timeBodyGyroMag-mean              |                                 | 
| timeBodyGyroMag-std               | timeBodyGyroMag-std               |                                 | 
|                                   |                                   |                                 | 
| timeBodyGyroJerkMag-mean          | timeBodyGyroJerkMag-mean          |                                 | 
| timeBodyGyroJerkMag-std           | timeBodyGyroJerkMag-std           |                                 | 
|                                   |                                   |                                 | 
| frequencyBodyAcc-mean-X           | frequencyBodyAcc-mean-X           | Frequency Linear Acceleration   | 
| frequencyBodyAcc-mean-Y           | frequencyBodyAcc-mean-Y           |                                 | 
| frequencyBodyAcc-mean-Z           | frequencyBodyAcc-mean-Z           |                                 | 
| frequencyBodyAcc-std-X            | frequencyBodyAcc-std-X            |                                 | 
| frequencyBodyAcc-std-Y            | frequencyBodyAcc-std-Y            |                                 | 
| frequencyBodyAcc-std-Z            | frequencyBodyAcc-std-Z            |                                 | 
|                                   |                                   |                                 | 
| frequencyBodyAccJerk-mean-X       | frequencyBodyAccJerk-mean-X       | Frequency Jerk Acceleration     | 
| frequencyBodyAccJerk-mean-Y       | frequencyBodyAccJerk-mean-Y       |                                 | 
| frequencyBodyAccJerk-mean-Z       | frequencyBodyAccJerk-mean-Z       |                                 | 
| frequencyBodyAccJerk-std-X        | frequencyBodyAccJerk-std-X        |                                 | 
| frequencyBodyAccJerk-std-Y        | frequencyBodyAccJerk-std-Y        |                                 | 
| frequencyBodyAccJerk-std-Z        | frequencyBodyAccJerk-std-Z        |                                 | 
|                                   |                                   |                                 | 
| frequencyBodyGyro-mean-X          | frequencyBodyGyro-mean-X          | Frequency Gyroscope             | 
| frequencyBodyGyro-mean-Y          | frequencyBodyGyro-mean-Y          |                                 | 
| frequencyBodyGyro-mean-Z          | frequencyBodyGyro-mean-Z          |                                 | 
| frequencyBodyGyro-std-X           | frequencyBodyGyro-std-X           |                                 | 
| frequencyBodyGyro-std-Y           | frequencyBodyGyro-std-Y           |                                 | 
| frequencyBodyGyro-std-Z           | frequencyBodyGyro-std-Z           |                                 | 
|                                   |                                   |                                 | 
| frequencyBodyAccMag-mean          | frequencyBodyAccMag-mean          | Frequency Fast Furier Transform | 
| frequencyBodyAccMag-std           | frequencyBodyAccMag-std           |                                 | 
|                                   |                                   |                                 | 
| frequencyBodyBodyAccJerkMag-mean  | frequencyBodyBodyAccJerkMag-mean  |                                 | 
| frequencyBodyBodyAccJerkMag-std   | frequencyBodyBodyAccJerkMag-std   |                                 | 
|                                   |                                   |                                 | 
| frequencyBodyBodyGyroMag-mean     | frequencyBodyBodyGyroMag-mean     |                                 | 
| frequencyBodyBodyGyroMag-std      | frequencyBodyBodyGyroMag-std      |                                 | 
|                                   |                                   |                                 | 
| frequencyBodyBodyGyroJerkMag-mean | frequencyBodyBodyGyroJerkMag-mean |                                 | 
| frequencyBodyBodyGyroJerkMag-std  | frequencyBodyBodyGyroJerkMag-std  |                                 | 
        
        
        
        
