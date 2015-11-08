##plot3.r
##R file for Exploratory Analysis Project 1
##plot 4 different plots on the same screen

library(sqldf) #the library is useful to select certain rows from a large dataset

filename<-"./exdata-data-household_power_consumption/household_power_consumption.txt"

##data for the required days 01/02/2007 and 02/02/2007
##careful with the date format
gapdata<-read.csv.sql(filename,sep=';',header=TRUE,sql = 'select * from file where Date ="1/2/2007" or Date = "2/2/2007"')

##extracts the required data in separate vectors

gapval<-gapdata[,3]   ##global active power     
voltval<-gapdata[,5]   ##voltage
grpval<-gapdata[,4]   ##reactive power

submtr1<-gapdata[,7] ##sub_metering data
submtr2<-gapdata[,8]
submtr3<-gapdata[,9]

xaxisl<-c("Thur","Fri","Sat") #labels for the x-axis 
par(mfrow=c(2,2)) ##divides the plot area into 2x2 areas
par(mar=c(3.8,4.0,1.6,1.3)) ##adjust the margins


##first plot(1,1) global active power variation over the two day period
plot(gapval,type="l", col="black",xaxt="n", xlab="",ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,1441,2881),labels=xaxisl)

##second plot(1,2) Voltage variation over the two day period

plot(voltval,type="l", col="black",xaxt="n", xlab="datetime",ylab="Voltage")
axis(1, at=c(1,1441,2881),labels=xaxisl)

##third plot(2,1) sub-metering variation over the two day period
plot(submtr1,type="n", col="black",xaxt="n",xlab="",ylab="Energy Sub Metering")
points(submtr1,type="l", col="black")
points(submtr2,type="l", col="red")
points(submtr3,type="l", col="blue")
axis(1, at=c(1,1441,2881),labels=xaxisl)
#legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pt.cex=0.6,cex=0.6,bty="n",col=c("black","red","blue"),lwd=c(2.5,2.5,2.5))
legend(x=1500,y=40, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pt.cex=0.6,cex=0.6,bty="n",col=c("black","red","blue"),lwd=c(2.5,2.5,2.5))

##fourth plot(2,2) Global reactive power variation over the two day period
plot(grpval,type="l", col="black",xaxt="n", xlab="datetime",ylab="Global_reactive_power")
axis(1, at=c(1,1441,2881),labels=xaxisl)


dev.copy(png,'plot4.png') ##copy the plot to the plot4.png file
dev.off()