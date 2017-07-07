## Load dataset and subset data (we only use data from 1/2/2007 - 2/2/2007)

File <- "C:/Users/blijnen/Documents/household_power_consumption.txt"
mydata<-read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selected_dates <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

## Plot 4

Days <- strptime(paste(selected_dates$Date, selected_dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(selected_dates$Global_active_power)
globalReactivePower <- as.numeric(selected_dates$Global_reactive_power)
voltage <- as.numeric(selected_dates$Voltage)
subMetering1 <- as.numeric(selected_dates$Sub_metering_1)
subMetering2 <- as.numeric(selected_dates$Sub_metering_2)
subMetering3 <- as.numeric(selected_dates$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(Days, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(Days, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(Days, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Days, subMetering2, type="l", col="red")
lines(Days, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(Days, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()