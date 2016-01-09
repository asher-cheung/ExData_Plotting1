mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na = c("?"))
mydata$Time <- strptime(paste(mydata$Date, "", mydata$Time), format = "%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mysubset <- subset(mydata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
rownames(mysubset) <- seq(length=nrow(mysubset))

# Plot 3
png(
  filename = "plot3.png",
  width = 480, 
  height = 480, 
  units = "px",
  bg = NA
)
with(mysubset, {
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
    cex = 1
  )
})
dev.off()