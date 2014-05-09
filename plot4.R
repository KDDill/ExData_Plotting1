library(data.table)
# Construct plot 4

# Read in Electric Power Consumption Data
ElecPower <- fread("household_power_consumption.txt",sep=";")

# Change the Date and Time variables to Date/Time classes 
ElecPower$Date1 <- as.Date(ElecPower$Date, "%d/%m/%Y")

# Only use data from the dates 2007-02-01 and 2007-02-02
ElecPowerUse <- ElecPower[ElecPower$Date1 %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),] 
ElecPowerUse$DateTime <-paste(ElecPowerUse$Date, ElecPowerUse$Time)

# Convert Global_active_power column from character variable to numeric variable
ElecPowerUse$Global_active_power <- as.numeric(ElecPowerUse$Global_active_power)

# Convert Voltage column from character variable to numeric variable
ElecPowerUse$Voltage <- as.numeric(ElecPowerUse$Voltage)

# Convert ElecPowerUse$Sub_metering columns from character variable to numeric variable
ElecPowerUse$Sub_metering_1 <- as.numeric(ElecPowerUse$Sub_metering_1)
ElecPowerUse$Sub_metering_2 <- as.numeric(ElecPowerUse$Sub_metering_2)
ElecPowerUse$Sub_metering_3 <- as.numeric(ElecPowerUse$Sub_metering_3)

# Convert Global_reactive_power column from character variable to numeric variable
ElecPowerUse$Global_reactive_power <- as.numeric(ElecPowerUse$Global_reactive_power)

# Plot of 4 figures
# 1: Plot of Global_active_power over time
# 2: Plot of Voltage over time
# 3: Sub_meterings (1,2,3) over time using plot and line functions
# 4: Plot of Global_reactive_power over time

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(strptime(ElecPowerUse$DateTime, "%d/%m/%Y %H:%M:%S"), ElecPowerUse$Global_active_power, 
	ylab= "Global Active Power (kilowatts)", xlab="", type="l")

plot(strptime(ElecPowerUse$DateTime, "%d/%m/%Y %H:%M:%S"), ElecPowerUse$Voltage, 
	ylab= "Voltage", xlab="datetime", type="l", lwd=1)
	
plot(strptime(ElecPowerUse$DateTime, "%d/%m/%Y %H:%M:%S"), ElecPowerUse$Sub_metering_1, 
	ylab= "Energy sub metering", xlab="", type="l")
lines(strptime(ElecPowerUse$DateTime, "%d/%m/%Y %H:%M:%S"), ElecPowerUse$Sub_metering_2, col="red")
lines(strptime(ElecPowerUse$DateTime, "%d/%m/%Y %H:%M:%S"), ElecPowerUse$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
	col=c("black", "red", "blue"), lty=1)
	
plot(strptime(ElecPowerUse$DateTime, "%d/%m/%Y %H:%M:%S"), ElecPowerUse$Global_reactive_power, 
	ylab="Global_reactive_power", xlab="datetime", type="l", lwd=1)	
	
dev.off()