
setwd("H:\\Personal\\Continuing Education\\Data Scientist Specialization\\Exploratory Data Analysis\\Assignments")

#unzip the files

unzip(zipfile="./exdata%2Fdata%2Fhousehold_power_consumption.zip",exdir=".")##unzip files in the same working directory

## read the datset
electric<-read.table(".//household_power_consumption.txt", sep=";", header=T)
electric$DateTime<-as.POSIXct(paste(electric$Date,electric$Time),format="%d/%m/%Y %H:%M:%S")
electric<-subset(electric, DateTime>="2007-02-01 00:00:00" & DateTime<="2007-02-02 23:59:59" ) #subset for required dates

png("./plot2.png")
plot(y=as.numeric(as.character(electric$Global_active_power)),x=electric$DateTime,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
dev.off()



