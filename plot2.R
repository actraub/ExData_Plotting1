# This is part of coursera exploring data class from John Hopkins.
# run setup to in this directory to download your data.

library(data.table)

plot2 <- function() {
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
   
     #plot 2
    png(file="plot2.png", width=480, height=480)
    
    #### turn into a factor based on the day of the week
    with (power, plot(Date2, as.numeric(Global_active_power), type="l", main ="Global Active Power", ylab="Global Active Power (kilowats)", lty = 1, xlab="" ) )
    # with (power, plot(Date, as.numeric(Global_active_power), type="l", main ="Global Active Power", ylab="Global Active Power (kilowats)", lty = 1, xlab="" ) )

    
    dev.off()
}