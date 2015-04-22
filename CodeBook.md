# CODEBOOK

##About the data:
Human Activity Recognition Using Smartphones Dataset
Version 1.0

#### Raw data collection mechanism:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


#### Raw Data source:
> Description and link: 
        > http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
> Direct download link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

####Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
- For a complete description of the raw data source please view the readme.txt in the dataset folder.


####Explanation of transformed dataset follows. 
The raw dataset was transformed to include only variables of interest, namely mean and standard deviation related measures of signals. It was further changed to include descriptive variables following the format unit / on / measure / statistic / on x,y,z or xyz. Description and a list of variables are to be found in the table at the bottom of the codebook. 

The six activities were transformed to be - *laying, sitting, standing, walking, walking-downstairs, walking-upstairs* following the tidy data rules. 

Finally the data were grouped by activity by unique subject and the mean (average) of each unique activity per measure was calculated. This operation collapsed the dataset from 10299 to 180 rows.


#### The Output:
   -  *tidy_dataset.txt* : 1 tidy dataset containing the extracted from the raw dataset mean and std variables across the 30 subjects and 6 activities. This dataset contains **10299 rows and 68 variables**  
   -  *tidy_mean_dataset.txt* : 1 tidy dataset calculating the average of each variable. This dataset contains **180 rows (30 subject x 6 activities) and 68 variables (subject, activity and 66 measures)**. 

#### Variables in tidy_mean_dataset.txt from step 5.

| Variable_name                     | Variable                          | Additional meta data            | 
|-----------------------------------|-----------------------------------|---------------------------------| 
| subject       | subject in study      |  subject unique id    | 
| activity   | activity performed                |  the 6 unique activities         | 
| timebodyaccmeanx                | timebodyaccmeanx                |  time body linear acceleration       | 
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
| timebodyaccjerkmeanx            | timebodyaccjerkmeanx            | time body acceleration jerk          | 
| timebodyaccjerkmeany            | timebodyaccjerkmeany            |                                 | 
| timebodyaccjerkmeanz            | timebodyaccjerkmeanz            |                                 | 
| timebodyaccjerkstdx             | timebodyaccjerkstdx             |                                 | 
| timebodyaccjerkstdy             | timebodyaccjerkstdy             |                                 | 
| timebodyaccjerkstdz             | timebodyaccjerkstdz             |                                 | 
|                                   |                                   |                                 | 
| timebodygyromeanx               | timebodygyromeanx               | time body gyroscope                  | 
| timebodygyromeany               | timebodygyromeany               |                                 | 
| timebodygyromeanz               | timebodygyromeanz               |                                 | 
| timebodygyrostdx                | timebodygyrostdx                |                                 | 
| timebodygyrostdy                | timebodygyrostdy                |                                 | 
| timebodygyrostdz                | timebodygyrostdz                |                                 | 
|                                   |                                   |                                 | 
| timebodygyrojerkmeanx           | timebodygyrojerkmeanx           | time body gyroscope jerk             | 
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
| frequencybodyaccjerkmeanx       | frequencybodyaccjerkmeanx       | frequency body jerk acceleration     | 
| frequencybodyaccjerkmeany       | frequencybodyaccjerkmeany       |                                 | 
| frequencybodyaccjerkmeanz       | frequencybodyaccjerkmeanz       |                                 | 
| frequencybodyaccjerkstdx        | frequencybodyaccjerkstdx        |                                 | 
| frequencybodyaccjerkstdy        | frequencybodyaccjerkstdy        |                                 | 
| frequencybodyaccjerkstdz        | frequencybodyaccjerkstdz        |                                 | 
|                                   |                                   |                                 | 
| frequencybodygyromeanx          | frequencybodygyromeanx          | frequency body gyroscope             | 
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
        

######Data Copyright:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
