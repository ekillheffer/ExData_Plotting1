# Remove everything from the workspace
rm(list = ls())

# Set working directory
setwd("C:/Users/erin/Desktop/Coursera/Exploratory_Analysis")

# Import data, format, and subset
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = F)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
df <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
rm(data)

## Plot 1
df$Global_active_power <- as.numeric(df$Global_active_power)
hist(df$Global_active_power, 
     main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()