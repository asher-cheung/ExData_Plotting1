mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na = c("?"))
mydata$Time <- strptime(paste(mydata$Date, "", mydata$Time), format = "%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mysubset <- subset(mydata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
rownames(mysubset) <- seq(length=nrow(mysubset))

# Plot 1
png(
  filename = "plot1.png",
  width = 480, 
  height = 480, 
  units = "px",
  bg = NA
)
with(
  mysubset,
  hist(
    Global_active_power,
    col="red", 
    main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)", 
    ylab = "Frequency"
  )
)
dev.off()