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
png(filename="plot2.png", width=480, height=480)
plot(x=data$dateTime,
     y=data$Global_active_power,
     type='l',
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
