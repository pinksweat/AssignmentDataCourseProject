

Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit\'87 degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws\
www.smartlab.ws\

======================================

The data in here was obtained from an experiment that used 30 volunteers within an age of 19-49. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, using a smartphone Samsung Galaxy S2

=========================================

Codebook

=========================================

1. In the first section of the code is used to download the data.
2. In the second section we use the unzip function to obtain the data.
3. We read the files obtained in UCI HAR Dataset and renamed

The dataset include the following files and the names that were assigned to it: 


- 'activity_labels.txt': Links the class labels with their activity name was named as activities
- 'features.txt': List of all features was named as features 
- 'train/X_train.txt': Training set was named as train x
-train/y_train.txt': Training labels was named a train y
- 'test/X_test.txt': Test set was named as test x 
- 'test/y_test.txt': Test labels was named as test y.

4. In the fourth section the columns V1 and V2 of the data frame activities were renamed to Code and Activity respectively. 

The columns V1 and V2 of the data frame features were renamed to Code and Functions.

5. In the fifth section we use the new names of the features data frame and transposed it. \
6. In the sixth section we used the names of the activity column in the features data frame and used it to rename the name of the columns of the trainx data frame \ later we rename the V1 column of the data frame trainy to Code.\
7. We use the names of the activity column in the features data frame an use it to rename the names of the columns of the testx then we rename the V1 column of the data frame testy to Code
8. In this section of the code the column V1 from the subjectrain and subject test data frames to subject. 
9. In this section the row bind function was used on the trainx and testx and a new data frame called train was created, the same was done with the trainy and testy data frames.
finally we use de function bind to merge all the data frames.
10. Use the function select to extract only the measurements that contain the mean and the standard deviation. 
11. Merge the data using the code column and created a new data frame called data2
12. The following changes to the name of the column variables were made: 

-'Acc' has been replaced to 'accelerometer'


-'Gyro' has been replaced to 'gyroscope'


-'BodyBody' has been replaced to  to 'body'

-'Mag' has been replaced  to 'magnitude'


-'^t' has been replaced  to 'time'


-'^f 'has been replaced to 'frequency'


-'-mean'has been replaced to 'mean'


-'-std()' has been replaced to  'STD'


-'-freq()'has been replaced to 'frequency '


-'angle' has been replaced to 'angle'


-'gravity" has been replaced to 'gravity'


13. Data3 was created using the data frame data2 and was grouped in subject and activity then the average of each variables.
14. 14. Creates a txt file

