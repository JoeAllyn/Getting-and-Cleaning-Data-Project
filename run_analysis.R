# Getting and Cleaning Data - Project

# Merges the training and the test sets to create one data set.
# Download Data Files and Unzip
filename <- "UCIHARDataset.zip"
if(!file.exists(filename)) {
    fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileurl, filename)    
}
if(!file.exists("UCI HAR Dataset")) {
  unzip(filename)
}

#Load all datasets
#Train datasets
training <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainingAct <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainingSub <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Test datasets
testing <- read.table("./UCI HAR Dataset/test/X_test.txt")
testingAct <- read.table("./UCI HAR Dataset/test/y_test.txt")
testingSub <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Features and Activity Labels
features <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Combine Training and Activity Data
training <- cbind(trainingSub, trainingAct, training)
testing <- cbind(testingSub, testingAct, testing)
combined <- rbind(training, testing)

#Add Labels with Descriptive Variable Names
featuresLabels <- as.character(features[,2])
featuresLabels <- gsub("[()-]","",featuresLabels)
featuresLabels <- gsub("[-]","",featuresLabels)
featuresLabels <- gsub("[,]","",featuresLabels)
colnames(combined) <- c("subjectid", "activityid", featuresLabels)

#Extracts only the measurements on the mean and standard deviation for each measurement.
#Identify Columns with Mean and Std Dev Measures and IDs and Create New Dataset
keepColumns <- colnames(combined)
extractColumns <- (grepl("subjectid", keepColumns) |
                   grepl("activityid", keepColumns) |
                   grepl("*[Ss]td*", keepColumns) | 
                   grepl("*[Mm]ean*", keepColumns))

subCombined <- combined[ , extractColumns == TRUE]

#Add descriptive activity names to name the activities in the data set
subCombined$activityid <- factor(subCombined$activityid, levels = activityLabels[,1], labels = activityLabels[,2])
subCombined$subjectid <- as.factor(subCombined$subjectid)
 
#Create a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyDataSet <- aggregate(. ~subjectid + activityid, data = subCombined , FUN = "mean")

write.table(tidyDataSet, "tidyDataSet.txt", row.name=FALSE)

#Code to read back in Tidy Data Set
#data <- read.table("tidyDataSet.txt", header=TRUE)
#View(data)

