library(data.table)
# Construct plot 1 

# Read in Electric Power Consumption Data
ElecPower <- fread("household_power_consumption.txt",sep=";")

# Change the Date and Time variables to Date/Time classes 
ElecPower$Date1 <- as.Date(ElecPower$Date, "%d/%m/%Y")

# Only use data from the dates 2007-02-01 and 2007-02-02
ElecPowerUse <- ElecPower[ElecPower$Date1 %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),] 
ElecPowerUse$DateTime <-paste(ElecPowerUse$Date, ElecPowerUse$Time)

# Convert Global_active_power column from character variable to numeric variable
ElecPowerUse$Global_active_power <- as.numeric(ElecPowerUse$Global_active_power)

# A Histogram with red bars
# Change x axis label and title using xlab and main parameters
png("plot1.png", width=480, height=480)
hist(ElecPowerUse$Global_active_power, col="red", main= "Global Active Power", xlab= "Global Active Power (kilowatts)")
dev.off()