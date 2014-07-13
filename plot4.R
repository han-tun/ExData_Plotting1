# Exploratory data analysis
# Course project 1
# Plot 4

setwd("~/Copy/Michael/training/Coursera_datascience/ExplDataAnal/Project1/ExData_Plotting1")

# Read data
data = read.csv("../household_power_consumption.txt", sep=";", na.strings="?", skip=66637, nrows=2879, header=F)
# Add column names
colnames(data) = read.csv("../household_power_consumption.txt", sep=";", nrows=1, header=F, stringsAsFactors=F)
# Tidy data
data$Date = as.Date(data$Date, format="%d/%m/%Y")
data$Time = as.POSIXct(strptime(paste0(data$Date, " ", data$Time), format="%Y-%m-%d %H:%M:%S"))

# Plot 4: histogram of global active power
png("./figure/plot4.png", height=480, width=480,  bg="transparent")
par(mfrow=c(2,2))
# top left
plot(Global_active_power ~ Time, data=data, main="", xlab="", ylab="Global Active Power (kilowatts)", type="l")
# top right
plot(Voltage ~ Time, data=data, main="", xlab="datetime", type="l")
# bottom left
plot(Sub_metering_1 ~ Time, data=data, main="", xlab="", ylab="Energy sub metering", type="l")
lines(Sub_metering_2 ~ Time, data=data, type="l", col="red")
lines(Sub_metering_3 ~ Time, data=data, type="l", col="blue")
legend("topright", tail(names(data), 3), lty=1, col=c("black", "red", "blue"), bty="n")
# bottom right
plot(Global_reactive_power ~ Time, data=data, main="", xlab="datetime", type="l")
dev.off()