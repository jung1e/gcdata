Codebook
========

There are 81 variables in the final tidy data set, the first two named **activity** and **subject**

activity         

 - String. Identifies which activity that subject performed

subject          

 - numeric. No. of subject

The next 79 variables like "tBodyAccJerk-mean()-X","fBodyGyroMag-std()-Y" are the same as the descreption in **features_info.txt**, but the value is the average for each activity and each subject

a brief description of variable names is as follows 

 - **t**:  derived by time
 - **f**:  applied by Fast Fourier Transform
 - **BodyAcc**: body acceleration
 - **GravityAcc**: gravity acceleration
 - **Gyro**: from gyroscope
 - **Jerk**:  Jerk signals
 - **Mag**: magnitude calculated using the Euclidean norm
 - **mean()**:  Mean value
 - **std()**: Standard deviation
 -  **-X-Y-Z**: the axials

