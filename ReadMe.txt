Getting and Cleaning Data Course Project
---------------------------------------------------------------------------
Overview:
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare a tidy data that can be used for later analysis. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

----------------------------------------------------------------------------
Overview of data processing:
The following steps are coded in the run_analysis.R script - 
1. Merges the training and the test sets to create one data set.
2. Uses descriptive activity names to name the activities in the data set
3. Appropriately labels the data set with descriptive variable names.
4. Extracts only the measurements on the mean and standard deviation for each measurement.
	- All descriptive variables that contained the string "std" or "mean" (both upper and lower case versions were extracted.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

----------------------------------------------------------------------------
Files contained in this repo:

- run_analysis.R - code to process raw files from data link above.
- ReadMe.txt - explanation of project/files
- tidyDataSet.txt - final tidy data set output from run_analysis.R script
- CodeBook.md - code book for tidyDataSet.txt

The following code can be used to read the tidy data set into R:

data <- read.table("tidyDataSet.txt", header=TRUE)
View(data)