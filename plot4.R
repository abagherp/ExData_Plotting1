require(dplyr)
rm(list = setdiff(ls(), lsf.str()))
setwd("/Users/alibagherpour/Documents/LearnR/ExploratoryDataAnalysis")

header <- read.table('./household_power_consumption.txt', 
                     nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
dat   <- read.table('./household_power_consumption.txt', 
                    skip = 65000, nrows = 5000, header = FALSE, sep =';')
colnames( dat ) <- unlist(header)

dat$Date <- as.Date(dat$Date,"%d/%m/%Y")

start <- as.Date("2007-02-01","%Y-%m-%d")
end <- as.Date("2007-02-03","%Y-%m-%d")

final_data <- filter(dat, Date >= start & Date < end)

final_data$Time <- strptime(paste(final_data$Date,final_data$Time),"%Y-%m-%d %H:%M:%S")

png(filename = "./ExData_Plotting1/plot4.png",
    width = 480, height = 480)
par(mfrow=c(2,2))
plot(final_data$Time,final_data$Global_active_power,
     ylab="Global Active Power (kilowatts)",xlab="",type="l")
plot(final_data$Time,final_data$Voltage,
     ylab="Voltage",xlab="datetime",type="l")
plot(final_data$Time,final_data$Sub_metering_1,
     ylab="Energy sub metering",xlab="",type="l")
lines(final_data$Time,final_data$Sub_metering_2, col="red")
lines(final_data$Time,final_data$Sub_metering_3, col="blue")
legend( "topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","blue","red"),cex=0.8, lty=1)
plot(final_data$Time,final_data$Global_reactive_power,
     ylab="Global reactive power",xlab="datetime",type="l")

dev.off()



