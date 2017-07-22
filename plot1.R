##Import the file

power1 <- read.csv(file = "c:/datasets/household_power_consumption.txt", stringsAsFactors=F, header = TRUE,
                   sep=";", dec = ".", col.names = c("date1","time1","Global_active_power", "Global_reactive_power",
                                                     "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                                                     "Sub_metering_3")) 
#colClasses = c("Date", "character", "factor", "numeric","numeric","numeric","numeric","numeric","numeric"))

##Subset the data for the date range required
power2 <- subset(power1, subset=(as.Date(date1,  format = "%d/%m/%Y") >= "2007-02-01" 
                                 & as.Date(date1,  format = "%d/%m/%Y") <= "2007-02-02"))

##Create the plot
hist(as.numeric(power2$Global_active_power),   col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

##Save the file as png and shut down the device
dev.copy(png, file="c:/backup/R/Class4/Week1/plot1.png", height=504, width=504)
dev.off()