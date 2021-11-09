---
  output: html_document
---
  #plot1.R
  #PLOT1
  #I used examples and code from the follwoing to complete/understand this work
  #https://rpubs.com/gibrahim/162988 a
  #https://rstudio-pubs-static.s3.amazonaws.com/515518_cf910f526408464ca5a39c6751431f86.html
  
  #I pulled down the GitHub, but it kept coming up empty for me, so I just loaded the file. Pain
  #reading in the entire dataset
  #skip/delete the fist row
  #defines the seperator as ;
  power <- read.table("household_power_consumption.txt",skip=1, ,sep=";")
  
  #rename variables in the .txt file via vector subject to names on coursera
  names (power) <- names(power) <- c("Date","Time","Global_active_power",
                                     "Global_reactive_power", "Voltage",
                                     "Global_intensity","Sub_metering_1",
                                     "Sub_metering_2","Sub_metering_3")
  
  #Want to subset the dataset only to dates 2007-02-01 and 2007-02-02
  subpower <- subset (power, power$Date=="1/2/2007" | power$Date =="2/2/2007")
  
  #start the plot
  #need to convert from character to numeric
  hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
  #Setting pixels for png file
  png("plot1.png", width=480, height=480)
  