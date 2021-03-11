#### Assuming that the data is in your working directory 
#### Reading in the data, selecting only the relevant rows. 

library(data.table)

colnames <- fread("household_power_consumption.txt",
                  nrow = 0)
data <- fread(
        cmd  = "grep -E -w '1/2/2007|2/2/2007' household_power_consumption.txt",
              col.names = names(colnames), na.strings = "?")

## plot1

png("plot1.png")
hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()
