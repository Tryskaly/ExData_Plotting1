library(lubridate)
library(datasets)

rm(list=ls())

path <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(path, 'f.zip'); unzip('f.zip')

outcome <- read.table('household_power_consumption.txt',sep=";",header=TRUE)
outcome$Date <- as.Date(as.character(outcome$Date), "%d/%m/%Y")
firstDay <- subset(outcome, Date==as.Date("2007-02-01"))
secondDay <- subset(outcome, Date==as.Date("2007-02-02"))
selectedDays <- rbind(firstDay, secondDay)
rm(outcome,firstDay,secondDay)

png(file="plot1.png", width=480,  height=480)

with(selectedDays,hist(as.numeric(as.character(Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))

dev.off()