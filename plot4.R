############################################################################
# before starting, download and unzip the dataset in your working directory#
############# with the filename household_power_consumption.txt#############
############################################################################

###################### read only necessary file data #######################

library(sqldf)
working_directory <- getwd()
filename <- 'household_power_consumption.txt'
file.name<- paste(working_directory, filename, sep = "/" )
data.frame <- read.csv.sql(file.name, sep=";", sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

###################### making fourth plot ###################################

filename.png <- 'plot4.png'
filename.png <- paste(working_directory, filename.png, sep = "/" )
png(filename=filename.png,width = 480, height = 480, type = "windows")

par(mfrow=c(2,2))
data.frame$Date <- strptime(paste(data.frame$Date,data.frame$Time), format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

plot(x=data.frame$Date,  y=data.frame$Global_active_power,
     ylab="Global Active Power", type="l", xlab="")

plot(x=data.frame$Date,  y=data.frame$Voltage,
     ylab="Voltage", type="l", xlab="datetime")

plot(x=data.frame$Date,  y=data.frame$Sub_metering_1,
     ylab="Energy sub metering", type="l", xlab="")

lines(x=data.frame$Date,y=data.frame$Sub_metering_2, col="red")
lines(x=data.frame$Date,y=data.frame$Sub_metering_3, col="blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), # puts text in the legend 
       lty=1, # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5,2,5),
       col=c("black", "red","blue")) # gives the legend lines the correct color and width

plot(x=data.frame$Date,  y=data.frame$Global_reactive_power,
     ylab="Global_reactive_power", type="l", xlab="datetime")
dev.off()
