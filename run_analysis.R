#Loading and normalizing name features
#Assumptions: normalize column names, prefixing with original position in the raw dataset in order to have a link to raw in downstream analysis

features <- readLines("features.txt")
features <- tolower(features)
features <- gsub(features, pattern="[() -]", replacement="")
features <- gsub(features, pattern=",", replacement="p")

#Loading data
x_test <- read.table("test/X_test.txt", col.names=features)
y_test <- read.table("test/y_test.txt", col.names=c("activity"))
subject_test <- read.table("test/subject_test.txt", col.names=c("subject"))

x_test$activity <- y_test$activity
x_test$subject <- subject_test$subject

x_train <- read.table("train/X_train.txt", col.names=features)
y_train <- read.table("train/y_train.txt", col.names=c("activity"))
subject_train <- read.table("train/subject_train.txt", col.names=c("subject"))

x_train$activity <- y_train$activity
x_train$subject <- subject_train$subject

#Merge the two data sets and join activities label
activities <- read.table("activity_labels.txt", col.names=c("activity", "activitylabel"))
tmpdata <- rbind(x_test, x_train)
data <- merge(tmpdata, activities)

#Include only std and mean columns as per assignment description plus labelled activities and subjects col. 563 564
tidycols <- c(grep(pattern="mean|std", colnames(data)), 563:564)
tidydata <- data[, tidycols]

#Aggregate by subjects and activity and output table to file
tidyout <- aggregate(tidydata[, -88:-87], by=list(tidydata$subject, tidydata$activitylabel), mean)
#Label the output groups field name
names(tidyout)[1:2] <- c("subjectid", "activitydescription")
names(tidyout) <- tolower(names(tidyout))



write.table(file = "datatidy.txt", tidyout, row.names=F)

