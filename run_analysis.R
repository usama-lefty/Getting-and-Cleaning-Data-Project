library(dplyr)



features <- read.table("Data/UCI HAR Dataset/features.txt",col.names = c("n","feature"))
activity_labels <- read.table("Data/UCI HAR Dataset/activity_labels.txt",col.names = c("label","activity"))
subject_train <- read.table("Data/UCI HAR Dataset/train/subject_train.txt",col.names = "subject_id")
x_train <- read.table("Data/UCI HAR Dataset/train/X_train.txt",col.names = features$feature)
y_train <- read.table("Data/UCI HAR Dataset/train/Y_train.txt",col.names = "label")

x_test <- read.table("Data/UCI HAR Dataset/test/X_test.txt",col.names = features$feature)
y_test <- read.table("Data/UCI HAR Dataset/test/Y_test.txt",col.names = "label")
subject_test <- read.table("Data/UCI HAR Dataset/test/subject_test.txt",col.names = "subject_id")

x <- rbind(x_train,x_test)
y <- rbind(y_train,y_test)
subject <-rbind(subject_train,subject_test)

Data_Tidy <- cbind(subject,y,x)

Data_Tidy <- select(Data_Tidy,subject_id,label,contains("mean"),contains("std"))

Data_Tidy$label <- activity_labels[Data_Tidy$label,2]
names(Data_Tidy)[2] <- "Activity"

names(Data_Tidy) <- gsub("^t","Time",names(Data_Tidy))
names(Data_Tidy) <- gsub('^f',"Frequency",names(Data_Tidy))
names(Data_Tidy) <- gsub('Acc',"Acceleration",names(Data_Tidy))
names(Data_Tidy) <- gsub('Gyro',"Gyroscope",names(Data_Tidy))
names(Data_Tidy) <- gsub('Mag',"Magnitude",names(Data_Tidy))
names(Data_Tidy) <- gsub('-freq()',"Frequency",names(Data_Tidy),ignore.case = TRUE)
names(Data_Tidy) <- gsub('-mean()',"Mean",names(Data_Tidy),ignore.case = TRUE)
names(Data_Tidy)<-gsub("tBody", "TimeBody", names(Data_Tidy))
names(Data_Tidy) <- gsub('BodyBody',"Body",names(Data_Tidy))
names(Data_Tidy) <- gsub('angle',"Angle",names(Data_Tidy))
names(Data_Tidy) <- gsub('gravity',"Gravity",names(Data_Tidy))

Data_Final <- summarize_all(group_by(Data_Tidy,subject_id,Activity),mean)

write.table(Data_Final,"Data/Data_Final.txt",row.names = FALSE)


