#Getting Data
setwd("C:/Coursera/Exploratory Data")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE)

#Some processing
data[,1]<-as.character(data$Date)
processed_data<-subset(data,Date=="1/2/2007" | Date=="2/2/2007", select=1:9)
day_time <- strptime(paste(processed_data$Date,processed_data$Time), "%d/%m/%Y %H:%M:%S")

#Setting up for multiple plots on one
par(mfrow=c(2,2))

#Open Device
#png(filename="plot4.png", width=480, height=480, units="px")

#Plot in position 1,1
plot(day_time,processed_data$Global_active_power, type="l", xlab="",ylab="Global Active Power",cex.lab=.75,cex.axis=.75)

#plot in position 1,2
processed_data$Voltage<-as.numeric(processed_data$Voltage)
plot(day_time,processed_data$Voltage, type="l" , xlab="datetime",ylab="Voltage",cex.lab=.75,cex.axis=.75)
     
#Plot in position 2,1

processed_data$Sub_metering_1<-as.numeric(processed_data$Sub_metering_1)
processed_data$Sub_metering_2<-as.numeric(processed_data$Sub_metering_2)
processed_data$Sub_metering_3<-as.numeric(processed_data$Sub_metering_3)

y_range=range(0,processed_data$Sub_metering_1,processed_data$Sub_metering_2,processed_data$Sub_metering_3)
plot(day_time,processed_data$Sub_metering_1, type="l",ylim=y_range, xlab="",ylab="Energy sub metering",cex.lab=.75,cex.axis=.75)
lines(day_time,processed_data$Sub_metering_2, type='l', col="red")
lines(day_time,processed_data$Sub_metering_3, type='l', col="blue")
legend(day_time[1000],39.5,c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lwd=c(1,1,1),lty=c(1,1,1),cex=.75,bty = "n")

#plot in position 2,2
processed_data$Global_reactive_power<-as.numeric(processed_data$Global_reactive_power)
plot(day_time,processed_data$Global_reactive_power, type="l" , xlab="datetime",ylab="Global_reactive_power",cex.lab=.75,cex.axis=.75)

dev.copy(png,filename="plot4.png", width=480, height=480, units="px")
#Turn device off
dev.off()