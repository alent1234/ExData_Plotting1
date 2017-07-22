
##Import the file
power1 <- read.csv(file = "c:/datasets/household_power_consumption.txt", stringsAsFactors=F, header = TRUE,
                   sep=";", dec = ".", na.strings="?", col.names = c("date1","time1","Global_active_power", "Global_reactive_power",
                                                                     "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                                                                     "Sub_metering_3")) 
##Subset the data for the date range required
power2 <- subset(power1, subset=(as.Date(date1,  format = "%d/%m/%Y") >= "2007-02-01" 
                              & as.Date(date1,  format = "%d/%m/%Y") <= "2007-02-02"))

##Change date1 column to date format
power2$date1 <- as.Date(power2$date1, format="%d/%m/%Y")


##Create new datetime1 column from date1 and time1 and change it to POSIX class
datetime1 <- paste(as.Date(power2$date1), power2$time1)
power2$datetime1 <- as.POSIXct(datetime1)

##Create the plots
par(mfrow = c(2, 2))
with(power2, 
     {
       plot(power2$Global_active_power~power2$datetime1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
       plot(power2$Voltage~power2$datetime1, type="l", ylab="Voltage", xlab="Datetime")
       
       plot(power2$Sub_metering_1~power2$datetime1, type="l", col = "black", ylab="Energy sub metering", xlab="")
lines(power2$Sub_metering_2~power2$datetime1, type = "l", col ="red")
lines(power2$Sub_metering_3~power2$datetime1, type = "l", col ="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    plot(power2$Global_reactive_power~power2$datetime1, type="l", ylab="Global_reactive_power", xlab="Datetime")

})
##save the plots to a file
dev.copy(png, file="c:/backup/R/Class4/Week1/plot44.png", height=700, width=700)
dev.off()