power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", colClasses = c('character', 'character', rep('numeric', 7)))
power$Date <- lapply(power$Date, function(x) as.Date(x, format = "%d/%m/%Y"))
power <- power[power$Date == as.Date('2007-02-01') | power$Date == as.Date('2007-02-02'),]

png(filename="plot2.png")

plot(power$Global_active_power, type="l", xaxt="n", ylab="Global Active Power (kilowatts)")
l <- length(power$Global_active_power)
axis(side = 1, at=c(0, l / 2, l), labels=c("Thu", "Fri", "Sat"))

dev.off()
