Code Book
In the tidy data set, the definitions of variables are following. They are from "feature_info.txt" in the original "UCI HAR Dataset" file.

Subject id :
Number 1 to number 30 

Activity :
Each subject performes six activities when wearing a smartphone.

Walking
Walking upstairs
Walking downstairs
Sitting
Standing
Laying

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
