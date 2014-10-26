coursera-getting-cleaning-data, Codebook
========================================

Repository for the Getting and Cleaning Data Course Project

## Original Data Set

* Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data set is derived from data collected from the accelerometers from the Samsung Galaxy S smartphone. Specifically, signals from the accelerometer and gyroscope have been processed into a measurement vector of 561 features. For more information, please see the features_info.txt in the zipped data set folder. You can download the data from the link above, as well as read more information about the device.

## Data Sets

run_analysis.R produces two data sets during its runtime. The first one is the raw data set, and the second one is hte tidy data set.

# Raw data set

The raw data set was made using the combined train and test subsets from the original data set. The regex "-mean\\(\\)|-std\\(\\)" was used in order to properly filter the requested features from the original data set. Any parentheses and underscores were removed as well. The activity names were cleaned in order to be more readable. Afterwards, the subject IDs, activity labels, and feature names were merged into final raw dataset, which was written onto the disk as merged_clean_data.txt.

# Tidy data set

The tidy data set has the average of each measurement for each activity and subject. It was put together using the raw data, and was "tidied" up in order to fit the needs of tidy data structures.