##Plot 1

setwd("C:/Coursera/Exploratory Data")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE)
data[,1]<-as.character(data$Date)
processed_data<-subset(data,Date=="1/2/2007" | Date=="2/2/2007", select=1:9)
processed_data$Global_active_power<-as.numeric(processed_data$Global_active_power)
png(filename="plot1.png", width=480, height=480, units="px")
hist(processed_data$Global_active_power, col="red" ,main="Global Active Power", xlab="Global Active Power(kilowatts)")
dev.off()