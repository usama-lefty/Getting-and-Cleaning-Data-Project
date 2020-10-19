# CodeBook

1. **Data Variables**
+ features <- features.txt  
Features calculated from gyroscope and accelorometer 3 axial data.  
+ activity_labels <- activity_labels.txt  
Lables of activities and their corresponding names  
+ subject_train <- train/subject_train.txt  
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
+ x_train <- train/X_train.txt  
Train data  
+ y_train <- train/Y_train.txt  
Train labels
+ x_test <- test/X_test.txt  
Test data  
+ y_train <- test/Y_test.txt  
Test labels

2. **Mergin Data**  
+ x_train and x_test are merged into x using rbind()  
+ y_train and y_test are merged into y using rbind()
+ subject_train and subject_test are merged into subject using rbind()
+ subject, y and x are merged into Data_Tidy using cbind()  

3. **Extraction of Mean and SD**
+ Only mean and standard deviation are extracted from Data_Tidy using select() function from dplyr package.

4. **Using descriptive activity names to name the activities in the data set**
+ Replace the column "label" in Data_Tidy with corresponding labels in activity_labels dataset.

5. **Appropriately label the data set with descriptive variable names**
+ Use the fucntion gsub()
+ Rename "label" to Activity
+ Replace "t" and "f" at the start of every variable with Time and Frequency
+ Replace "Acc", "Gyro" and "Mag" with Acceleration, Gyroscope and Magnitude
+ Replace "tbody" with TimeBody
+ Replace "BodyBody" with Body
+ Capitalize "anlge" and "gravity"

6. **Summarize Final Dataset**
+ Use group_by() to group Data_Tidy by "subject_id" and "Activity"
+ Take the mean of all variables of grouped dataset and save into Data_Final
+ Save Data_Final as Data_Final.txt
