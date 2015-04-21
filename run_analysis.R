# DOWNLOAD data
if( !file.exists('./dataset.zip') ) {
        fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ' 
        download.file(fileUrl, destfile='./dataset.zip', method='curl')
        unzip('./dataset.zip')
        file.rename('UCI HAR Dataset', 'dataset')
}

# check if package exists and if not download it.
# source of packages fn: 
# http://stackoverflow.com/questions/9341635/how-can-i-check-for-installed-r-packages-before-running-install-packages by CousinCocaine

packages <- function(x){
        x<-as.character(match.call()[[2]])
        if (!require(x,character.only=TRUE)){
                install.packages(pkgs=x,repos="http://cran.r-project.org")
                require(x,character.only=TRUE)
        }
}

packages(data.table)
packages(dplyr)
        

# list all files
list.files(list.dirs('./dataset', recursive=T, full.names=T))

# load subject data
test_subject_data <- read.table('./dataset/test/subject_test.txt', col.names=c('subject'))
train_subject_data <- read.table('./dataset/train/subject_train.txt', col.names=c('subject'))

# load x data 
test_x_data <- read.table('./dataset/test/X_test.txt')
train_x_data <- read.table('./dataset/train/X_train.txt')

# load y data
test_y_data <- read.table('./dataset/test/y_test.txt', col.names=c('activityId'))
train_y_data <- read.table('./dataset/train/y_train.txt', col.names=c('activityId'))

# merge rows
subject_data <- rbind(test_subject_data, train_subject_data)
x_data <- rbind(test_x_data, train_x_data)
y_data <- rbind(test_y_data, train_y_data)

# merge dataset
merged_dataset <- cbind(subject_data, y_data, x_data)
# sort dataset on subject and activityId
merged_dataset <- merged_dataset[ order(merged_dataset$subject, merged_dataset$activityId), ]
head(merged_dataset[ , c('subject', 'activityId')])
tail(merged_dataset[ , c('subject', 'activityId')])

# convert colnames to ids 
names(merged_dataset) <- c('subject', 'activityId', gsub('V','', names(merged_dataset[ , 3:ncol(merged_dataset)]) ))

# extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table('./dataset/features.txt', col.names=c('measure_id', 'measure'))

# find the mean and std variables. For debuging I have the grep on mean and std separately
means <- grep("\\-mean\\b", features$measure)
stds <- grep("\\-std\\b", features$measure)
extract <- sort(c(means, stds))
# locate id of variable - technically not necessary as they coincide but to be on the safe side
extract_id <- sapply(extract, function(x) { features[x, 'measure_id'] })

# subset and order the dataset. Run ncol to confirm subsetting
subseted <- merged_dataset[ , c('subject', 'activityId', extract_id)]
subseted <- subseted[ order(subseted$subject, subseted$activityId), ]
ncol(merged_dataset); ncol(subseted)

# Uses descriptive activity names to name the activities in the data set
activities_label <- read.table('./dataset/activity_labels.txt', col.names=c('activityId', 'activity'))

subseted$activityId <- activities_label[ match(subseted$activityId, activities_label$activityId), 'activity' ]
summary(subseted$activityId)

# Appropriately labels the data set with descriptive variable names. 
# Demonstrating that we can use gsub to alter the names. 
format_names <- function(variable) {
        process_names <- gsub('^t', 'time', variable)
        process_names <- gsub('^f', 'frequency', process_names)
        process_names <- gsub('\\(\\)', '', process_names)
        process_names <- gsub('-', '', process_names)        
        tolower(process_names)
}

names(subseted) <- c('subject', 
                     'activityId', 
                     as.character(format_names( features[extract_id, 'measure'] ))
                    )

# Average of each variable for each activity and each subject
tidy_mean_dataset <- subseted %>% group_by(subject, activityId) %>% summarise_each(funs(mean))

# output tidy dataset and tidy dataset mean
write.table(subseted, 'tidy_dataset.txt', row.name=FALSE)
write.table(tidy_mean_dataset, 'tidy_mean_dataset.txt', row.name=FALSE)

# output csvs for easier reference -- uncomment these lines to generate these
        # write.csv(subseted, 'tidy_dataset.csv')
        # write.csv(tidy_mean_dataset, 'tidy_mean_dataset.csv')
print('-------- view the data-----')
view_data <- read.table('./tidy_mean_dataset.txt', header = TRUE)
head(view_data)

