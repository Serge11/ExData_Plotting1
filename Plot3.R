general_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
info<-subset(general_data, general_data$Date == "1/2/2007" |  general_data$Date == "2/2/2007")

info$Sub_metering_1<-as.numeric(info$Sub_metering_1)
info$Sub_metering_2<-as.numeric(info$Sub_metering_2)
info$Sub_metering_3<-as.numeric(info$Sub_metering_3)
info$Time <- strptime(paste(info$Date, info$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)


plot(info$Time, info$Sub_metering_1 , type="l", xlab="", ylab="Energy Submetering",col="black")
lines(info$Time, info$Sub_metering_2, type="l", col="red")
lines(info$Time, info$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))


dev.off()
