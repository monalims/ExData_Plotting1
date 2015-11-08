##plot2.r
##R file for Exploratory Analysis Project 1

library(sqldf) #the library is useful to select certain rows from a large data

filename<-"./exdata-data-household_power_consumption/household_power_consumption.txt"

##data for the required days 01/02/2007 and 02/02/2007
##careful with the date format
gapdata<-read.csv.sql(filename,sep=';',header=TRUE,sql = 'select * from file where Date ="1/2/2007" or Date = "2/2/2007"')
gapval<-gapdata[,3]      ##gets only the global active power data  

xaxisl<-c("Thur","Fri","Sat") #labels for the x-axis

##plot the graph without x-axis labels
plot(gapval,type="l", col="black",xaxt="n", xlab="",ylab="Gloabl Active Power (kilowatts)")

axis(1, at=c(1,1441,2881),labels=xaxisl) #impose the necessary labels at desired points

dev.copy(png,'plot2.png') ##save the plot in the plot2.png file
dev.off()