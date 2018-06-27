# ---- DOWNLOAD DATA ----
# if(!dir.exists("./Data")) {dir.create("./Data")}
# download.file(
#       "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
#       "Data/har.zip")
# # Unzip the download

# ---- IMPORT LIBRARIES ----
library(dplyr)

# ---- LOAD DATA FRAMES ----
# Data sets
X_train <- read.fwf(file="./Data/UCI HAR Dataset/train/X_train.txt",
                    widths=rep(16,561), header=F)
X_test <- read.fwf(file="./Data/UCI HAR Dataset/test/X_test.txt", 
                   widths=rep(16,561), header=F)

# Data set labels
y_train <- read.csv(file="./Data/UCI HAR Dataset/train/y_train.txt", header=F)
y_test <- read.csv(file="./Data/UCI HAR Dataset/test/y_test.txt", header=F)

# Subject IDs
subject_train <- read.csv(file="./Data/UCI HAR Dataset/train/subject_train.txt", 
                          header=F)
subject_test <- read.csv(file="./Data/UCI HAR Dataset/test/subject_test.txt", 
                         header=F)

# ---- CLEAN DATA ----
# Merge data frames
df_train <- cbind(subject_train, X_train, y_train)
df_test <- cbind(subject_test, X_test, y_test)
df_merged <- rbind(df_train, df_test)

# Look for NA or empty cells
paste('Number of NAs or empty cells in df_merged:',
      sum(is.na(df_merged) | df_merged==""))

# ---- EXTRACT MEAN AND STD DEV MEASUREMENTS ----
features <- read.csv(file="Data/UCI HAR Dataset/features.txt", header=F, sep=" ")
features <- select(features, -1)
keep <- grep("([Ss]td\\(\\)|[Mm]ean\\(\\)|[Mm]ean[Ff]req\\(\\))", features[,1])+1
colnames(df_merged) <- paste("X",c(1:length(df_merged)), sep="")
df_pared <- select(df_merged, 1,keep,length(df_merged))

# ---- APPLY DESCRIPTIVE ACTIVITY NAMES ----
colnames(df_pared)[length(df_pared)] <- "activity"
df_pared$activity_label <- factor(x=df_pared$activity, levels=c(1,2,3,4,5,6), 
        labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING",
        "STANDING","LAYING"))

# ---- APPLY DESCRIPTIVE VARIABLE LABELS ----
colnames(df_pared)[1] <- "subject"
keep_labels <- as.character(features[keep-1,])
colnames(df_pared)[2:80] <- keep_labels

# ---- CREATE NEW DF WITH MEANS FOR EACH ACTIVITY AND SUBJECT ----
df_means <- group_by(df_pared, subject, activity_label)
df_means <- summarize_all(df_means,mean)
write.table(x=df_means, file="df_means.txt", row.names=FALSE)