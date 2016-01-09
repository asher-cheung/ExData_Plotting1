mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na = c("?"))
mydata$Time <- strptime(paste(mydata$Date, "", mydata$Time), format = "%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mysubset <- subset(mydata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
rownames(mysubset) <- seq(length=nrow(mysubset))

# Plot 4
png(
  filename = "plot4.png",
  width = 480, 
  height = 480, 
  units = "px",
  bg = NA
)
par.default <- par(no.readonly=TRUE)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0), cex = 0.64)
with(mysubset, {
  # fig [1, 1]
  plot(
    Time,
    Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power"
  )
  
  # fig [1, 2]
  plot(
    Time,
    Voltage,
    type = "l",
    xlab = "datetime",
    ylab = "Voltage"
  )
  
  # fig [2, 1]
  plot(
    Time,
    Sub_metering_1,
    type = "l",
    xlab = "",
    ylab = "Energy sub metering"
  );
  lines(
    Time,
    Sub_metering_2,
    col = "red"
  );
  lines(
    Time, 
    Sub_metering_3,
    col = "blue"
  );
  legend(
    'topright', 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    col = c('black', 'blue', 'red'), 
    lty = 1,
    bty = "n"
  )
  
  # fig [2, 2]
  plot(
    Time,
    Global_reactive_power,
    type = "l",
    xlab = "datetime",
    ylab = "Global_reactive_power"
  )
})
par(par.default)
dev.off()