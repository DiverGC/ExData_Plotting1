#Plot 2
setwd("C:/Coursera/Exploratory Data")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE)
data[,1]<-as.character(data$Date)
processed_data<-subset(data,Date=="1/2/2007" | Date=="2/2/2007", select=1:9)

processed_data$Sub_metering_1<-as.numeric(processed_data$Sub_metering_1)
processed_data$Sub_metering_2<-as.numeric(processed_data$Sub_metering_2)
processed_data$Sub_metering_3<-as.numeric(processed_data$Sub_metering_3)

day_time <- strptime(paste(processed_data$Date,processed_data$Time), "%d/%m/%Y %H:%M:%S")
y_range=range(0,processed_data$Sub_metering_1,processed_data$Sub_metering_2,processed_data$Sub_metering_3)
png(filename="plot3.png", width=480, height=480, units="px")
plot(day_time,processed_data$Sub_metering_1, type="l",ylim=y_range, xlab="",ylab="Energy sub metering",cex.lab=.75,cex.axis=.75)
lines(day_time,processed_data$Sub_metering_2, type='l', col="red")
lines(day_time,processed_data$Sub_metering_3, type='l', col="blue")
legend(day_time[2167],39.5,c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lwd=c(1,1,1),lty=c(1,1,1),cex=.75)
dev.off()