power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", stringsAsFactors = FALSE)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power <- subset(power, Date %in% as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y"))
power$datetime <- as.POSIXct(paste(power$Date, power$Time))

png(filename="plot3.png")

plot(power$Sub_metering_1~power$datetime, type="l", ylab="Energy sub metering")
lines(power$Sub_metering_2~power$datetime, col="red")
lines(power$Sub_metering_3~power$datetime, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "blue", "red"), lty=1)

dev.off()


