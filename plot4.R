# ensure the decompressed datafile is in the working directory - https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

library(dplyr);
library(lubridate);

# read file
data <- read.table(file="./household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# filter for the dates we want
data <- data %>% 
  filter(Date == "1/2/2007" | Date == "2/2/2007")

# concate date and time string and convert to date format
data$dateTime = dmy_hms(paste(data$Date, data$Time, sep=" "))


#set device
png(filename="plot4.png", width=480, height=480)

# set par - plots are displayed clockwise from top left
par(mfrow=c(2,2))

#create plot 1
plot(x=data$dateTime,
     y=data$Global_active_power,
     type='l',
     xlab="",
     ylab="Global Active Power")

#create plot 2
plot(x=data$dateTime,
     y=data$Voltage,
     type='l',
     xlab="datetime",
     ylab="Voltage")

#create plot 3
plot(x=data$dateTime, y=data$Sub_metering_1, type='l', xlab="", ylab="Energy Sub Metering")
lines(x=data$dateTime, y=data$Sub_metering_2, col="red")
lines(x=data$dateTime, y=data$Sub_metering_3, col="blue")
legend("topright", 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col=c('black', 'red', 'blue'),
       lty = 1,
       bty="n")

#create plot 4
plot(x=data$dateTime,
     y=data$Global_reactive_power,
     type='l',
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()

