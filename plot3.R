##plot3.r
##R file for Exploratory Analysis Project 1

library(sqldf) #the library is useful to select certain rows from a large dataset

filename<-"./exdata-data-household_power_consumption/household_power_consumption.txt"

##data for the required days 01/02/2007 and 02/02/2007
##careful with the date format

gapdata<-read.csv.sql(filename,sep=';',header=TRUE,sql = 'select * from file where Date ="1/2/2007" or Date = "2/2/2007"')

submtr1<-gapdata[,7]      ##extract just the 3 sub-metering data   
submtr2<-gapdata[,8]   
submtr3<-gapdata[,9]   

xaxisl<-c("Thur","Fri","Sat") #labels for the x-axis

par(mar=c(4,4.0,1.6,0.5))

##plot a blank plot without x-axis label
plot(submtr1,type="n", col="black",xaxt="n",xlab="",ylab="Energy Sub Metering")

points(submtr1,type="l", col="black") ##impose the three sub-metering plots
points(submtr2,type="l", col="red")
points(submtr3,type="l", col="blue")

axis(1, at=c(1,1441,2881),labels=xaxisl) #impose the x-axis labels at desired points

##write the legend

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pt.cex=0.8,cex=0.8,col=c("black","red","blue"),lwd=c(2.5,2.5,2.5))

dev.copy(png,'plot3.png',width = 609, height = 356) ##copy the plot to plot3.png file
dev.off()