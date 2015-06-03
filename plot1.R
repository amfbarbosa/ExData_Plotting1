#[plot1.R]
#
#

localSet <- Sys.getlocale('LC_TIME') # Save local time
Sys.setlocale('LC_TIME', 'C')        # Set time to English standard

arq <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
auxTab <- read.table(arq, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

auxTab1 <- subset(auxTab,Date %in% c("1/2/2007","2/2/2007") )

activePwr <- as.numeric(auxTab1$Global_active_power)

png("plot1.png", width=480, height=480)

hist(activePwr, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

Sys.setlocale('LC_TIME', localSet)   # Set time to original standard
