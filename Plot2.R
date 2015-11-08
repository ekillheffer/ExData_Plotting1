# Remove everything from the workspace
rm(list = ls())

# Set working directory
setwd("C:/Users/erin/Desktop/Coursera/Exploratory_Analysis")

# Import data, format, and subset
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = F)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
df <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
rm(data)

## Plot 2
df$Global_active_power <- as.numeric(df$Global_active_power)
datetime <- paste(df$Date, df$Time)
datetime <- as.POSIXct(datetime)
plot(datetime, df$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")


## Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()