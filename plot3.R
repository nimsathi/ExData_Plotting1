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

#create plot and save to file
png(filename="plot3.png", width=480, height=480)
plot(x=data$dateTime, y=data$Sub_metering_1, type='l', xlab="", ylab="Energy Sub Metering")
lines(x=data$dateTime, y=data$Sub_metering_2, col="red")
lines(x=data$dateTime, y=data$Sub_metering_3, col="blue")
legend("topright", 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col=c('black', 'red', 'blue'),
       lty = 1)
dev.off()
