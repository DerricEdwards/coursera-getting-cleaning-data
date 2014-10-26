# Data source needed for this project is located at:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Make sure the working directory is set to be inside of that folder!

# This R script performs the following tasks in this order:

# 1. Merges the training and the test sets to create one data set.
# It does so by loading those sets up and rowbinding them together into three individual data sets:
# X, S, and Y.

train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")
X <- rbind(train, test)

train <- read.table("train/subject_train.txt")
test <- read.table("test/subject_test.txt")
S <- rbind(train, test)

train <- read.table("train/y_train.txt")
test <- read.table("test/y_test.txt")
Y <- rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# It does so by reading in the features file, and using a regex and grep in order to extract
# the indices of the desired features, and then setting the names of the X table to the appropriate
# values.
features <- read.table("features.txt")
good_features_indexes <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, good_features_indexes]

names(X) <- features[good_features_indexes, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# 3. Uses descriptive activity names to name the activities in the data set.
# Perform a substitution on the inputed activity labels, and place them in the Y table.
activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[, 1] = activities[Y[, 1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.
# Apply the descriptive activity names from the earlier steps, by column binding all three tables.
# Then write the merged table into a file.
names(S) <- "subject"
cleaned <- cbind(S, Y, X)
write.table(cleaned, "merged_clean_data.txt")

# 5. From the data set in step 4, Creates a 2nd, independent tidy data set with the average 
# of each variable for each activity and each subject.

# Collect the unique subjects, and use them to to determine the number of subjects. Then determine the number
# of activities using the length of the activities table.
uniqueSubjects = unique(S)[, 1]
numSubjects = length(unique(S)[, 1])
numActivities = length(activities[, 1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]
row = 1

# Now, put together the tidy data set with the average of each variable for each activity and subject.
for (s in 1:numSubjects) 
{
  for (a in 1:numActivities) 
  {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$subject == s & cleaned$activity == activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row + 1
  }
}

# Write the tidy data set to a file.
write.table(result, "data_set_with_averages.txt", row.name = FALSE)