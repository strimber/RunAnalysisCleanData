
## Coursera course "Getting and CLeaning Data" course assignment
## Purpose:  Demonstrate basic skills in data cleaning
## Author: Scott Trimber
## Date: 4/21/15
##
##
##
##
##
##
## 1) Check to see if the proper packages are installed and available for data cleanup

print("checking to see if required library (dplyr) is installed....")

    allPackages <- installed.packages()
    list <- allPackages[,1]
    if(!is.element("dplyr",list)){
         install.packages("dplyr")
    }

    library(dplyr)

## 2) check that the data files exist
print("Checking to see data files exist...")
   requiredFiles <- c("subject_train.txt",
                      "subject_test.txt",
                      "X_train.txt",
                      "X_test.txt",
                      "y_train.txt",
                      "y_text.txt",
                      "features.txt",
                      "activity_labels.txt")

## 3) load the data files into seperate objects for maniuplation
print ("Loading the data files for cleaning...")

  subjectTrain <- read.table("subject_train.txt")
  subjectTest <- read.table("subject_test.txt")
  xTrain <- read.table("X_train.txt")
  xTest <- read.table("X_test.txt")
  yTrain <- read.table("y_train.txt")
  yTest <- read.table("y_test.txt")
  featuresNames <- read.table("features.txt")
  activityLabels <- read.table("activity_labels.txt")

## 4) Merge the training and test data sets into one data set
print("Merging the training and test data sets...")


## fix the table variable names into something meaningful...

names(subjectTrain)[1] <-  "subjectId"
names(subjectTest)[1] <- "subjectId"
names(yTrain)[1] <- "activity"
names(yTest)[1] <- "activity"

names(xTrain) <- featuresNames$V2
names(xTest) <- featuresNames$V2

## now combine

joinedTrain <- cbind(subjectTrain,yTrain,xTrain)
joinedTest <- cbind(subjectTest,yTest,xTest)
joined <- rbind(joinedTrain,joinedTest)



## 5) retain only the standard deviation and mean columns from the combined dataset
print("Filtering columns in data set...")
keepCols <- grep("mean\\(\\)|std\\(\\)|subjectId|activity",names(joined))
joined <- joined[,keepCols]

## 6) relable the activity names to more descriptive terms
print("Relabeling activity names...")
joined$activity <- as.factor(joined$activity)
levels(joined$activity) <- c(  "WALKING",
                               "WALKING_UPSTAIRS",
                               "WALKING_DOWNSTAIRS",
                               "SITTING",
                               "STANDING",
                               "LAYING")

## 7) write out the new 'tidy' data set as a text file with row.names = FALSE
print("Summarizing the data and writing out new tidy data set as 'tidy.txt'...")

tidy <- joined %>% group_by(subjectId,activity) %>% summarise_each(funs(mean))
write.csv(tidy, "tidy.txt", row.names=FALSE)

## END OF SCRIPT