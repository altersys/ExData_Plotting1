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

### plot1
png(filename = "plot1.png" ,width = 480,height = 480 )
hist(r$Global_active_power,col = "RED",xlab = "Global Active Power (Kilowatts)",main = "Global Active Power")
dev.off()
