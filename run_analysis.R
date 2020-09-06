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

# to set up the path to the directory that contains necessary files and folders "train", "test"
general_path<-"C:/Users/Manuel/Google Drive/Data Science/Cursos Coursera/Data Science JHU/3 Data cleaning/4 week/Project/UCI HAR Dataset"

#set up the path to the train directory
train_path<-"C:/Users/Manuel/Google Drive/Data Science/Cursos Coursera/Data Science JHU/3 Data cleaning/4 week/Project/UCI HAR Dataset/train"

#set up the path to the test directory
test_path<-"C:/Users/Manuel/Google Drive/Data Science/Cursos Coursera/Data Science JHU/3 Data cleaning/4 week/Project/UCI HAR Dataset/test"

# set up the path to the output directory
output_path<-"C:/Users/Manuel/Google Drive/Data Science/Cursos Coursera/Data Science JHU/3 Data cleaning/4 week/Project/UCI HAR Dataset"

setwd(general_path)

# Load: activity labels
activity_names<-read.table("activity_labels.txt")[,2]

# Load: data column names
features<-read.table("features.txt")[,2]

# Load and process X_train & y_train data.
setwd(train_path)
X_train<-read.table("X_train.txt")
y_train<-read.table("y_train.txt")
subject_train<-read.table("subject_train.txt")
names(X_train)<-features

# Extract only the measurements on the mean and standard deviation for each measurement.
extract_features<-grepl("mean|std", features)
# Extract only the measurements on the mean and standard deviation for each measurement.
X_train<-X_train[,extract_features]

# Load activity labels
y_train[,2]<-activity_names[y_train[,1]]
# Add names to activities
names(y_train)<-c("Activity_ID", "Activity_Label")
names(subject_train)<-"subject"

# Bind all data into the targeted table of train data set
train_data<-cbind(as.data.table(subject_train), y_train, X_train)


# to compile the test data we take all steps for test data set
setwd(test_path)
X_test<-read.table("X_test.txt")
y_test<-read.table("y_test.txt")
subject_test<-read.table("subject_test.txt")
names(X_test)<-features

extract_features<-grepl("mean|std", features)
X_test <- X_test[,extract_features]
y_test[,2]<-activity_names[y_test[,1]]

names(y_test)<-c("Activity_ID", "Activity_Label")
names(subject_test)<-"subject"

test_data<-cbind(as.data.table(subject_test), y_test, X_test)


# to merge all data (train_test)
all_data<-rbind(train_data,test_data)
id_names<-c("subject", "Activity_ID", "Activity_Label")
data_labels<-setdiff(colnames(all_data), id_names)
melt_all<-melt(all_data, id = id_names, measure.vars = data_labels)

# to apply mean  to merged dataset using dcast function
tidy_data<-dcast(melt_all, subject + Activity_Label ~ variable, mean)
tidy_data<-cbind(tidy_data[,1:2],select(tidy_data,contains("mean")))


# to set the path for the output file (subject+activity+mean_per_factor)
setwd(output_path)
write.table(tidy_data, file = "final_tidy_data.txt",row.name=FALSE)
