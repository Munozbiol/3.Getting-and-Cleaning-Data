# Getting and Cleaning Data Project John Hopkins Coursera

# install packages if they are not installed
install.packages("reshape2")

#load packages 
library(data.table)
library(reshape2)
library(dplyr)

#Set working directory and get the data
setwd("C:/Users/Manuel/Google Drive/Data Science/Cursos Coursera/Data Science JHU/3 Data cleaning/4 week/Project")
urlfile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(urlfile, "dataFiles.zip")
unzip("dataFiles.zip")

#load the data
setwd("C:/Users/Manuel/Google Drive/Data Science/Cursos Coursera/Data Science JHU/3 Data cleaning/4 week/Project/UCI HAR Dataset")
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

#data test
setwd("C:/Users/Manuel/Google Drive/Data Science/Cursos Coursera/Data Science JHU/3 Data cleaning/4 week/Project/UCI HAR Dataset/test")
x_test <- read.table("X_test.txt")
y_test  <- read.table("y_test.txt")
subject_test <-read.table("subject_test.txt")

#data training
setwd("C:/Users/Manuel/Google Drive/Data Science/Cursos Coursera/Data Science JHU/3 Data cleaning/4 week/Project/UCI HAR Dataset/trian")
x_train <- read.table("X_test.txt")
y_train <- read.table("y_test.txt")
subject_train<-read.table("subject_test.txt")

#Merges the training and the test sets to create one data set.
x_data <- rbind(x_test, x_train)
y_data <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)
MergedData <- cbind(subject, x_data, y_data)

#Extracts only the measurements on the mean and standard deviation for each measurement.
features_data <- grep("mean\\(\\)|std\\(\\)", features)

### Subset data columns only including "mean" and "std".
data_mean_std <- x_data[,features_data]

### Subset variable name only including "mean" and "std".
var <- features[features_data,]

names(var) <- c("ID", "Variable")

#Appropriately labels the data set with descriptive variable names.

var <- var %>%
        mutate(Variable = gsub("-mean\\(\\)","_mean", Variable),
               Variable = gsub("-std\\(\\)","_std", Variable),
               Variable = gsub("-","_", Variable),
               Variable = gsub("^t","Time_", Variable),
               Variable = gsub("^f","Frequency_", Variable),
               Variable = gsub("BodyBody","Body", Variable))

#Name columns
names(data_mean_std) <- var[,2]

# Rename appropriate column name.
names(activity_labels) <- c("ID", "Activity")
names(y_data)[1] <- "ID"
names(subject)[1] <- "Subject_Id"

#Replace with descriptive activity names.
Activity <- y_data %>%
        left_join(activity_labels, by = "ID") %>%
        select(Activity)

# Create a complete dataset including subject, activity and records.  
All_data <- cbind(subject,Activity,data_mean_std)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data <- All_data %>%
        group_by(Subject_Id, Activity) %>%
        summarise_each(funs(mean))

write.table(tidy_data, "tidy_data.txt", row.name = FALSE, sep="\t")