library(dplyr)
##Reading the datset
datasrc <- read.table("D:/RWSPACE/project4/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
##Filtering in order to keep just the 2 used dates
data <- filter(datasrc,Date=="1/2/2007" | Date=="2/2/2007")
##Converting Date and Time columns into suitable formats put in one new variable
datac$datetime <- strptime(paste(datac$Date, datac$Time), format="%d/%m/%Y %H:%M:%S")
##Open the png device
png("plot1.png",width = 480,height = 480)
#Plotting the histogram
hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col = "red")
##Close the device to save the plot
dev.off()