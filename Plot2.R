# Download and extract the file in your working directory
# Reading, naming columns and subsetting power consumption data
powerdata <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpowerdata <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

# Transforming the Date and Time variabless from characters into objects of type Date and POSIXlt respectively
subpowerdata$Date <- as.Date(subpowerdata$Date, format="%d/%m/%Y")
subpowerdata$Time <- strptime(subpowerdata$Time, format="%H:%M:%S")
subpowerdata[1:1440,"Time"] <- format(subpowerdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpowerdata[1441:2880,"Time"] <- format(subpowerdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Basic plot
plot(subpowerdata$Time,as.numeric(as.character(subpowerdata$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")

# Main title
title(main="Global Active Power Vs Time")

#Creating a PNG file        
png("plot2.png", width=480, height=480)
plot(subpowerdata$Time,as.numeric(as.character(subpowerdata$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
title(main="Global Active Power Vs Time")
dev.off()
