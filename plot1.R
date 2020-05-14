# ensure the decompressed datafile is in the working directory - https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

library(dplyr);

# read file
data <- read.table(file="./household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# filter for the dates we want
data <- data %>% 
  filter(Date == "1/2/2007" | Date == "2/2/2007")


#create histogram and save to file
png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()
