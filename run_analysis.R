# -----------------------------------------------------------------------------------------------------------------
# run_analysis.R
# Author: fbo743
# Date: 22.02.2015
# Version: 1.0
# -----------------------------------------------------------------------------------------------------------------
# 0. Setup - Load files
# -----------------------------------------------------------------------------------------------------------------

# 0.1 Load libraries

library(stringr)
library(data.table)
library(dplyr)

# 0.2 Load features labels and initialize column names

dff <- data.table(read.table("features.txt", stringsAsFactors=FALSE))
setnames(dff, c("feature_id", "feature"))

# 0.3 Load activity labels

dfa <- data.table(read.table("activity_labels.txt", stringsAsFactors=FALSE))
setnames(dfa, c("activity_id", "activity"))

# 0.4 Load trained subjects' data

dftrx <- data.table(read.table("train/X_train.txt", stringsAsFactors=FALSE))
dftry <- data.table(read.table("train/y_train.txt", stringsAsFactors=FALSE))
dftrs <- data.table(read.table("train/subject_train.txt", stringsAsFactors=FALSE))

# 0.5 Load test subjects' data

dftsx <- data.table(read.table("test/X_test.txt", stringsAsFactors=FALSE))
dftsy <- data.table(read.table("test/y_test.txt", stringsAsFactors=FALSE))
dftss <- data.table(read.table("test/subject_test.txt", stringsAsFactors=FALSE))

# -----------------------------------------------------------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set
# -----------------------------------------------------------------------------------------------------------------

# 1.1 Merge X training and test data sets 

dsx <- rbind(dftrx,dftsx)
setnames(dsx,dff$feature) 
rm(dftrx, dftsx) 

# 1.2 Merge Y training with test data sets

dsy <- rbind(dftry,dftsy)
setnames(dsy, c("activity")) 
dsy <- mutate(dsy, activity = dfa$activity[dsy$activity])
rm(dftry, dftsy)

# 1.3 Merge Subjects' training with test data sets 

dss <- rbind(dftrs,dftss)
setnames(dss, c("subject_id"))
rm(dftrs, dftss)

# 1.4 Concatenate X and Y data sets

fds <- cbind(dss, dsy, dsx)
rm (dsx, dsy, dss)

# -----------------------------------------------------------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# -----------------------------------------------------------------------------------------------------------------

ds <- select(fds, subject_id, activity, contains("-mean("),contains("-std("))

# -----------------------------------------------------------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set
#    Note: done in (1.) to simplify the code
# -----------------------------------------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------------------------------------
# 4. Appropriately labels the data set with descriptive variable names 
#    Note: done in (1.) to simplify the code
# -----------------------------------------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------------------------------------
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.
# -----------------------------------------------------------------------------------------------------------------

ds2 <- ds %>% group_by(subject_id, activity) %>% summarise_each(funs(mean)) %>% arrange(subject_id, activity)

# -----------------------------------------------------------------------------------------------------------------
# 6. Write tidy data 
# -----------------------------------------------------------------------------------------------------------------

write.csv(ds2, file="result-data-set.txt", row.names=FALSE)
