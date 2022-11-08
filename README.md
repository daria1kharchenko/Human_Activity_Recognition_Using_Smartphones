File 'run_analysis.R' contains script which cleans a data set from  here:
	'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

More about dataset you can read here:
	'http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones'

Script takes the data from two sets and merged it to one.
Date were merged from the training and the test sets.
Then the measurements on the mean and standard deviation for each measurement were extracted. 
Nemes of variables were chenged to apropriate labels.

Then script creates a second, independent tidy data set with the average of each variable for each activity and each subject and seves it to 
	'tidydata.txt'
Reading this file:
	tidydata <- read.table('tidydata.txt')
	View(tidydata)

Loading script:
	unzip file which you download 
	put file 'run_analysis.R' to /UCI HAR Dataset
	load script:
	source('run_analysis.R')
