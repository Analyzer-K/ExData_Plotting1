library(dplyr)
##Reading the datset
datasrc <- read.table("D:/RWSPACE/project4/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
##Filtering in order to keep just the 2 used dates
datac <- filter(datasrc,Date=="1/2/2007" | Date=="2/2/2007")
##Converting Date and Time columns into suitable formats
datac$datetime <- strptime(paste(datac$Date, datac$Time), format="%d/%m/%Y %H:%M:%S")
##Open the png device
png("plot2.png",width = 480,height = 480)
#Plotting the line chart
plot(datac$datetime,datac$Global_active_power,type = "n",xlab = "",ylab = "Global Active Power (kilowatts)")
lines(datac$datetime,datac$Global_active_power)
##Close the device to save the plot
dev.off()
