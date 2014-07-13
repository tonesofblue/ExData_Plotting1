# Load data, assuming data file is downloaded and decompressed
# to subdirectory ".\data\"
library(data.table)
dt <- fread(".\\data\\household_power_consumption.txt", na.strings = c("?"))

# Filter data for relevant date range.
sdt <- dt[as.Date(dt$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(dt$Date, "%d/%m/%Y") == "2007-02-02",]
rm(dt)

# Plot: Global Active Power variation by time.
png(filename = "plot2.png",
    width = 480, height = 480)
plot(strptime( paste(sdt$Date, sdt$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(sdt$Global_active_power), 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()