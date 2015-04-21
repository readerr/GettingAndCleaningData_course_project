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
        - 3.1.3 Merge subject, x and y data by column. **Produces a data.frame of 10299 rows x 563 varaibles.**
        - 3.1.4 Sort the dataset to make inspection easier
  - 3.2 Extracts only the measurements on the mean and standard deviation for each measurement.
        - 3.2.1 Change names of merged dataset to ids v1 = 1
        - 3.2.2 Load features.txt
        - 3.2.3 Find the mean and std variables with grep. Results in extract_id which can be used directly to subset the main dataset
        - 3.2.4 Subset the merged dataset. **Produces a data.frame of 10299 rows x 68 varaibles.**
  - 3.3 Uses descriptive activity names to name the activities in the data set
        - 3.3.1 Load activities
        - 3.3.2 Match the loaded activities id to subset activityId
        - 3.3.3 Change to descriptive names and check result
    ``` r
summary(subseted$activityId)
            laying            sitting           standing            walking walking-downstairs   walking-upstairs 
              1944               1777               1906               1722               1406               1544       
```
  - 3.4 Appropriately labels the data set with descriptive variable names. 
    - 3.4.1 Create format_names which uses gsub to change abbreviations in variables to actual labels.
    **I removed the brackets and dashes and spelled out time and frequency. Converted to lowercase.**

    ``` r
format_names <- function(variable) {
        process_names <- gsub('^t', 'time', variable)
        process_names <- gsub('^f', 'frequency', process_names)
        process_names <- gsub('\\(\\)', '', process_names)
        process_names <- gsub('-', '', process_names)        
        tolower(process_names)
        }
    ```
    
        - 3.4.2 Rename ids to descriptive names, where format_names substitutes abbreviated names with descriptive names

        ``` r
names(subseted) <- c('subject', 
                     'activity', 
                     as.character(format_names( features[extract_id, 'measure'] ))
)        
        ```
  - 3.5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    - 3.5.1 Use dplyr package to group the variables and calucalte the mean on each group. **Produces a data.frame of 180 rows x 68 varaibles.**

#### The Output:
   -  *tidy_dataset.txt* : 1 tidy dataset containing the extracted from the raw dataset mean and std variables across the 30 subjects and 6 activities. This dataset contains **10299 rows and 68 variables**  
   -  *tidy_mean_dataset.txt* : 1 tidy dataset calculating the average of each variable. This dataset contains **180 rows (30 subject x 6 activities) and 68 variables (subject, activity and 66 measures)**. 

#### Variables in tidy_mean_dataset.txt from step 5. All units on measures - mean of additional meta data (e.g mean of time linear acceleration)

