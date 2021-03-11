#### Assuming that the data is in your working directory 
#### Reading in the data, selecting only the relevant rows. 

library(data.table)

colnames <- fread("household_power_consumption.txt",
                  nrow = 0)

data <- fread(
        cmd  = "grep -E -w '1/2/2007|2/2/2007' household_power_consumption.txt",
              col.names = names(colnames), na.strings = "?")

#### Creating plot4
png("plot4.png")

par(mfrow=c(2,2))

plot(data$Global_active_power, type = "l",xaxt = "n", 
     ylab = "Global Active Power (kilowatts)", xlab ="")

axis(1, xaxp = c(0, 2880, 2), at = c(0, 1440, 2880), 
     labels = c("Thu", "Fri","Sat"))

plot(data$Voltage, type = "l",xaxt = "n", ylab = "Global Active Power", 
     xlab ="datetime")

axis(1, xaxp = c(0, 2880, 2), at = c(0, 1440, 2880), 
     labels = c("Thu", "Fri","Sat"))

plot(data$Sub_metering_1, type = "l", xaxt = "n", 
     ylab = "Energy sub metering", xlab ="")

axis(1, xaxp = c(0, 2880, 2), at = c(0, 1440, 2880), 
     labels = c("Thu", "Fri","Sat"))

lines(data$Sub_metering_2, col = "red")

lines(data$Sub_metering_3, col = "blue")

legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red","blue"),bty = "n")

plot(data$Global_reactive_power, type = "l",xaxt = "n", 
     ylab = "Global_Reactive_Power", xlab ="datetime")

axis(1, xaxp = c(0, 2880, 2), at = c(0, 1440, 2880), 
     labels = c("Thu", "Fri","Sat"))
dev.off()