# put the download txt to the working directory

original_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses=c( Date="character", Time = "character", rep("numeric",7)))

original_data$Date1 = as.Date(original_data$Date, "%d/%m/%Y")

original_data$Date2 <- strptime(paste(original_data$Date, original_data$Time), "%d/%m/%Y %H:%M:%S")

new_data <- subset(original_data, Date1 == as.Date("2007-02-01", "%Y-%m-%d") | Date1 == as.Date("2007-02-02", "%Y-%m-%d"))

png(filename = "plot2.png",width = 480, height = 480)

plot(new_data$Date2, new_data$Global_active_power,type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()