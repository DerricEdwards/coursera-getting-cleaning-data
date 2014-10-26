coursera-getting-cleaning-data
==============================

Repository for the Getting and Cleaning Data Course Project

## Setup Steps

* Unzip the source files (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your desired drive.
* Place the run_analysis.R script into that same unzipped folder ("C:/.../UCI HAR Dataset")
* Make sure the set the working directory of RStudio to be the same as the unzipped folder. To do this, use the following command: setwd("/C:/.../UCI HAR Dataset"). Make sure to replace the "..." with the approriate path on your disk.
* Use varName <- read.table("data_set_with_averages.txt") to read in the averaged and tidied data. It has 30 different subjects and 6 activities. If you want to, you can use varName <- read.table("merged_clean_data.txt") to read the merged and clean data table.

## How the Script Works

run_analysis.R performs the following tasks in order to clean up the data set in a tidy fashion.

* Merge the training and test sets into one data set. Specficially, the merge order is train/X_train.txt with test/X_test.txt.
* Read features.txt and extract only the measurements on the mean and standard deviation for each measurement.
* Read in the activity_labels.txt file, and use the six labels present for the descriptive activity names. Use these names to name the activities in the merged data set.
* Label the data set with descriptive activity names. This time, make sure that all the names are converted to lower case, and extraneous characters such as parentheses and underscores are removed. Then merge all the three major data frames together, these being: the one containing the list of features (X), the one containing the activity labels (Y), and the one containing the subject IDs (S). Write this merged frame onto the disk with the name merged_clean_data.txt.
* Create a independent second tidy data set using the average of each measurement for each activity and subject. The data frame is structured as follows: first column contains the subject IDs, second column contains the activity names, and third column contains the averages for each of the attributes. This new data frame is stored on disk as data_set_with_averages.txt
