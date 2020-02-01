require(data.table)
# Setting locale for english rather than local(Russian or other) weekdays
Sys.setlocale(category = "LC_ALL", locale = "english")

# Loading data
f <- "household_power_consumption.txt"
dd <- read.table(file = f, sep = ";", na.strings = "?",header = TRUE)
dd$Time <- strptime(paste(dd$Date, dd$Time, sep = " "), "%d/%m/%Y %H:%M:%S",tz = "UTC")
dd$Date <- as.Date(dd$Date, format="%d/%m/%Y")
# Filtering out all dates except 2007-02-01 and 2007-02-02
r <- dd[dd$Date == as.Date("2007-02-01", "%Y-%m-%d") | dd$Date == as.Date("2007-02-02", "%Y-%m-%d") ,]

### plot3
png(filename = "figure/plot3.png" ,width = 480,height = 480 )
plot(r$Time,r$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(r$Time,r$Sub_metering_2, col = "red")
lines(r$Time,r$Sub_metering_3, col = "blue")
legend("topright",lty = 1, col = c("black", "blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
