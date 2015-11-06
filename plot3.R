# put the download txt to the working directory

original_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses=c( Date="character", Time = "character", rep("numeric",7)))

original_data$Date1 = as.Date(original_data$Date, "%d/%m/%Y")

original_data$Date2 <- strptime(paste(original_data$Date, original_data$Time), "%d/%m/%Y %H:%M:%S")

new_data <- subset(original_data, Date1 == as.Date("2007-02-01", "%Y-%m-%d") | Date1 == as.Date("2007-02-02", "%Y-%m-%d"))


png(filename = "plot3.png",width = 480, height = 480)

plot(new_data$Date2, new_data$Sub_metering_1,type="l", xlab = "", ylab = "Energy Sub Merging")

lines(new_data$Date2, new_data$Sub_metering_2, type="l", col="red")

lines(new_data$Date2, new_data$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2 , col=c("black", "red", "blue"))

dev.off()