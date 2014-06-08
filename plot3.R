#read the data into memory

electricdata<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Cast the date time columns into One date time column

electricdata$DateTime <- strptime(paste(electricdata$Date, electricdata$Time), "%d/%m/%Y %H:%M:%S")

# Choose appropriate time range
electricdata_subset <- subset(electricdata, 
                              as.Date(DateTime) >= as.Date("2007-02-01") & 
                                as.Date(DateTime) <= as.Date("2007-02-02"))
png("plot3.png", height=480, width=480)

plot(electricdata_subset$DateTime, electricdata_subset$Sub_metering_1, pch=NA, 
        xlab="", ylab="Energy sub meeting")

lines(electricdata_subset$DateTime, electricdata_subset$Sub_metering_1)
lines(electricdata_subset$DateTime, electricdata_subset$Sub_metering_2, col='red')
lines(electricdata_subset$DateTime, electricdata_subset$Sub_metering_3, col='blue')

legend("topright", col = c('black', 'red', 'blue'), lty = c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()