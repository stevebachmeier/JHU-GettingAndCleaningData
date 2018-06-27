John Hopkins University Data Science specialization
Final Project: Getting and Cleaning Data

# RAW DATA DOWNLOAD LOCATION
The raw data for this project is found at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# FOLDER STRUCTURE
Inside of the working directory are three files: this CodeBook.md, README.md,
and the analysis script run_analysis.R

There is also a subdirectory called "Data" which contains all of the downloaded
raw data.

* 'Data/UCI HAR Dataset/
    * activity_labels.txt'
    * features.txt'
    * features_info.txt'
    * README.txt'

    * test/
        * subject_test.txt'
        * X_test.txt'
        * y_test.txt'
        * Inertial Signals/
            * < body acceleration, body gyro, and total acceleration data
            in x-, y-, and z-directions >'
           
    * train/
        * subject_train.txt'
        * X_train.txt'
        * y_train.txt'
        * Inertial Signals/
            * < body acceleration, body gyro, and total acceleration data  
            in x-, y-, and z-directions >'

# FILES
The descriptions of the downloaded files are taken from the downloaded 
README.txt:
    * 'README.txt'
    * 'features_info.txt': Shows information about the variables used on the 
    feature vector.
    * 'features.txt': List of all features.
    * 'activity_labels.txt': Links the class labels with their activity name.
    * 'train/X_train.txt': Training set.
    * 'train/y_train.txt': Training labels.
    * 'test/X_test.txt': Test set.
    * 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their 
descriptions are equivalent. 
    * 'train/subject_train.txt': Each row identifies the subject who performed 
    the activity for each window sample. Its range is from 1 to 30. 
    * 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal 
    from the smartphone accelerometer X axis in standard gravity units 'g'. 
    Every row shows a 128 element vector. The same description applies for the 
    'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z 
    axis. 
    * 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration 
    signal obtained by subtracting the gravity from the total acceleration. 
    * 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity 
    vector measured by the gyroscope for each window sample. The units are 
    radians/second. 
            
# SCRIPT(S)
The analysis script for this project is: 'run_analysis.R'
It is located in the home directory.

# INSTRUCTIONS
Instructions for running the analysis are found in the 'README.md.'

# OBJECTS CREATED
The script creates the following objects:
    * Direct imports from raw data:
        * X_train: training set data (dependent variables)
        * X_test: test set data (dependent variables)
        * y_train: training set labels (independent variables)
        * y_test: test set labels (independent variables)
        * subject_train: training set subject IDs
        * subject_test: test set subject IDs
    * Intermediate objects
        * df_train: merged training set including subject_train, X_train, and
        y_train
        * df_test: merged training set including subject_test, X_test, and 
        y_test
        * df_merged: merged data set including df_train and df_test
        * features: vector of feature names
        * keep: vector of feature indices+1 (to be directly applicable to 
        df_merged which added a column of subject IDs at the beginning) that
        include "[Mm]ean()", "[Mm]ean[Ff]req()", or "[Ss]td()"
        * keep_labels: vector of feature labels (from features) found from the 
        keep vector
        
    * Result objects
        * df_pared: A pared down version of df_merged that only includes
        mean and standard deviation columns
        * df_means: A data frame derived from df_pared, grouped by subject
        ID and activity label and summarized with mean for each variable.
        
# VARIABLES
df_pared and df_means both include values for the following 82 columns:

 [1] "subject"                         "activity_label"                  "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"              
 [5] "tBodyAcc-mean()-Z"               "tBodyAcc-std()-X"                "tBodyAcc-std()-Y"                "tBodyAcc-std()-Z"               
 [9] "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"            "tGravityAcc-mean()-Z"            "tGravityAcc-std()-X"            
[13] "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"             "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
[17] "tBodyAccJerk-mean()-Z"           "tBodyAccJerk-std()-X"            "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"           
[21] "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"              "tBodyGyro-mean()-Z"              "tBodyGyro-std()-X"              
[25] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"               "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
[29] "tBodyGyroJerk-mean()-Z"          "tBodyGyroJerk-std()-X"           "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"          
[33] "tBodyAccMag-mean()"              "tBodyAccMag-std()"               "tGravityAccMag-mean()"           "tGravityAccMag-std()"           
[37] "tBodyAccJerkMag-mean()"          "tBodyAccJerkMag-std()"           "tBodyGyroMag-mean()"             "tBodyGyroMag-std()"             
[41] "tBodyGyroJerkMag-mean()"         "tBodyGyroJerkMag-std()"          "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
[45] "fBodyAcc-mean()-Z"               "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"                "fBodyAcc-std()-Z"               
[49] "fBodyAcc-meanFreq()-X"           "fBodyAcc-meanFreq()-Y"           "fBodyAcc-meanFreq()-Z"           "fBodyAccJerk-mean()-X"          
[53] "fBodyAccJerk-mean()-Y"           "fBodyAccJerk-mean()-Z"           "fBodyAccJerk-std()-X"            "fBodyAccJerk-std()-Y"           
[57] "fBodyAccJerk-std()-Z"            "fBodyAccJerk-meanFreq()-X"       "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
[61] "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"              "fBodyGyro-mean()-Z"              "fBodyGyro-std()-X"              
[65] "fBodyGyro-std()-Y"               "fBodyGyro-std()-Z"               "fBodyGyro-meanFreq()-X"          "fBodyGyro-meanFreq()-Y"         
[69] "fBodyGyro-meanFreq()-Z"          "fBodyAccMag-mean()"              "fBodyAccMag-std()"               "fBodyAccMag-meanFreq()"         
[73] "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-std()"       "fBodyBodyAccJerkMag-meanFreq()"  "fBodyBodyGyroMag-mean()"        
[77] "fBodyBodyGyroMag-std()"          "fBodyBodyGyroMag-meanFreq()"     "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-std()"     
[81] "fBodyBodyGyroJerkMag-meanFreq()" "activity" 

## VARIABLE UNITS
All of the variables are unitless ("subject", "activity", and "activity_label"
are inherently without units and all of the measured values have been
normalized and bounded to [-1,1]).

The units of the raw (not-normalized) readings (found from the data's 
README.txt) are:
    * "Acc" variables:  g
    * "Gyro" variables: rad/sec