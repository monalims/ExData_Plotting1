##plot1.r
##R file for Exploratory Analysis Project 1

##This code will load the necessary data into r and plot the first histogram of Global Active power

library(sqldf) #the library is useful to select certain rows from a large data

filename<-"./exdata-data-household_power_consumption/household_power_consumption.txt"

##data for the required days 01/02/2007 and 02/02/2007
##careful with the date format
gapdata<-read.csv.sql(filename,sep=';',header=TRUE,sql = 'select * from file where Date ="1/2/2007" or Date = "2/2/2007"')

gapval<-gapdata[,3]  ##extract just the global active power

##plot histogram
hist(gapval,col="red",main="Global Active Power",xlab="Gloabl Active Power (kilowatts)")

dev.copy(png,'plot1.png') ##copy the plot to the plot1.png file
dev.off()