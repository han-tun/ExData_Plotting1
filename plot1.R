# Exploratory data analysis
# Course project 1
# Plot 1

setwd("~/Copy/Michael/training/Coursera_datascience/ExplDataAnal/Project1/ExData_Plotting1")

# Read data
data = read.csv("../household_power_consumption.txt", sep=";", na.strings="?", skip=66637, nrows=2879, header=F)
# Add column names
colnames(data) = read.csv("../household_power_consumption.txt", sep=";", nrows=1, header=F, stringsAsFactors=F)
# Tidy data
data$Date = as.Date(data$Date, format="%d/%m/%Y")
data$Time = strptime(paste0(data$Date, " ", data$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 1: histogram of global active power
png("./figure/plot1.png", height=480, width=480,  bg="transparent")
hist(data[,3], main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()