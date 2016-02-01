##Install plyr package
> install.packages("plyr")
> library (plyr)

##Step 1 - Merges the training and the test sets to create one data set
> x_train <- read.table("C:/Users/carolina/Desktop/RStudio/UCI HAR Dataset/train/X_train.txt")
> y_train <- read.table("C:/Users/carolina/Desktop/RStudio/UCI HAR Dataset/train/y_train.txt")
> subject_train <- read.table("C:/Users/carolina/Desktop/RStudio/UCI HAR Dataset/train/subject_train.txt")

> x_test <- read.table ("C:/Users/carolina/Desktop/RStudio/UCI HAR Dataset/test/X_test.txt")
> y_test <- read.table ("C:/Users/carolina/Desktop/RStudio/UCI HAR Dataset/test/y_test.txt")
> subject_test <- read.table("C:/Users/carolina/Desktop/RStudio/UCI HAR Dataset/test/subject_test.txt")

> x_dataset <- rbind(x_train, x_test)
> y_dataset <- rbind(y_train, y_test)
> subject_dataset <- rbind(subject_train, subject_test)

##Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement
> features <- read.table("C:/Users/carolina/Desktop/RStudio/UCI HAR Dataset/features.txt")
> mean_std <- grep("-(mean|std)\\(\\)", features[, 2])
> x_dataset <- x_dataset[, mean_std]
> names(x_dataset) <- features[mean_std, 2]

##Step 3 - Uses descriptive activity names to name the activities in the data set
> activ <- read.table("C:/Users/carolina/Desktop/RStudio/UCI HAR Dataset/activity_labels.txt")
> y_dataset[, 1] <- activ[y_dataset[, 1], 2]

##Step 4 - Appropriately labels the data set with descriptive variable names
> names(y_dataset) <- "activity"
> names(subject_dataset) <- "subject"

##Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
> allData <- cbind(x_dataset, y_dataset, subject_dataset)

> averages <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))
##ddply() is a function from the plyr package

> write.table(averages, "averages_data.txt", row.name=FALSE)

