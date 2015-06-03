#[plot4.R]
#
#

localSet <- Sys.getlocale('LC_TIME')    # Save local time
Sys.setlocale('LC_TIME', 'C')           # Set time to English standard

arq <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
auxTab <- read.table(arq, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

auxTab1 <- subset(auxTab,Date %in% c("1/2/2007","2/2/2007") )

dayTime <- strptime(paste(auxTab1$Date, auxTab1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

activePwr <- as.numeric(auxTab1$Global_active_power)

reactivePwr <- as.numeric(auxTab1$Global_reactive_power)

voltage <- as.numeric(auxTab1$Voltage)

subMetering1 <- as.numeric(auxTab1$Sub_metering_1)
subMetering2 <- as.numeric(auxTab1$Sub_metering_2)
subMetering3 <- as.numeric(auxTab1$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(dayTime, activePwr, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dayTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dayTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(dayTime, subMetering2, type="l", col="red")

lines(dayTime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dayTime, reactivePwr, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

Sys.setlocale('LC_TIME', localSet)   # Set time to original standard
