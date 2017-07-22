
##Import the file
power1 <- read.csv(file = "c:/datasets/household_power_consumption.txt", stringsAsFactors=F, header = TRUE,
                   sep=";", dec = ".", na.strings="?", col.names = c("date1","time1","Global_active_power", "Global_reactive_power",
                                                     "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                                                     "Sub_metering_3")) 
##Subset the data for the date range required
power2 <- subset(power1, subset=(as.Date(date1,  format = "%d/%m/%Y") >= "2007-02-01" 
                        & as.Date(date1,  format = "%d/%m/%Y") <= "2007-02-02"))

##Change the date1 column to date format
power2$date1 <- as.Date(power2$date1, format="%d/%m/%Y")

##combine the date1 and time1 columns as set it as POSIX class
power2$datetime1 <- paste(as.Date(power2$date1), power2$time1)
power2$datetime1 <- as.POSIXct(power2$datetime1)

##Plot the data
plot(power2$Global_active_power~power2$datetime1, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

##Save the file and shut down the device
dev.copy(png, file="c:/backup/R/Class4/Week1/plot2.png", height=504, width=504)
dev.off()


