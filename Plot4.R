
setwd("H:\\Personal\\Continuing Education\\Data Scientist Specialization\\Exploratory Data Analysis\\Assignments")

#unzip the files

unzip(zipfile="./exdata%2Fdata%2Fhousehold_power_consumption.zip",exdir=".")##unzip files in the same working directory

## read the datset
electric<-read.table(".//household_power_consumption.txt", sep=";", header=T)
electric$DateTime<-as.POSIXct(paste(electric$Date,electric$Time),format="%d/%m/%Y %H:%M:%S")
electric<-subset(electric, DateTime>="2007-02-01 00:00:00" & DateTime<="2007-02-02 23:59:59" ) #subset for required dates

png("./plot4.png")
par(mfrow=c(2,2))
plot(y=as.numeric(as.character(electric$Global_active_power)),x=electric$DateTime,type="l",
     xlab="",ylab="Global Active Power")
plot(y=as.numeric(as.character(electric$Voltage)),x=electric$DateTime,type="l",
     xlab="datetime",ylab="Voltage")
plot(y=as.numeric(as.character(electric$Sub_metering_1)),x=electric$DateTime,type="l",
     xlab="",ylab="Energy sub metering")
lines(y=as.numeric(as.character(electric$Sub_metering_2)),x=electric$DateTime,type="l",col="red",
      xlab="",ylab="Energy sub metering")
lines(y=as.numeric(as.character(electric$Sub_metering_3)),x=electric$DateTime,type="l",col="blue",
      xlab="",ylab="Energy sub metering")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"),bty="n")
plot(y=as.numeric(as.character(electric$Global_reactive_power)),x=electric$DateTime,type="l",
     xlab="",ylab="Global_reactive_power")
dev.off()


