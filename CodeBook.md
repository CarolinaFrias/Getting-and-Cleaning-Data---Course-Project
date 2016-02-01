#An overall description
This R code uses the "plyr" package (implement the split-apply-combine in R). 

Step 1 - Uses rbind() to merge the data of "train" and "test" folders

Step 2 - Uses grep() to extract only the mean and standard deviation from each measure, using also the data from features.txt.

Step 3 - Uses the data on activities_labels.txt to give appropriate activities names to the dataset

Step 4 - Labels the y_dataset and subject_dataset as "activity" and "subject"

Step 5 - Uses cbind() to merge x_dataset, y_dataset and subject_dataset in only one dataset. Uses ddply() function (from de plyr package) to apply the mean in each variable from each activity and subject

The tidy data of Step 5 is store in "averages_data.txt"

#Variables
* x_train, y_train and subject_train contain the data from the folder "train"

* x_test, y_test and subject_test contain the data from de folder "test"

* x_dataset, y_dataset and subject_dataset contain the merged data as asked in step 1

* features contain the right names for x_dataset

* mean_std is the selection of data with only mean and standard deviation for each measure as asked in step

* activ contain the right activities names for y_dataset

* allData merges x_dataset, y_dataset and subject_dataset

* averages contains the average for each variable, activity and subject 

