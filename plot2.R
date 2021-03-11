#### Assuming that the data is in your working directory 
#### Reading in the data, selecting only the relevant rows. 

library(data.table)

colnames <- fread("household_power_consumption.txt",
                  nrow = 0)
data <- fread(
cmd  = "grep -E -w '1/2/2007|2/2/2007' household_power_consumption.txt",
              col.names = names(colnames), na.strings = "?")

#### Creating plot2
png("plot2.png")

plot(data$Global_active_power, type = "l",xaxt = "n", 
     ylab = "Global Active Power (kilowatts)", xlab ="")

axis(1, xaxp = c(0, 2880, 2), at = c(0, 1440, 2880), 
     labels = c("Thu", "Fri","Sat"))

dev.off()
