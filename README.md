
# Description of run_analysis.R

#### Purpose:
The run_analysis.R script aims at combining the train and test datasets from the Samsung dataset linked bellow.

#### The Output of run_analysis is two datasets:
- (optional) *tidy_dataset.txt* : 1 tidy dataset containing the extracted from the raw dataset mean and std variables across the 30 subjects and 6 activities. This dataset contains **10299 rows and 68 variables**  
- (required as per assignment) *tidy_mean_dataset.txt* : 1 tidy dataset calculating the average of each variable. This dataset contains **180 rows (30 subject x 6 activities) and 68 variables (subject, activity and 66 measures)**. 

#### Dependencies
- data.table
- dplyr

#### How to run the script
run_analysis.R is self contained. You need to:
  1. Download run_analysis.R
  2. Set the working directory to the dir containing the script
  3. Run the script in R Studio or R
Alternatively use source(run_analysis.R)

#### Troubleshooting
The script was created in *Version 0.98.1103 of RStudio* on *Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko)*
I have tried to make it as easy as possible for you but different systems behave differently. Here is a guideline on how to resolve possible issues:
  1. If data is not downloading
    - If your system is different and you experience issues you may need to download the data manually from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
    - Please unzip the file and rename the folder to 'dataset'
  2. If installed packages fails
    - Please run install.packages('data.table') and install.packages('dplyr')
  3. The rest of the script should work as specified in the assignment once you have the data in the dataset folder under the working directory and the installed packages

#### Raw Data source:
> Description and link: 
> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
> Direct download link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


#### Steps the script executes (short. long description is in CodeBook.md)
1. Getting the data
    - 1.1 Check if dataset exists and if not 
        - 1.1.1 Download the dataset
        - 1.1.2 Unzip the dataset
        - 1.1.3 Rename the dataset 
2. Check if packages exists and if not download them
    - required: data.table & dplyr
3. Execute the steps as outlined in the assignment:
    - Merges the training and the test sets to create one data set.
    - Extracts only the measurements on the mean and standard deviation for each measurement. 
    - Uses descriptive activity names to name the activities in the data set
    - Appropriately labels the data set with descriptive variable names. 
    - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
4. There is an option to generate csvs as well for easier reference. If you desire to do so, please uncomment the following lines at the very end of run_analysis.R

    ```r
            # write.csv(subseted, 'tidy_dataset.csv')
            # write.csv(tidy_mean_dataset, 'tidy_mean_dataset.csv')
    ```
