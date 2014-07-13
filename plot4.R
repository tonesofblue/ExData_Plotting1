# Load data, assuming data file is downloaded and decompressed
# to subdirectory ".\data\"
library(data.table)
dt <- fread(".\\data\\household_power_consumption.txt", na.strings = c("?"))

# Filter data for relevant date range.
sdt <- dt[as.Date(dt$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(dt$Date, "%d/%m/%Y") == "2007-02-02",]
rm(dt)

# Plot
png(filename = "plot4.png",
    width = 480, height = 480)
par(mfrow = c(2,2))
# * Subplot 1: Global Active Power variation by time.
plot(strptime( paste(sdt$Date, sdt$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(sdt$Global_active_power), 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")
# * Subplot 2: Voltage variation by time
plot(strptime( paste(sdt$Date, sdt$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(sdt$Voltage), 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")
# * Subplot 3: Energy sub metering variation by time.
plot(strptime( paste(sdt$Date, sdt$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(sdt$Sub_metering_1),
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
points(strptime( paste(sdt$Date, sdt$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(sdt$Sub_metering_2), 
       type = "l", col = "red")
points(strptime( paste(sdt$Date, sdt$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(sdt$Sub_metering_3),
       type = "l", col = "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"))
# * Subplot 4: Global Reactive Power variation by time.
plot(strptime( paste(sdt$Date, sdt$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(sdt$Global_reactive_power), 
     type = "l",
     xlab = "datetime",
     ylab = "Global Reactive Power")
dev.off()