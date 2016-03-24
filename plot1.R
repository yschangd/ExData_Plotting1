con <- file("./household_power_consumption.txt","r")
data <- read.table(con, header = TRUE, sep = ";", na.strings = "?", stringsAsFactor = F) 
close(con)

data2 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## plot1.png
png(file = "plot1.png",  width = 480, height = 480,units = "px")
hist(data2$Global_active_power, col="red", main="Global Active Power",
     xlab = "Global active power(kilowatts)")
dev.off()

