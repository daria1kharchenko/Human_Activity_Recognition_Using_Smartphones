library(dplyr)
#Reading files
setwd('./test')
xtest <- read.table('X_test.txt')
ytest <- read.table('y_test.txt')
subjecttest <- read.table('subject_test.txt')
setwd("../")
features <- read.table('features.txt')
setwd("./train")
subjecttrain <- read.table('subject_train.txt')
ytrain <- read.table('y_train.txt')
xtrain <- read.table('X_train.txt')
#Merging data in one dataset
xtest <- mutate(xtest, activity = ytest$V1)
xtest <- mutate(xtest, subject = subjecttest$V1)
xtrain <- mutate(xtrain, activity = ytrain$V1)
xtrain <- mutate(xtrain, subject = subjecttrain$V1)
merged <- bind_rows(xtest, xtrain)
names <- c(features$V2, c('activity', 'subject'))
names <- tolower(names)
names <- gsub('-', '.', names)
names <- gsub( '\\()','', names)
names(merged) <- names
#Selecting mean and std data
mean_std <- select(merged, contains(c('mean(', 'std', 'activity', 'subject')))
mean_std <- as_tibble(mean_std)
#Right names the activities
mean_std <- mutate(mean_std, activity = case_when(activity == 1 ~ 'WALKING', activity == 2 ~ 'WALKING_UPSTAIRS', activity == 3 ~ 'WALKING_DOWNSTAIRS', activity == 4 ~ 'SITTING', activity == 5 ~ 'STANDING', activity == 6 ~ 'LAYING' ))
#Summarizing data, Grouped and average all values
mean_std_grouped <- group_by(mean_std, activity, subject)
average <- summarise_all(mean_std_grouped, mean)
setwd("../")
write.table(average, file = 'tidydata.txt', row.names = TRUE)
