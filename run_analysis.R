#1  Merges the training and the test sets to create one data set.
#2  Extracts only the measurements on the mean and standard deviation for each measurement. 
#3  Uses descriptive activity names to name the activities in the data set
#4 Appropriately labels the data set with descriptive activity names. 
#5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#dir <- "C:/Users/jungle/Documents/R/gcdpa/UCI HAR Dataset"



rdata <- function(){
    
    dir <- getwd()
    dir <- paste(dir,"UCI HAR Dataset",sep="/")
    
    ftnam <- readLines(paste(dir,"features.txt",sep="/"))
    ftnam <- gsub("[0-9]|[[:space:]]", "", ftnam)
    alnam <-readLines(paste(dir,"activity_labels.txt",sep="/"))
    alnam <- gsub("[0-9]|[[:space:]]", "", alnam) #delete numbers and spaces
    
    
    sub<- readLines(paste(dir,"test/subject_test.txt",sep="/"))
    sub1<- as.numeric(sub)
    sub<- readLines(paste(dir,"train/subject_train.txt",sep="/"))
    sub2<- as.numeric(sub)
    subj <- c(sub1,sub2)
    
    
    fil <-paste(dir,"test/X_test.txt",sep="/")
    initial <- read.table(fil,nrows =10)
    classes <- sapply(initial,class)
    ft1 <- read.table(fil,colClasses = classes)
    fil <-paste(dir,"train/X_train.txt",sep="/")
    ft2 <- read.table(fil,colClasses = classes)
    ft <- rbind(ft1,ft2)
    
    
    
    
    al1<- readLines(paste(dir,"test/y_test.txt",sep="/"))  #character vector
    al2<- readLines(paste(dir,"train/y_train.txt",sep="/"))
    al<- gsub("[^1-6]", "", c(al1,al2))  #clean illegal character
    z <- as.numeric(al)
    for (i in seq_along(z)) {al[i] <- alnam[z[i]]}  #name the activities by names
    
    
    ans1 <-data.frame(subject = subj,activity =al)
    subset <-grep("mean|std",ftnam)  #find means and stds
    ans2 <-ft[,subset]
    colnames(ans2) <- ftnam[subset]
    
    ans <- cbind(ans1,ans2)
    
    library(reshape2)
    b <- melt(ans,id=c("activity","subject"))
    dcast(b,activity+ subject ~ variable,mean)
}
