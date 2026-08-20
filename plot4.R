# reading the work data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# subsetting the data frame for the 2-day period specified
data <- subset(data,data$Date == "1/2/2007"|data$Date == "2/2/2007")

# handling date values
datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

##########

# querying graphical parameters
par(mfcol = c(2,2))

##########

##########
# graph [1,1]
##########

# converting the data to numeric class
globalActivePower <- as.numeric(data$Global_active_power)

# plotting the graph
plot(datetime,globalActivePower, type = "l",
     xlab = "", ylab = "Global Active Power",
     xaxt = "n")

# setting the dates at x-axis as weekdays
ticks <- as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03"))
axis(1, at = ticks, labels = c("Thu", "Fri", "Sat"))

##########
# graph [2,1]
##########

# converting the data to numeric class
Sub1 <- as.numeric(data$Sub_metering_1)
Sub2 <- as.numeric(data$Sub_metering_2)
Sub3 <- as.numeric(data$Sub_metering_3)

# plotting the graph
plot(datetime,Sub1, type = "l",
     xlab = "", ylab = "Energy sub metering",
     xaxt = "n")
lines(datetime,Sub2, col = "red")
lines(datetime,Sub3, col= "blue")

# setting the dates at x-axis as weekdays
ticks <- as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03"))
axis(1, at = ticks, labels = c("Thu", "Fri", "Sat"))

# putting the legend
legend("topright",col = c("black","red", "blue"),lty=c(1,1,1),bty="n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##########
# graph [1,2]
##########

# converting the data to numeric class
nVoltage <- as.numeric(data$Voltage)

# plotting the graph
plot(datetime,nVoltage, type = "l",
     xlab = "datetime",
     ylab = "Voltage",
     xaxt = "n")

# setting the dates at x-axis as weekdays
ticks <- as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03"))
axis(1, at = ticks, labels = c("Thu", "Fri", "Sat"))

##########
# graph [2,2]
##########

# converting the data to numeric class
globalReactivePower <- as.numeric(data$Global_reactive_power)

# plotting the graph
plot(datetime,globalReactivePower, type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power",
     xaxt = "n")

# setting the dates at x-axis as weekdays
ticks <- as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03"))
axis(1, at = ticks, labels = c("Thu", "Fri", "Sat"))

##########

# saving it as a png file
dev.copy(png, file = "plot4.png",width = 480, height = 480)
dev.off()