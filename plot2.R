library(data.table)
# Construct plot 2 

# Read in Electric Power Consumption Data
ElecPower <- fread("household_power_consumption.txt",sep=";")

# Change the Date and Time variables to Date/Time classes 
ElecPower$Date1 <- as.Date(ElecPower$Date, "%d/%m/%Y")

# Only use data from the dates 2007-02-01 and 2007-02-02
ElecPowerUse <- ElecPower[ElecPower$Date1 %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),] 
ElecPowerUse$DateTime <-paste(ElecPowerUse$Date, ElecPowerUse$Time)

# Convert Global_active_power column from character variable to numeric variable
ElecPowerUse$Global_active_power <- as.numeric(ElecPowerUse$Global_active_power)

# Plot of Global_active_power over time
# Change x and y axis labels using xlab and ylab parameters
png("plot2.png", width=480, height=480)
plot(strptime(ElecPowerUse$DateTime, "%d/%m/%Y %H:%M:%S"), ElecPowerUse$Global_active_power, 
	ylab= "Global Active Power (kilowatts)", xlab="", type="l")
dev.off()