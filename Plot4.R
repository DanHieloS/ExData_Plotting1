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

#Preparing the canvas for many graphs
par(mfrow=c(2,2))

# plot functions for making 4 plots that form the graph
with(subpowerdata,{
        plot(subpowerdata$Time,as.numeric(as.character(subpowerdata$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
        plot(subpowerdata$Time,as.numeric(as.character(subpowerdata$Voltage)), type="l",xlab="datetime",ylab="Voltage")
        plot(subpowerdata$Time,subpowerdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        with(subpowerdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
        with(subpowerdata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
        with(subpowerdata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
        legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
        plot(subpowerdata$Time,as.numeric(as.character(subpowerdata$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

#Creating a PNG file        
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(subpowerdata,{
        plot(subpowerdata$Time,as.numeric(as.character(subpowerdata$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
        plot(subpowerdata$Time,as.numeric(as.character(subpowerdata$Voltage)), type="l",xlab="datetime",ylab="Voltage")
        plot(subpowerdata$Time,subpowerdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        with(subpowerdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
        with(subpowerdata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
        with(subpowerdata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
        legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
        plot(subpowerdata$Time,as.numeric(as.character(subpowerdata$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()