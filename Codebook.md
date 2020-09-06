Code Book
In the tidy data set, the definitions of variables are following. They are from "feature_info.txt" in the original "UCI HAR Dataset" file.

Subject id :
Number 1 to number 30 mean 30 subjects who participate in the experiment.

Activity :
Each subject performes six activities when wearing a smartphone.

Walking
Walking upstairs
Walking downstairs
Sitting
Standing
Laying
Variables contain X, Y or X.
It is used to denote 3-axial signals in the X, Y and Z directions.

Variables contain Gyro or ACC.
The smartphone embeds two sensor signals for recording the results of activities, accelerometer and gyroscope respectively.

Variables contain Time_Acc_XYZ and Time_Gyro_XYZ.
These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

Variables contain Time_BodyAcc_XYZ and Time_GravityAcc_XYZ.
The acceleration signal was separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Time_BodyAccJerk_XYZ and Time_BodyGyroJerk_XYZ.
The body linear acceleration and angular velocity were derived in time to obtain Jerk signals.

Time_BodyAccMag, Time_GravityAccMag, Time_BodyAccJerkMag, Time_BodyGyroMag and Time_BodyGyroJerkMag.
The magnitude of these three-dimensional signals were calculated using the Euclidean norm.

Frequency_BodyAcc-XYZ, Frequency_BodyAccJerk-XYZ, Frequency_BodyGyro-XYZ, Frequency_BodyAccJerkMag, Frequency_BodyGyroMag and Frequency_BodyGyroJerkMag.
A Fast Fourier Transform (FFT) was applied to some of these signals producing these variables.

Variables contain mean: Mean value.

Variables contain std: Standard deviation.

Variables in general: 

'general_path':the path where working directory with all files and folder of 'UCI HAR Dataset' is placed.

'train_path': the path where working directory with all files and folder of 'train' is placed.

'test_path': the path where working directory with all files and folder of 'test' is placed.

'output_path':the path where working directory to place the final output is placed.

'activity_names': labels from "activity_labels.txt"

'features': features from "features.txt"

'X_train': train set

'y_train': labels to train set

'subject_train': subject from "subject_train.txt"

'extract_features': logical vector to define columns to be selected from 'features' ("mean|std")

'X_train': refined 'X_train' only with columns that contains mean and std

'y_train[,2]': the column that contains the activity names

'train_data': final train data set

variables for test set are the same by content but for the name - 'train' is replaced with 'test'

'all_data': merged rows of train and test sets

'id_names': column names for qualitative fields

'data_labels':column names but for names in id_names variable

'melt_all': adjusted data sets with measure variables

#prefinal data set tidy_data<-dcast(melt_all, subject + Activity_Label ~ variable, mean)

#final data set to be written tidy_data<-cbind(tidy_data[,1:2],select(tidy_data,contains("mean")))