| Variable_name                     | Variable                          | Additional meta data            | 
|-----------------------------------|-----------------------------------|---------------------------------| 
| subject       | subject in study      |  subject unique id    | 
| activity   | activity performed                |  factor with 6 levels        | 
| timebodyaccmeanx                | timebodyaccmeanx                |  time linear acceleration       | 
| timebodyaccmeany                | timebodyaccmeany                |                                 | 
| timebodyaccmeanz                | timebodyaccmeanz                |                                 | 
| timebodyaccstdx                 | timebodyaccstdx                 |                                 | 
| timebodyaccstdy                 | timebodyaccstdy                 |                                 | 
| timebodyaccstdz                 | timebodyaccstdz                 |                                 | 
|                                   |                                   |                                 | 
| timegravityaccmeanx             | timegravityaccmeanx             | time gravity acceleration       | 
| timegravityaccmeany             | timegravityaccmeany             |                                 | 
| timegravityaccmeanz             | timegravityaccmeanz             |                                 | 
| timegravityaccstdx              | timegravityaccstdx              |                                 | 
| timegravityaccstdy              | timegravityaccstdy              |                                 | 
| timegravityaccstdz              | timegravityaccstdz              |                                 | 
|                                   |                                   |                                 | 
| timebodyaccjerkmeanx            | timebodyaccjerkmeanx            | time acceleration jerk          | 
| timebodyaccjerkmeany            | timebodyaccjerkmeany            |                                 | 
| timebodyaccjerkmeanz            | timebodyaccjerkmeanz            |                                 | 
| timebodyaccjerkstdx             | timebodyaccjerkstdx             |                                 | 
| timebodyaccjerkstdy             | timebodyaccjerkstdy             |                                 | 
| timebodyaccjerkstdz             | timebodyaccjerkstdz             |                                 | 
|                                   |                                   |                                 | 
| timebodygyromeanx               | timebodygyromeanx               | time gyroscope                  | 
| timebodygyromeany               | timebodygyromeany               |                                 | 
| timebodygyromeanz               | timebodygyromeanz               |                                 | 
| timebodygyrostdx                | timebodygyrostdx                |                                 | 
| timebodygyrostdy                | timebodygyrostdy                |                                 | 
| timebodygyrostdz                | timebodygyrostdz                |                                 | 
|                                   |                                   |                                 | 
| timebodygyrojerkmeanx           | timebodygyrojerkmeanx           | time gyroscope jerk             | 
| timebodygyrojerkmeany           | timebodygyrojerkmeany           |                                 | 
| timebodygyrojerkmeanz           | timebodygyrojerkmeanz           |                                 | 
| timebodygyrojerkstdx            | timebodygyrojerkstdx            |                                 | 
| timebodygyrojerkstdy            | timebodygyrojerkstdy            |                                 | 
| timebodygyrojerkstdz            | timebodygyrojerkstdz            |                                 | 
|                                   |                                   |                                 | 
| timebodyaccmagmean               | timebodyaccmagmean               |  the magnitude of these threedimensional signals were calculated using the euclidean norm     | 
| timebodyaccmagstd                | timebodyaccmagstd                |                                 | 
|                                   |                                   |                                 | 
| timegravityaccmagmean            | timegravityaccmagmean            |                                 | 
| timegravityaccmagstd             | timegravityaccmagstd             |                                 | 
|                                   |                                   |                                 | 
| timebodyaccjerkmagmean           | timebodyaccjerkmagmean           |                                 | 
| timebodyaccjerkmagstd            | timebodyaccjerkmagstd            |                                 | 
|                                   |                                   |                                 | 
| timebodygyromagmean              | timebodygyromagmean              |                                 | 
| timebodygyromagstd               | timebodygyromagstd               |                                 | 
|                                   |                                   |                                 | 
| timebodygyrojerkmagmean          | timebodygyrojerkmagmean          |                                 | 
| timebodygyrojerkmagstd           | timebodygyrojerkmagstd           |                                 | 
|                                   |                                   |                                 | 
| frequencybodyaccmeanx           | frequencybodyaccmeanx           | frequency linear acceleration   | 
| frequencybodyaccmeany           | frequencybodyaccmeany           |                                 | 
| frequencybodyaccmeanz           | frequencybodyaccmeanz           |                                 | 
| frequencybodyaccstdx            | frequencybodyaccstdx            |                                 | 
| frequencybodyaccstdy            | frequencybodyaccstdy            |                                 | 
| frequencybodyaccstdz            | frequencybodyaccstdz            |                                 | 
|                                   |                                   |                                 | 
| frequencybodyaccjerkmeanx       | frequencybodyaccjerkmeanx       | frequency jerk acceleration     | 
| frequencybodyaccjerkmeany       | frequencybodyaccjerkmeany       |                                 | 
| frequencybodyaccjerkmeanz       | frequencybodyaccjerkmeanz       |                                 | 
| frequencybodyaccjerkstdx        | frequencybodyaccjerkstdx        |                                 | 
| frequencybodyaccjerkstdy        | frequencybodyaccjerkstdy        |                                 | 
| frequencybodyaccjerkstdz        | frequencybodyaccjerkstdz        |                                 | 
|                                   |                                   |                                 | 
| frequencybodygyromeanx          | frequencybodygyromeanx          | frequency gyroscope             | 
| frequencybodygyromeany          | frequencybodygyromeany          |                                 | 
| frequencybodygyromeanz          | frequencybodygyromeanz          |                                 | 
| frequencybodygyrostdx           | frequencybodygyrostdx           |                                 | 
| frequencybodygyrostdy           | frequencybodygyrostdy           |                                 | 
| frequencybodygyrostdz           | frequencybodygyrostdz           |                                 | 
|                                   |                                   |                                 | 
| frequencybodyaccmagmean          | frequencybodyaccmagmean          | frequency fast furier transform | 
| frequencybodyaccmagstd           | frequencybodyaccmagstd           |                                 | 
|                                   |                                   |                                 | 
| frequencybodybodyaccjerkmagmean  | frequencybodybodyaccjerkmagmean  |                                 | 
| frequencybodybodyaccjerkmagstd   | frequencybodybodyaccjerkmagstd   |                                 | 
|                                   |                                   |                                 | 
| frequencybodybodygyromagmean     | frequencybodybodygyromagmean     |                                 | 
| frequencybodybodygyromagstd      | frequencybodybodygyromagstd      |                                 | 
|                                   |                                   |                                 | 
| frequencybodybodygyrojerkmagmean | frequencybodybodygyrojerkmagmean |                                 | 
| frequencybodybodygyrojerkmagstd  | frequencybodybodygyrojerkmagstd  |                                 | 
        
