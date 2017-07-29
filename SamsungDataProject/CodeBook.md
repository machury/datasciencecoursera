## This is a markdown file

#Describes the variables:
The first variable is the Id of one of the 6 activities.
The second variable is the name of the activity [Walking, Walking_Upstairs, Walkin_Downstairs, Sitting, Standing, Laying].
The third variable is the subject Id, 1 to 30.
The fourth to 68th variable is the activity that is either a mean() or std() feature.

 [1] "Activity.Id"                     "Activity.Name"                   "Subject.Id"                     
 [4] "1_tBodyAcc-mean()-X"             "2_tBodyAcc-mean()-Y"             "3_tBodyAcc-mean()-Z"            
 [7] "41_tGravityAcc-mean()-X"         "42_tGravityAcc-mean()-Y"         "43_tGravityAcc-mean()-Z"        
[10] "81_tBodyAccJerk-mean()-X"        "82_tBodyAccJerk-mean()-Y"        "83_tBodyAccJerk-mean()-Z"       
[13] "121_tBodyGyro-mean()-X"          "122_tBodyGyro-mean()-Y"          "123_tBodyGyro-mean()-Z"         
[16] "161_tBodyGyroJerk-mean()-X"      "162_tBodyGyroJerk-mean()-Y"      "163_tBodyGyroJerk-mean()-Z"     
[19] "201_tBodyAccMag-mean()"          "214_tGravityAccMag-mean()"       "227_tBodyAccJerkMag-mean()"     
[22] "240_tBodyGyroMag-mean()"         "253_tBodyGyroJerkMag-mean()"     "266_fBodyAcc-mean()-X"          
[25] "267_fBodyAcc-mean()-Y"           "268_fBodyAcc-mean()-Z"           "345_fBodyAccJerk-mean()-X"      
[28] "346_fBodyAccJerk-mean()-Y"       "347_fBodyAccJerk-mean()-Z"       "424_fBodyGyro-mean()-X"         
[31] "425_fBodyGyro-mean()-Y"          "426_fBodyGyro-mean()-Z"          "503_fBodyAccMag-mean()"         
[34] "516_fBodyBodyAccJerkMag-mean()"  "529_fBodyBodyGyroMag-mean()"     "542_fBodyBodyGyroJerkMag-mean()"
[37] "4_tBodyAcc-std()-X"              "5_tBodyAcc-std()-Y"              "6_tBodyAcc-std()-Z"             
[40] "44_tGravityAcc-std()-X"          "45_tGravityAcc-std()-Y"          "46_tGravityAcc-std()-Z"         
[43] "84_tBodyAccJerk-std()-X"         "85_tBodyAccJerk-std()-Y"         "86_tBodyAccJerk-std()-Z"        
[46] "124_tBodyGyro-std()-X"           "125_tBodyGyro-std()-Y"           "126_tBodyGyro-std()-Z"          
[49] "164_tBodyGyroJerk-std()-X"       "165_tBodyGyroJerk-std()-Y"       "166_tBodyGyroJerk-std()-Z"      
[52] "202_tBodyAccMag-std()"           "215_tGravityAccMag-std()"        "228_tBodyAccJerkMag-std()"      
[55] "241_tBodyGyroMag-std()"          "254_tBodyGyroJerkMag-std()"      "269_fBodyAcc-std()-X"           
[58] "270_fBodyAcc-std()-Y"            "271_fBodyAcc-std()-Z"            "348_fBodyAccJerk-std()-X"       
[61] "349_fBodyAccJerk-std()-Y"        "350_fBodyAccJerk-std()-Z"        "427_fBodyGyro-std()-X"          
[64] "428_fBodyGyro-std()-Y"           "429_fBodyGyro-std()-Z"           "504_fBodyAccMag-std()"          
[67] "517_fBodyBodyAccJerkMag-std()"   "530_fBodyBodyGyroMag-std()"      "543_fBodyBodyGyroJerkMag-std()" 

#The data:
The data is the average of each variable for each activity and each subject.

#Any transformations or work that you performed to clean up the data:
- First we install and load the necessay packages
- We load the activity labels and feature names
- In features we rename the feature names by appending the id_ to the feature to avoid dublicate column names
- We append new columns to the test and train data set, these columns are the activity Id, and the Subject Id corresponding to the data set.
- We merge the test and train set into one big data set.
- We add column names to the data set.
- We join the data set with the Activity table to get the activity names.
- We then filter the data set to only include those features that are std() or mean()
- We group by the Activity and Subject and calculate the average of each varible.
