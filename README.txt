README for Coursera Assignment

This assignment will perform the following operations on the UCI HAR Dataset

 Coursera course "Getting and CLeaning Data" course assignment
 Purpose:  Demonstrate basic skills in data cleaning
 Author: Scott Trimber
 Date: 4/21/15
 
 1) Check to see if the proper packages are installed and available for data 
	This script depends on the dplyr library to perform the data manipulation.
	It will check to see if the package is installed first and will install the 
	library if it's not part of the installed packages.
	

 2) check that the data files exist in the current working directory.
    PLEASE NOTE.  This script will not look down the directory structure the way it is
	unzipped from the original zip file.  
	"subject_train.txt",
    "subject_test.txt",
    "X_train.txt",
    "X_test.txt",
    "y_train.txt",
    "y_text.txt",
    "features.txt",
    "activity_labels.txt")

 3) load the data files into separate objects for manipulation

 4) Merge the training and test data sets into one data set

 fix the table variable names into something meaningful and combine the dataset into one table.

 5) Filter the dataset and retain only the standard deviation and mean columns from the combined dataset and add a variable for subjectId and activity.


 6) relabel the activity names to more descriptive terms from their original "int" values.


 7) write out the new 'tidy' dataset in the current working directory as a text file (tidy.txt) with row.names = FALSE
