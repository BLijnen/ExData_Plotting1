## Load dataset and subset data (we only use data from 1/2/2007 - 2/2/2007)

File <- "C:/Users/blijnen/Documents/household_power_consumption.txt"
mydata<-read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selected_dates <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot 1
globalActivePower <- as.numeric(selected_dates$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()