# Download and extract the file in your working directory
# Reading, naming columns and subsetting power consumption data
powerdata <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpowerdata <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

# Basic plot
hist(as.numeric(as.character(subpowerdata$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# Main title
title(main="Global Active Power")

#Creating a PNG file        
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(subpowerdata$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")
dev.off()