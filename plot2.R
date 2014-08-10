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

###################### making second plot ###################################

filename.png <- 'plot2.png'
filename.png <- paste(working_directory, filename.png, sep = "/" )
png(filename=filename.png,width = 480, height = 480, type = "windows")

data.frame$Date <- strptime(paste(data.frame$Date,data.frame$Time), format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
plot(x=data.frame$Date,  y=data.frame$Global_active_power,
     ylab="Global Active Power(kilowatts)", type="l", xlab="")
dev.off()
