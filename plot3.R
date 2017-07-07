## Load dataset and subset data (we only use data from 1/2/2007 - 2/2/2007)

File <- "C:/Users/blijnen/Documents/household_power_consumption.txt"
mydata<-read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selected_dates <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot 3
Days <- strptime(paste(selected_dates$Date, selected_dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(selected_dates$Data$Global_active_power)
subMetering1 <- as.numeric(selected_dates$Sub_metering_1)
subMetering2 <- as.numeric(selected_dates$Sub_metering_2)
subMetering3 <- as.numeric(selected_dates$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(Days, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Days, subMetering2, type="l", col="red")
lines(Days, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()