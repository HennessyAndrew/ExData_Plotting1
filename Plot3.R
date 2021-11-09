#plot3.R
#Plot3 
#I used examples and code from the follwoing to complete/understand this work
#https://rpubs.com/gibrahim/162988 a
#https://rstudio-pubs-static.s3.amazonaws.com/515518_cf910f526408464ca5a39c6751431f86.html

#read in file again, skipping first row etc
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
# name variables subject to what they say on coursera
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#subsets data to just date range as said on coursera
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")

# calling the basic plot functions
plot(subpower$Time,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")
