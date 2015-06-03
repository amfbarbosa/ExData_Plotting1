#[plot2.R]
#
#
localSet <- Sys.getlocale('LC_TIME') # Save local time
Sys.setlocale('LC_TIME', 'C')        # Set time to English standard

arq <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
auxTab <- read.table(arq, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

auxTab1 <- subset(auxTab,Date %in% c("1/2/2007","2/2/2007") )

dayTime<- strptime(paste(auxTab1$Date, auxTab1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

activePwr <- as.numeric(auxTab1$Global_active_power)

png("plot2.png", width=480, height=480)

plot(dayTime, activePwr, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

Sys.setlocale('LC_TIME', localSet )   # Set time to original standard
