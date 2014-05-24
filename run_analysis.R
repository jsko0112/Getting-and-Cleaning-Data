# Variables
data.file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
ori.data.file <- './original-dataset.zip'
ori.data.dir <- './UCI HAR Dataset'
tidy.data.file <- './tidy-UCI-HAR-dataset.csv'
tidy.avgs.data.file <- './tidy-UCI-HAR-average-dataset.csv'

# Check that original data file exists in the working directory
if (! file.exists(ori.data.file)) {
    download.file(data.file.url, destfile = ori.data.file)
}

# Check download and Uncompress the data file
if (! file.exists(ori.data.file)) {
  stop(paste(ori.data.file, 'does not exist in the working directory.'))
}else{
  if (! file.exists(ori.data.dir)) {
    unzip(ori.data.file)
  }
}

# Check uncompress
if (! file.exists(ori.data.dir)) {
  stop(paste(ori.data.file, 'is not created. Unzip Error!! '))
}

# Read activity labels
acts <- read.table(paste(ori.data.dir, 'activity_labels.txt', sep = '/'),header = FALSE)
names(acts) <- c('id', 'name')

# Read feature labels
feats <- read.table(paste(ori.data.dir, 'features.txt', sep = '/'), header = FALSE)
names(feats) <- c('id', 'name')

# Read the train data files and assign column names
X_train <- read.table(paste(ori.data.dir, 'train', 'X_train.txt', sep = '/'), header = FALSE)
names(X_train) <- feats$name 

y_train <- read.table(paste(ori.data.dir, 'train', 'y_train.txt', sep = '/'), header = FALSE)
names(y_train) <- c('activity')

s_train <- read.table(paste(ori.data.dir, 'train', 'subject_train.txt', sep = '/'), header = FALSE)
names(s_train) <- c('subject')

# Read the test data files and assign column names
X_test <- read.table(paste(ori.data.dir, 'test', 'X_test.txt', sep = '/'), header = FALSE)
names(X_test) <- feats$name

y_test <- read.table(paste(ori.data.dir, 'test', 'y_test.txt', sep = '/'), header = FALSE)
names(y_test) <- c('activity')

s_test <- read.table(paste(ori.data.dir, 'test', 'subject_test.txt', sep = '/'),header = FALSE)
names(s_test) <- c('subject')

# 1. Merges the training and the test sets to create one data set.
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
s <- rbind(s_train, s_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
X <- X[, grep('mean|std', feats$name)]

# 3. Uses descriptive activity names to name the activities in the data set
y$activity <- acts[y$activity,]$name

# 4. Appropriately labels the data set with descriptive activity names.
tidy.data.set <- cbind(s, y, X)
write.csv(tidy.data.set, tidy.data.file)

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
tidy.avgs.data.set <- aggregate(tidy.data.set[, 3:dim(tidy.data.set)[2]],
                                list(tidy.data.set$subject,
                                     tidy.data.set$activity),
                                mean)
names(tidy.avgs.data.set)[1:2] <- c('subject', 'activity')

write.csv(tidy.avgs.data.set, tidy.avgs.data.file)
