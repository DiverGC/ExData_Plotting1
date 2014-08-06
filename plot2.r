#Plot 2
setwd("C:/Coursera/Exploratory Data")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE)
data[,1]<-as.character(data$Date)
processed_data<-subset(data,Date=="1/2/2007" | Date=="2/2/2007", select=1:9)
day_time <- strptime(paste(processed_data$Date,processed_data$Time), "%d/%m/%Y %H:%M:%S")
png(filename="plot2.png", width=480, height=480, units="px")
plot(day_time,processed_data$Global_active_power, type="l" , xlab="",ylab="Global Active Power(kilowatts)")
dev.off()