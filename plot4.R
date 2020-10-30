power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", colClasses = c('character', 'character', rep('numeric', 7)))
power$Date <- lapply(power$Date, function(x) as.Date(x, format = "%d/%m/%Y"))
power <- power[power$Date == as.Date('2007-02-01') | power$Date == as.Date('2007-02-02'),]

png(filename="plot4.png")

par(mfrow=c(2,2))

plot(power$Global_active_power, type="l", xaxt="n", ylab="Global Active Power", xlab="")
l <- length(power$Global_active_power)
axis(side = 1, at=c(0, l / 2, l), labels=c("Thu", "Fri", "Sat"))

plot(power$Voltage, type="l", ylab="Voltage", xlab="datetime", xaxt="n")
axis(side = 1, at=c(0, l / 2, l), labels=c("Thu", "Fri", "Sat"))

plot(power$Sub_metering_1, type="l", xaxt="n", ylab="Energy sub metering", xlab="")
lines(power$Sub_metering_2, col="red")
lines(power$Sub_metering_3, col="blue")
legend(800,40, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "blue", "red"), lty=1, bty="n")
axis(side = 1, at=c(0, l / 2, l), labels=c("Thu", "Fri", "Sat"))

plot(power$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", xaxt="n")
axis(side = 1, at=c(0, l / 2, l), labels=c("Thu", "Fri", "Sat"))

dev.off()
