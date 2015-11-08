# Remove everything from the workspace
rm(list = ls())

# Set working directory
setwd("C:/Users/erin/Desktop/Coursera/Exploratory_Analysis")

# Import data, format, and subset
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = F)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
df <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
rm(data)

# Formatting
df$Global_active_power <- as.numeric(df$Global_active_power)
datetime <- paste(df$Date, df$Time)
datetime <- as.POSIXct(datetime)
subMetering1 <- as.numeric(df$Sub_metering_1)
subMetering2 <- as.numeric(df$Sub_metering_2)
subMetering3 <- as.numeric(df$Sub_metering_3)

## Plot 3
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()