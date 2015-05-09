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




