John Hopkins University Data Science specialization
Final Project: Getting and Cleaning Data

# SUMMARY
The final project for this course (Getting and Cleaning Data) involves
downloading and cleaning some (presumably machine learning) test and training
data sets of fitness data. These downloaded data sets include raw data measured
from a Samsung Galaxy S II worn on the waists of 30 volunteers (19-48 years of 
age) performing six different levels of physical activity:
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING
  
The CodeBook.md lists all of the available files from the download. The 
relevent ones for this project are
    * activity_labels.txt: conversions from activity name to class labels
    * features.txt: column names of raw test and training data
    * X_test.txt: test set data
    * X_train.txt: training set data
    * y_test.txt: test set labels
    * y_train.txt: training set labels
    * subject_test.txt: test set subject labels
    * subject_train.txt: training set subject labels
  
## PROJECT REQUIREMENTS
The requirements of this final project:
    1. Merge the training and test sets to create one data set.
    2. Extract only the measurements on the mean and standard deviation for each 
    measurement.
    3. Use descriptive activity names to name the activities in the data set.
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set 
    with the average of each variable for each activity and each subject.

# NOTES
    * The second project requirement is somewhat ambiguous - which data exactly
    are the mean and standard deviation? I chose to consider any label that
    includes "[Mm]ean()", "[Mm]ean[Ff]req()", or "[Ss]td(). I included the ()
    in the grep search because leaving them out included variable names
    that included the word "mean" as a parameter, 
    e.g. "angle(tBodyAccMean,gravity)"
    * For the third requirement, refer to activity_labels.txt.
    * For the fourth requirement, features_info.txt is useful.

# INSTRUCTIONS
    1. Download the dplyr package (if required): install.package("dplyr")
    2. Download the raw data to ./Data/
    3. Unzip the raw data and delete the zipped folder.
    4. Ensure that the following folder/file structure exists:
        * "./README.md" (this file)
        * "./CodeBook.md"
        * "./run_analysis.R"
        * "./Data/UCI HAR Dataset/
            * activity_labels.txt"
            * features.txt"
            * features_info.txt"
            * README.txt"
            * test/
                * subject_tests.txt"
                * X_test.txt"
                * y_test.txt"
                * Inertial Signals/
                    * < Nine body_acc, body_gyro, and total_acc .txt files >"
            * train/
                * subject_train.txt"
                * X_train.txt"
                * y_train.txt"
                * Inertial Signals/ 
                    * < Nine body_acc, body_gyro, and total_acc .txt files >"
    5. Open the R Console or R Studio.
    6. Navigate to the working directory for this project.
    7. Run run_analysis.R:
        * R Studio: Open the file and click the source icon.
        * R Console: type 'source(".\\run_analysis.R")'
# JHU-GettingAndCleaningData
