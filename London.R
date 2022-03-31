# Q1 Read dataset to dataframe
#    called london_crime

london_crime <- read.csv("london-crime-data.csv", na = "")
london_crime

# adding a new attribute day to dataframe 
# for as.Date function to work
london_crime$day <- NA
london_crime

# Showing structure of london_crime dataframe
str(london_crime)

?paste
?as.Date

# using the paste() function 
# to amalgamate the year, month and day elements
# Saving the the amalgamated elements to new variable
# Date
Date <- paste(london_crime$month, london_crime$day, london_crime$year, sep = "/")
Date

# Adding the new variable Date to dataframe
london_crime$Date <- Date 
london_crime
str(london_crime) # showing structure of dataframe

# Q2 Converting the variable names borough to Borough, 
#    Major_category to MajorCategory, Minor_Category to SubCategory,
#    value to Value
#    Date to CrimeDate
names(london_crime)
names(london_crime)[2] <- "Borough"
names(london_crime)[3] <- "MajorCategory"
names(london_crime)[4] <- "SubCategory"
names(london_crime)[5] <- "Value"
names(london_crime)[9] <- "CrimeDate"
names(london_crime)

# extracting only the desirable variables
# as shown in the question
london_crime <- subset(london_crime, select = c(Borough, 
                                                    MajorCategory,
                                                    SubCategory,
                                                    Value,
                                                    CrimeDate))
london_crime

# Q3 Converting CrimeDate variable to Date type
# from char type
london_crime$CrimeDate <- as.Date(london_crime$CrimeDate, "%m-%d-%Y")
london_crime
str(london_crime)

# Q4 showing summary of borough information
#    then plotting chart to display this data

summary(london_crime$Borough)
?summary

# Q5 showing summary of variable
#    MajorCategory
summary(london_crime$MajorCategory)
par(opar)

opar <- par(no.readonly = TRUE)
par(mfrow = c(2,2))
slices <- london_crime$Value
labls <- london_crime$MajorCategory
pie(slices, labels = labls, main = "MajorCategory variable data")
par(opar)


