con <- file("./household_power_consumption.txt","r")
data <- read.table(con, header = TRUE, sep = ";", na.strings = "?", stringsAsFactor = F) 
close(con)

data2 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
ts <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Sub_metering_1 <-as.numeric(data2$Sub_metering_1)
Sub_metering_2 <-as.numeric(data2$Sub_metering_2)
Sub_metering_3 <-as.numeric(data2$Sub_metering_3)

#par(mfrow = c(1, 1))

png("plot3.png", width=480, height=480,units = "px")
plot(ts,Sub_metering_1, type="l",col="black",xlab="",ylab="Energy sub metering")
lines(ts,Sub_metering_2, type="l",col="red")
lines(ts,Sub_metering_3, type="l",col="blue")
legend("topright", lty=1,col = c("black", "red","blue"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()




