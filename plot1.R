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

###################### making first plot ###################################

filename.png <- 'plot1.png'
filename.png <- paste(working_directory, filename.png, sep = "/" )
filename.png
png(filename=filename.png,width = 480, height = 480, type = "windows")

hist(data.frame$Global_active_power, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col = "red", ylim=c(0,1200))
dev.off()
