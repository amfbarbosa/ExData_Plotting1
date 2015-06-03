#[plot2.R]
#
#
padraoLocal <- Sys.getlocale('LC_TIME') # Save local time
Sys.setlocale('LC_TIME', 'C')           # Set time to English standard
dataFile <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
Sys.setlocale('LC_TIME', padraoLocal)   # Set time to original standard
