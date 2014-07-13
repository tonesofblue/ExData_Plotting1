# Load data, assuming data file is downloaded and decompressed
# to subdirectory ".\data\"
library(data.table)
dt <- fread(".\\data\\household_power_consumption.txt", na.strings = c("?"))

# Filter data for relevant date range.
sdt <- dt[as.Date(dt$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(dt$Date, "%d/%m/%Y") == "2007-02-02",]
rm(dt)

# Plot: Histogram of Global Active Power.
png(filename = "plot1.png",
    width = 480, height = 480)
hist(as.numeric(sdt$Global_active_power), 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()