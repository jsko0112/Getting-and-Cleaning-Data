## 
# Getting-and-Cleaning-Data
# Course Project : run_analysis.R

# Description of Working
#
# 1. Run this run_analysis.R file in your working directory
#
# 2. Working
#
#  1) Getting
#   A. Check data file and download
#      - Check the original data file exists in the working directory
#      - If the original data file does not exist, download the file
#   B. Check downloaded data file and Uncompress the data file(original-dataset.zip)
#      - Check the original data file was downloaded
#      - If downloaded file does not exist, stop the program
#      - If downloaded file exists, Uncompress the data file
#   C. Check uncompressed data file 
#      - Check Uncompressed data files exist in the 'UCI HAR Dataset' folder
#      - If there are no files, stop the program
#   D. Read data
#     - Read activity labels
#     - Read feature labels
#     - Read the train data files and assign column names
#     - # Read the test data files and assign column names
#
#  2) Cleaning
#   A. Merges the training and the test sets to create one data set.
#   B. Extracts only the measurements on the mean and standard deviation for each measurement.
#   C. Uses descriptive activity names to name the activities in the data set
   D. Appropriately labels the data set with descriptive activity names.
   E. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
#
##  




