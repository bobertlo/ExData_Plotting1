power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", stringsAsFactors = FALSE)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power <- subset(power, Date %in% as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y"))
power$datetime <- as.POSIXct(paste(power$Date, power$Time))

png(filename="plot1.png")
hist(power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
