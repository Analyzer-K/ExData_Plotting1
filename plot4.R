library(dplyr)
##Reading the datset
datasrc <- read.table("D:/RWSPACE/project4/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
##Filtering in order to keep just the 2 used dates
data <- filter(datasrc,Date=="1/2/2007" | Date=="2/2/2007")
##Converting Date and Time columns into suitable formats put in one new variable
datac$datetime <- strptime(paste(datac$Date, datac$Time), format="%d/%m/%Y %H:%M:%S")
##Open the png device
png("plot4.png",width = 480,height = 480)
#Plotting
par(mfcol=c(2,2))
##1st plot
plot(datac$datetime,datac$Global_active_power,type = "n",xlab = "",ylab = "Global Active Power (kilowatts)")
lines(datac$datetime,datac$Global_active_power)
##2nd plot
with(datac,plot(datetime,Sub_metering_1,ylab = "Energy sub metering",type = "n",xlab = ""))
lines(datac$datetime,datac$Sub_metering_1,col="black")
lines(datac$datetime,datac$Sub_metering_2,col="red")
lines(datac$datetime,datac$Sub_metering_3,col="blue")
legend("topright",lwd=2,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##3rd plot
with(datac,plot(datetime,Voltage, type = "n"))
lines(datac$datetime,datac$Voltage)
##4th plot
with(datac,plot(datetime,Global_reactive_power, type = "n"))
lines(datac$datetime,datac$Global_reactive_power)
##Close the device to save the plot
dev.off()