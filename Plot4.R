general_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
info<-subset(general_data, general_data$Date == "1/2/2007" |  general_data$Date == "2/2/2007")

info$Global_active_power<-as.numeric(info$Global_active_power)
info$Global_reactive_power<-as.numeric(info$Global_reactive_power)
info$Voltage<-as.numeric(info$Voltage)
info$Sub_metering_1<-as.numeric(info$Sub_metering_1)
info$Sub_metering_2<-as.numeric(info$Sub_metering_2)
info$Sub_metering_3<-as.numeric(info$Sub_metering_3)
info$Time <- strptime(paste(info$Date, info$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
#1
plot(info$Time, info$Global_active_power , type="l", xlab="", ylab="Global Active Power (kilowatts)")
#2
plot(info$Time, info$Voltage, type="l", xlab="datetime", ylab="Voltage")
#3
plot(info$Time, info$Sub_metering_1 , type="l", xlab="", ylab="Energy Submetering",col="black")
lines(info$Time, info$Sub_metering_2, type="l", col="red")
lines(info$Time, info$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")
#4
plot(info$Time, info$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
