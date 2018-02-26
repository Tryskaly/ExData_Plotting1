library(lubridate)
rm(list=ls())

path <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(path, 'f.zip'); unzip('f.zip')

outcome <- read.table('household_power_consumption.txt',sep=";",header=TRUE)
outcome$Date <- as.character(outcome$Date)
outcome$Time <- as.character(outcome$Time)
firstDay <- subset(outcome, Date=="1/2/2007")
secondDay <- subset(outcome, Date=="2/2/2007")
selectedDays <- rbind(firstDay, secondDay)
rm(outcome,firstDay,secondDay)

finalDates <- paste(selectedDays$Date,selectedDays$Time)
d <- strptime(finalDates,"%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width=480,  height=480)

plot(d,as.numeric(as.character(selectedDays$Global_active_power)),type="l",ylab="Global Active Power (kilowatts)", xlab="")

dev.off()