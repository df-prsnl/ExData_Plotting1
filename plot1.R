# reading the work data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# subsseting the data frame for the 2-day period specified
data <- subset(data,data$Date == "1/2/2007"|data$Date == "2/2/2007")

# converting the data to numeric class
x <- as.numeric(data[,"Global_active_power"])

# plotting the graph
hist(x,col="red",
                xlab = "Global Active Power (kilowatts)",
                main = "Global Active Power")


# saving it as a png file
dev.copy(png, file = "plot1.png",width = 480, height = 480)
dev.off()