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
    ``` r
summary(subseted$activity_id)
LAYING            SITTING           STANDING            WALKING WALKING_DOWNSTAIRS   WALKING_UPSTAIRS 
1944               1777               1906               1722               1406               1544        
```
  - 3.4 Appropriately labels the data set with descriptive variable names. 
    - 3.4.1 Create format_names which uses gsub to change abbreviations in variables to actual labels.
    **I removed the brackets and dashes and spelled out time and frequency. I kept the camel case as I found the all lower case very difficult to read.**

    ``` r
format_names <- function(variable) {
        process_names <- gsub('^t', 'time', variable)
        process_names <- gsub('^f', 'frequency', process_names)
        process_names <- gsub('\\(\\)', '', process_names)
        process_names <- gsub('-', '', process_names)        
        process_names
        }
    ```
    
        - 3.4.2 Rename ids to descriptive names, where format_names substitutes abbreviated names with descriptive names

        ``` r
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

| Variable_name                     | Variable                          | Additional meta data            | 
|-----------------------------------|-----------------------------------|---------------------------------| 
| timeBodyAccmeanX                | timeBodyAccmeanX                |  Time Linear Acceleration       | 
| timeBodyAccmeanY                | timeBodyAccmeanY                |                                 | 
| timeBodyAccmeanZ                | timeBodyAccmeanZ                |                                 | 
| timeBodyAccstdX                 | timeBodyAccstdX                 |                                 | 
| timeBodyAccstdY                 | timeBodyAccstdY                 |                                 | 
| timeBodyAccstdZ                 | timeBodyAccstdZ                 |                                 | 
|                                   |                                   |                                 | 
| timeGravityAccmeanX             | timeGravityAccmeanX             | Time Gravity Acceleration       | 
| timeGravityAccmeanY             | timeGravityAccmeanY             |                                 | 
| timeGravityAccmeanZ             | timeGravityAccmeanZ             |                                 | 
| timeGravityAccstdX              | timeGravityAccstdX              |                                 | 
| timeGravityAccstdY              | timeGravityAccstdY              |                                 | 
| timeGravityAccstdZ              | timeGravityAccstdZ              |                                 | 
|                                   |                                   |                                 | 
| timeBodyAccJerkmeanX            | timeBodyAccJerkmeanX            | Time Acceleration Jerk          | 
| timeBodyAccJerkmeanY            | timeBodyAccJerkmeanY            |                                 | 
| timeBodyAccJerkmeanZ            | timeBodyAccJerkmeanZ            |                                 | 
| timeBodyAccJerkstdX             | timeBodyAccJerkstdX             |                                 | 
| timeBodyAccJerkstdY             | timeBodyAccJerkstdY             |                                 | 
| timeBodyAccJerkstdZ             | timeBodyAccJerkstdZ             |                                 | 
|                                   |                                   |                                 | 
| timeBodyGyromeanX               | timeBodyGyromeanX               | Time Gyroscope                  | 
| timeBodyGyromeanY               | timeBodyGyromeanY               |                                 | 
| timeBodyGyromeanZ               | timeBodyGyromeanZ               |                                 | 
| timeBodyGyrostdX                | timeBodyGyrostdX                |                                 | 
| timeBodyGyrostdY                | timeBodyGyrostdY                |                                 | 
| timeBodyGyrostdZ                | timeBodyGyrostdZ                |                                 | 
|                                   |                                   |                                 | 
| timeBodyGyroJerkmeanX           | timeBodyGyroJerkmeanX           | Time Gyroscope Jerk             | 
| timeBodyGyroJerkmeanY           | timeBodyGyroJerkmeanY           |                                 | 
| timeBodyGyroJerkmeanZ           | timeBodyGyroJerkmeanZ           |                                 | 
| timeBodyGyroJerkstdX            | timeBodyGyroJerkstdX            |                                 | 
| timeBodyGyroJerkstdY            | timeBodyGyroJerkstdY            |                                 | 
| timeBodyGyroJerkstdZ            | timeBodyGyroJerkstdZ            |                                 | 
|                                   |                                   |                                 | 
| timeBodyAccMagmean               | timeBodyAccMagmean               |  The magnitude of these threedimensional signals were calculated using the Euclidean norm     | 
| timeBodyAccMagstd                | timeBodyAccMagstd                |                                 | 
|                                   |                                   |                                 | 
| timeGravityAccMagmean            | timeGravityAccMagmean            |                                 | 
| timeGravityAccMagstd             | timeGravityAccMagstd             |                                 | 
|                                   |                                   |                                 | 
| timeBodyAccJerkMagmean           | timeBodyAccJerkMagmean           |                                 | 
| timeBodyAccJerkMagstd            | timeBodyAccJerkMagstd            |                                 | 
|                                   |                                   |                                 | 
| timeBodyGyroMagmean              | timeBodyGyroMagmean              |                                 | 
| timeBodyGyroMagstd               | timeBodyGyroMagstd               |                                 | 
|                                   |                                   |                                 | 
| timeBodyGyroJerkMagmean          | timeBodyGyroJerkMagmean          |                                 | 
| timeBodyGyroJerkMagstd           | timeBodyGyroJerkMagstd           |                                 | 
|                                   |                                   |                                 | 
| frequencyBodyAccmeanX           | frequencyBodyAccmeanX           | Frequency Linear Acceleration   | 
| frequencyBodyAccmeanY           | frequencyBodyAccmeanY           |                                 | 
| frequencyBodyAccmeanZ           | frequencyBodyAccmeanZ           |                                 | 
| frequencyBodyAccstdX            | frequencyBodyAccstdX            |                                 | 
| frequencyBodyAccstdY            | frequencyBodyAccstdY            |                                 | 
| frequencyBodyAccstdZ            | frequencyBodyAccstdZ            |                                 | 
|                                   |                                   |                                 | 
| frequencyBodyAccJerkmeanX       | frequencyBodyAccJerkmeanX       | Frequency Jerk Acceleration     | 
| frequencyBodyAccJerkmeanY       | frequencyBodyAccJerkmeanY       |                                 | 
| frequencyBodyAccJerkmeanZ       | frequencyBodyAccJerkmeanZ       |                                 | 
| frequencyBodyAccJerkstdX        | frequencyBodyAccJerkstdX        |                                 | 
| frequencyBodyAccJerkstdY        | frequencyBodyAccJerkstdY        |                                 | 
| frequencyBodyAccJerkstdZ        | frequencyBodyAccJerkstdZ        |                                 | 
|                                   |                                   |                                 | 
| frequencyBodyGyromeanX          | frequencyBodyGyromeanX          | Frequency Gyroscope             | 
| frequencyBodyGyromeanY          | frequencyBodyGyromeanY          |                                 | 
| frequencyBodyGyromeanZ          | frequencyBodyGyromeanZ          |                                 | 
| frequencyBodyGyrostdX           | frequencyBodyGyrostdX           |                                 | 
| frequencyBodyGyrostdY           | frequencyBodyGyrostdY           |                                 | 
| frequencyBodyGyrostdZ           | frequencyBodyGyrostdZ           |                                 | 
|                                   |                                   |                                 | 
| frequencyBodyAccMagmean          | frequencyBodyAccMagmean          | Frequency Fast Furier Transform | 
| frequencyBodyAccMagstd           | frequencyBodyAccMagstd           |                                 | 
|                                   |                                   |                                 | 
| frequencyBodyBodyAccJerkMagmean  | frequencyBodyBodyAccJerkMagmean  |                                 | 
| frequencyBodyBodyAccJerkMagstd   | frequencyBodyBodyAccJerkMagstd   |                                 | 
|                                   |                                   |                                 | 
| frequencyBodyBodyGyroMagmean     | frequencyBodyBodyGyroMagmean     |                                 | 
| frequencyBodyBodyGyroMagstd      | frequencyBodyBodyGyroMagstd      |                                 | 
|                                   |                                   |                                 | 
| frequencyBodyBodyGyroJerkMagmean | frequencyBodyBodyGyroJerkMagmean |                                 | 
| frequencyBodyBodyGyroJerkMagstd  | frequencyBodyBodyGyroJerkMagstd  |                                 | 
        
        
        
