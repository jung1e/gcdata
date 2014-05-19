

To run the script, please make sure to
--------------------------------------
> - unzip the zip file
> - put the folder named "UCI HAR Dataset" under the work dictionary.


Then put **"run_analysis.R"** under the work dictionary
Run **source("run_analysis.R")** in R console
The function **rdata()** will return a tidy data set as required
Please wait about 10 to 20 second when running **rdata()**


What the rdata() function performed to clean up data:
---------

 1. > - read the "features.txt" and remove the numbers and space
 2. > - read the "activity_labels.txt" and remove the numbers and space
 3. > - combine the datas in "test/subject_test.txt" and "train/subject_train.txt", name as "subj", and turn subj into
    numeric type
 4. > - combine the datas in "test/X_test.txt" and "train/X_train.txt", name as "ft", which is the most time-consuming step
 5. > - combine the datas in "test/y_test.txt" and "train/y_train.txt", name as "al", and substitute the number with
    what activity it represents
 6. > - use subj and al to form a data frame called "ans1" ,whose colnames are "subject" and "activity"
 7. > - subset the mean and std variables from ft   if one variable with name containing "mean"("std"), consider it as a mean(std)
    variable
 8. > - put the subseted data into a data frame called "ans2", and set the colnames
 9. > - combine the ans1 and ans2 as "ans"
 10. > - load the reshape2 package and dcast ans into the tidy data set as required

