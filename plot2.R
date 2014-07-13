# Exploratory data analysis
# Course project 1
# Plot 2

setwd("~/Copy/Michael/training/Coursera_datascience/ExplDataAnal/Project1/ExData_Plotting1")

# Read data
data = read.csv("../household_power_consumption.txt", sep=";", na.strings="?", skip=66637, nrows=2879, header=F)
# Add column names
colnames(data) = read.csv("../household_power_consumption.txt", sep=";", nrows=1, header=F, stringsAsFactors=F)
# Tidy data
data$Date = as.Date(data$Date, format="%d/%m/%Y")
data$Time = as.POSIXct(strptime(paste0(data$Date, " ", data$Time), format="%Y-%m-%d %H:%M:%S"))

# Plot 2: histogram of global active power
png("./figure/plot2.png", height=480, width=480,  bg="transparent")
plot(Global_active_power ~ Time, data=data, main="", xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()