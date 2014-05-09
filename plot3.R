library(data.table)
# Construct plot 3

# Read in Electric Power Consumption Data
ElecPower <- fread("household_power_consumption.txt",sep=";")

# Change the Date and Time variables to Date/Time classes 
ElecPower$Date1 <- as.Date(ElecPower$Date, "%d/%m/%Y")

# Only use data from the dates 2007-02-01 and 2007-02-02
ElecPowerUse <- ElecPower[ElecPower$Date1 %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),] 
ElecPowerUse$DateTime <-paste(ElecPowerUse$Date, ElecPowerUse$Time)

# Convert ElecPowerUse$Sub_metering columns from character variable to numeric variable
ElecPowerUse$Sub_metering_1 <- as.numeric(ElecPowerUse$Sub_metering_1)
ElecPowerUse$Sub_metering_2 <- as.numeric(ElecPowerUse$Sub_metering_2)
ElecPowerUse$Sub_metering_3 <- as.numeric(ElecPowerUse$Sub_metering_3)

# Plot of Sub_meterings (1,2,3) over time using plot and line functions
# Change x and y axis labels using xlab and ylab parameters and add legend
png("plot3.png", width=480, height=480)
plot(strptime(ElecPowerUse$DateTime, "%d/%m/%Y %H:%M:%S"), ElecPowerUse$Sub_metering_1, 
	ylab= "Energy sub metering", xlab="", type="l")
lines(strptime(ElecPowerUse$DateTime, "%d/%m/%Y %H:%M:%S"), ElecPowerUse$Sub_metering_2, col="red")
lines(strptime(ElecPowerUse$DateTime, "%d/%m/%Y %H:%M:%S"), ElecPowerUse$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
	col=c("black", "red", "blue"), lty=1)
dev.off()