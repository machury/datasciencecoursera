
#getwd()
#setwd("C:\\Users\\Monika Achury\\Documents\\DataScienceClass\\Course3\\Week4")

install.packages("dplyr")
library(dplyr)
install.packages("tidyr")
library(tidyr)

# Activity Labels
activty_Labels <- read.table("UCI HAR Dataset\\activity_labels.txt", header = FALSE, sep = "")
names(activty_Labels) <- c("Activity.Id", "Activity.Name")

# the 561 feature set
features <- read.table("UCI HAR Dataset\\features.txt", header = FALSE, sep = "")
names(features) <- c("Feature.Id", "Feature.Name")
features <- unite(features, "Feature.Name", c("Feature.Id", "Feature.Name"), sep = "_")

# Load test data
test_x_tbl <- read.table("UCI HAR Dataset\\test\\X_test.txt", header = FALSE, sep = "")
test_y_tbl <- read.table("UCI HAR Dataset\\test\\Y_test.txt", header = FALSE, sep = "")

# Load train data
train_x_tbl <- read.table("UCI HAR Dataset\\train\\X_train.txt", header = FALSE, sep = "")
train_y_tbl <- read.table("UCI HAR Dataset\\train\\Y_train.txt", header = FALSE, sep = "")

# Load subject data
subject_test_tbl <- read.table("UCI HAR Dataset\\test\\Subject_test.txt", header = FALSE, sep = "")
subject_train_tbl <- read.table("UCI HAR Dataset\\train\\Subject_train.txt", header = FALSE, sep = "")

# Add Actitivy column
test_x_y_tbl <- cbind(test_x_tbl, test_y_tbl, subject_test_tbl)
train_x_y_tbl <- cbind(train_x_tbl, train_y_tbl, subject_train_tbl)

#Merge the training and the test sets to create one data set.
test_and_train_tbl <- rbind(test_x_y_tbl, train_x_y_tbl)

#Add Column Names
names(test_and_train_tbl) <- c(features$Feature.Name, "Activity.Id", "Subject.Id")

#Uses descriptive activity names to name the activities in the data set
test_and_train_x_y_labeled_tbl <- merge(test_and_train_tbl, activty_Labels, by.x = "Activity.Id", by.y = "Activity.Id")

#Filters rows
test_and_train_x_y_labeled_subset_tbl <- select(test_and_train_x_y_labeled_tbl, contains("-mean()"), contains("-std()"), starts_with("Activity."), starts_with("Subject."))

#independent tidy data set with the average of each variable for each activity and each subject
data_by_Activity_and_Subject <- group_by(test_and_train_x_y_labeled_subset_tbl, Activity.Id, Activity.Name, Subject.Id)

#data summarised
data_by_Activity_and_subject_summarise <- summarise_all(data_by_Activity_and_Subject, funs(mean))

write.table(data_by_Activity_and_subject_summarise, "results.txt", row.name=FALSE)

data_by_Activity_and_subject_summarise