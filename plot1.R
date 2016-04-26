# This is part of coursera exploring data class from John Hopkins.
# run setup to in this directory to download your data.

library(data.table)

plot1 <- function() {
    #Read file
    loc <- "./data/household_power_consumption.txt"
    data <- read.csv(loc, header = TRUE, sep = ";", na.strings = "?")
    
    date1 <- as.Date("2007-02-01")
    date2 <- as.Date("2007-02-02")
    # strptime() 
    # as.Date()
    
    data <- na.omit (data) 
    # convert dats in Date object
    data$Date <- as.Date(data[,"Date"], format="%d/%m/%Y")
    
    # subset the data to the appropertiate date
    power <- data[data$Date >= date1 & data$Date <= date2, ]
    png(file="plot1.png", width=480, height=480)
    #plot 1
    hist(as.numeric(power$Global_active_power), col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)" )
    dev.off()
}
