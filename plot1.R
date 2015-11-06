# put the download txt to the working directory

original_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses=c( Date="character", Time = "character", rep("numeric",7)))

original_data$Date1 = as.Date(original_data$Date, "%d/%m/%Y")

new_data <- subset(original_data, Date1 == as.Date("2007-02-01", "%Y-%m-%d") | Date1 == as.Date("2007-02-02", "%Y-%m-%d"))

png(filename = "plot1.png",width = 480, height = 480)

hist(new_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()