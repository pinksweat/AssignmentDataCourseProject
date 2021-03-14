
Data: 

==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws





Codebook.md describe the variables and the data and the transformations that were made.



run_analysis contains the following transformantions to the data: 







# AssignmentDataCourseProject

1. The first part of the script deals with downloading the data and unziping the file
2. On the second part I rename the variables in order to make the merging more easy
3. Then I proceed to merge the data and create a new data set##
4. after that I Extract  only the measurements on the mean and standard deviation for each measurement using select function from dplyr
5. In the next part I use merge to match the descriptive activity to the names of the activities in the data set
6. Then I rename the column variables in my data set##
7 Finally I created a new data set with the average of each measurment in the data set
