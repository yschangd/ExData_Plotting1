con <- file("./household_power_consumption.txt","r")
data <- read.table(con, header = TRUE, sep = ";", na.strings = "?", stringsAsFactor = F) 
close(con)

data2 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]


## plot4.png
ts <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480,units = "px")
par(mfrow = c(2, 2),mar = c(5, 4, 1, 1))

globalActivePower <- as.numeric(data2$Global_active_power)
plot(ts,globalActivePower, type="l", xlab="",ylab="Global Active Power")

voltage <- as.numeric(data2$Voltage)
plot(ts,voltage, type="l", xlab="datetime",ylab="Voltage")

Sub_metering_1 <-as.numeric(data2$Sub_metering_1)
Sub_metering_2 <-as.numeric(data2$Sub_metering_2)
Sub_metering_3 <-as.numeric(data2$Sub_metering_3)
plot(ts,Sub_metering_1, type="l",col="gray",xlab="",ylab="Energy sub metering")
lines(ts,Sub_metering_2, type="l",col="red")
lines(ts,Sub_metering_3, type="l",col="blue")
legend("topright", lty=1, bty="n",col = c("gray", "red","blue"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

global_reactive_power <-as.numeric(data2$Global_reactive_power)
plot(ts,global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")

dev.off()

