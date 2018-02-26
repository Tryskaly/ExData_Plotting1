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


png(file="plot4.png", width=480,  height=480)

par(mfrow = c(2, 2))

plot(d,as.numeric(as.character(selectedDays$Global_active_power)),type="l",ylab="Global Active Power", xlab="")

plot(d,as.numeric(as.character(selectedDays$Voltage)),type="l",ylab="Voltage", xlab="datetime")

plot(d, as.numeric(as.character(selectedDays$Sub_metering_1)),  type = "n", ylab="Energy sub metering", xlab="")
lines(d, as.numeric(as.character(selectedDays$Sub_metering_1)), col = "black")
lines(d, as.numeric(as.character(selectedDays$Sub_metering_2)), col = "red")
lines(d, as.numeric(as.character(selectedDays$Sub_metering_3)), col = "blue")
legend("topright", lty=c(1,1,1), cex=0.8, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

plot(d,as.numeric(as.character(selectedDays$Global_reactive_power)),type="l",ylab="Global_reactive_power", xlab="datetime")

dev.off()