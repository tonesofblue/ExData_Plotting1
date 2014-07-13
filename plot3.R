# Load data, assuming data file is downloaded and decompressed
# to subdirectory ".\data\"
library(data.table)
dt <- fread(".\\data\\household_power_consumption.txt", na.strings = c("?"))

# Filter data for relevant date range.
sdt <- dt[as.Date(dt$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(dt$Date, "%d/%m/%Y") == "2007-02-02",]
rm(dt)

# Plot: Energy sub metering variation by time.
png(filename = "plot3.png",
    width = 480, height = 480)
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
dev.off()