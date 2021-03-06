setwd("C:/Users/narayane/Documents/GitHub/Neena_Exploratory")
## Project 1 - EDA

library(data.table)
file1<-("./household_power_consumption.txt")


house_power<-read.table(text= grep("^[1,2]/2/2007",readLines(file1),value=TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

# class(house_power$Time)
house_power$Datetime<-paste(house_power$Date,house_power$Time)
house_power$Datetime<-strptime(house_power$Datetime,"%d/%m/%Y %H:%M:%S")
# class(house_power$Datetime)
# tail(house_power$Datetime)
png("plot1.png", width=480, height=480, units="px")
hist(as.numeric(as.character(house_power$Global_active_power)), col="red", main="Global_active_power", xlab="Global_active_power (kilowatts)")
dev.off()
