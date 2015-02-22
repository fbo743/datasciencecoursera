## Run Analsyis Script Help

###1. Reference data

1. Activities
  * Definition of all activities performed by a subject.
    * see file. /activity_labels.txt

2. Features
  * Definition of all features measured for activities performed by a subject.
    * see file: ./features.txt

###2. Result Data

* [1] subject_id
  *  Value domain: 1..30 (number of subjects involved in both train and test phases).

* [2] activity
  * Value domain: defined Activity reference data.
  
* [3:68] average of mean and standard feature measures
  * Name values: defined by Features reference data, but limited to names containing "mean(" and "std(".
    * [3] "tBodyAcc-mean()-X"          
    * [4] "tBodyAcc-mean()-Y"          
    * [5] "tBodyAcc-mean()-Z"          
    * [6] "tGravityAcc-mean()-X"       
    * [7] "tGravityAcc-mean()-Y"       
    * [8] "tGravityAcc-mean()-Z"       
    * [9] "tBodyAccJerk-mean()-X"      
    * [10] "tBodyAccJerk-mean()-Y"      
    * [11] "tBodyAccJerk-mean()-Z"      
    * [12] "tBodyGyro-mean()-X"         
    * [13] "tBodyGyro-mean()-Y"         
    * [14] "tBodyGyro-mean()-Z"         
    * [15] "tBodyGyroJerk-mean()-X"     
    * [16] "tBodyGyroJerk-mean()-Y"     
    * [17] "tBodyGyroJerk-mean()-Z"     
    * [18] "tBodyAccMag-mean()"         
    * [19] "tGravityAccMag-mean()"      
    * [20] "tBodyAccJerkMag-mean()"     
    * [21] "tBodyGyroMag-mean()"        
    * [22] "tBodyGyroJerkMag-mean()"    
    * [23] "fBodyAcc-mean()-X"          
    * [24] "fBodyAcc-mean()-Y"          
    * [25] "fBodyAcc-mean()-Z"          
    * [26] "fBodyAccJerk-mean()-X"      
    * [27] "fBodyAccJerk-mean()-Y"      
    * [28] "fBodyAccJerk-mean()-Z"      
    * [29] "fBodyGyro-mean()-X"         
    * [30] "fBodyGyro-mean()-Y"         
    * [31] "fBodyGyro-mean()-Z"         
    * [32] "fBodyAccMag-mean()"         
    * [33] "fBodyBodyAccJerkMag-mean()" 
    * [34] "fBodyBodyGyroMag-mean()"    
    * [35] "fBodyBodyGyroJerkMag-mean()"
    * [36] "tBodyAcc-std()-X"           
    * [37] "tBodyAcc-std()-Y"           
    * [38] "tBodyAcc-std()-Z"           
    * [39] "tGravityAcc-std()-X"        
    * [40] "tGravityAcc-std()-Y"        
    * [41] "tGravityAcc-std()-Z"        
    * [42] "tBodyAccJerk-std()-X"       
    * [43] "tBodyAccJerk-std()-Y"       
    * [44] "tBodyAccJerk-std()-Z"       
    * [45] "tBodyGyro-std()-X"          
    * [46] "tBodyGyro-std()-Y"          
    * [47] "tBodyGyro-std()-Z"          
    * [48] "tBodyGyroJerk-std()-X"      
    * [49] "tBodyGyroJerk-std()-Y"      
    * [50] "tBodyGyroJerk-std()-Z"      
    * [51] "tBodyAccMag-std()"          
    * [52] "tGravityAccMag-std()"       
    * [53] "tBodyAccJerkMag-std()"      
    * [54] "tBodyGyroMag-std()"         
    * [55] "tBodyGyroJerkMag-std()"     
    * [56] "fBodyAcc-std()-X"           
    * [57] "fBodyAcc-std()-Y"           
    * [58] "fBodyAcc-std()-Z"           
    * [59] "fBodyAccJerk-std()-X"       
    * [60] "fBodyAccJerk-std()-Y"       
    * [61] "fBodyAccJerk-std()-Z"       
    * [62] "fBodyGyro-std()-X"            
    * [63] "fBodyGyro-std()-Y"          
    * [64] "fBodyGyro-std()-Z"          
    * [65] "fBodyAccMag-std()"          
    * [66] "fBodyBodyAccJerkMag-std()"  
    * [67] "fBodyBodyGyroMag-std()"     
    * [68] "fBodyBodyGyroJerkMag-std()" 
  * Measure values: range between -1.0 and 1.0

###3. Script description

The activities performed by the run_analysis.R script are the following:

0. Setup phase
  * input files:
    * ./features.txt
    * ./activity_labels.txt
    * ./train/X_train.txt"
    * ./train/y_train.txt"
    * ./train/subject_train.txt
    * ./test/X_test.txt
    * ./test/y_test.txt
    * ./test/subject_test.txt
1. Merges the training and the test sets to create one data set
2. 2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
4. Write tidy data into text file 
    * output file:  ./result-data-set.txt

Notes: 
* the activites 3. "Uses descriptive activity names to name the activities in the data set" 
   and 4. "Appropriately labels the data set with descriptive variable names" are performed
   in step 1. to simplify the structure of the code.
* have a look at the comments in the script for a detailed description

