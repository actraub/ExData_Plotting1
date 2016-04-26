# This is part of coursera exploring data class from John Hopkins.
# run setup to in this directory to download your data.

library(data.table)

plot3 <- function() {
    #Read file
    loc <- "./data/household_power_consumption.txt"
    data <- read.csv(loc, header = TRUE, sep = ";", na.strings = "?")
    
    date1 <- as.Date("2007-02-01")
    date2 <- as.Date("2007-02-02")
  
    data <- na.omit (data)
    
    data$Date <- as.Date(data[,"Date"], format="%d/%m/%Y")
    
    #subset
    power <- data[data$Date >= date1 & data$Date <= date2, ]
    
    power$Date2 <- paste(power$Date, power$Time)
    power$Date2 <- as.POSIXlt(power$Date2, format ="%Y-%m-%d %H:%M:%S")
    
    #plot 3
    png(file="plot3.png", width=480, height=480)
    plot(power$Date2, power$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    points(power$Date2, power$Sub_metering_2, type = "l", col = "red")
    points(power$Date2, power$Sub_metering_3, type = "l", col = "blue")
    legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    dev.off()
    }