power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", colClasses = c('character', 'character', rep('numeric', 7)))
power$Date <- lapply(power$Date, function(x) as.Date(x, format = "%d/%m/%Y"))

power <- power[power$Date == as.Date('2007-02-01') | power$Date == as.Date('2007-02-02'),]

png(filename="plot1.png")
hist(power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
