con <- file("./household_power_consumption.txt","r")
data <- read.table(con, header = TRUE, sep = ";", na.strings = "?", stringsAsFactor = F) 
close(con)

data2 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
ts <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data2$Global_active_power)

png("plot2.png", width=480, height=480,units = "px")
plot(ts,globalActivePower, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()




