## Project 1 - EDA - plot3 
setwd("C:/Users/narayane/Documents/GitHub/Neena_Exploratory")
library(data.table)
file1<-("./household_power_consumption.txt")


house_power<-read.table(text= grep("^[1,2]/2/2007",readLines(file1),value=TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

# class(house_power$Time)
house_power$Datetime<-paste(house_power$Date,house_power$Time)
house_power$Datetime<-strptime(house_power$Datetime,"%d/%m/%Y %H:%M:%S")
# class(house_power$Datetime)
# tail(house_power$Datetime)

png("Plot3.png", width=480, height=480, units="px")
plot(house_power$Datetime,house_power$Sub_metering_1, 
     type="l",ylab="Energy Sub-metering",xlab="")
lines(house_power$Datetime,house_power$Sub_metering_2, col='Red')
lines(house_power$Datetime,house_power$Sub_metering_3, col='Blue')
legend("topright",lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
