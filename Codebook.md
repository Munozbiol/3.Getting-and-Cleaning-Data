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
