# reading the work data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# subsetting the data frame for the 2-day period specified
data <- subset(data,data$Date == "1/2/2007"|data$Date == "2/2/2007")

# handling date values
datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# converting the data to numeric class
globalActivePower <- as.numeric(data$Global_active_power)

# plotting the graph
plot(datetime,globalActivePower, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)",
     xaxt = "n")

# setting the dates at x-axis as weekdays
ticks <- as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03"))
axis(1, at = ticks, labels = c("Thu", "Fri", "Sat"))

# saving it as a png file
dev.copy(png, file = "plot2.png",width = 480, height = 480)
dev.off()