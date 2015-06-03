#[plot3.R]
#
#
localSet <- Sys.getlocale('LC_TIME') # Save local time
Sys.setlocale('LC_TIME', 'C')        # Set time to English standard

arq <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
auxTab <- read.table(arq, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

auxTab1 <- subset(auxTab,Date %in% c("1/2/2007","2/2/2007") )

dayTime <- strptime(paste(auxTab1$Date, auxTab1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subMetering1 <- as.numeric(auxTab1$Sub_metering_1)
subMetering2 <- as.numeric(auxTab1$Sub_metering_2)
subMetering3 <- as.numeric(auxTab1$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(dayTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(dayTime, subMetering2, type="l", col="red")

lines(dayTime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()

Sys.setlocale('LC_TIME', localSet)   # Set time to original standard
