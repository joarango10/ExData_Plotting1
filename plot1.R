plot1 <- function(){

## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2 days 02/01/2007 and  02/02/2007 
## 3. generate a histogram of global active power (kilowatts)

## read data
  powerdata <- read.table("C:/Users/Administrator/Desktop/ExData_Plotting1/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep=";")
  
## change the class of all the columns to correct each column
  powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
  powerdata$Time <- format(powerdata$Time, format="%H:%M:%S")
  powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
  powerdata$Global_reactive_power <- as.numeric(powerdata$Global_reactive_power)
  powerdata$Voltage <- as.numeric(powerdata$Voltage)
  powerdata$Global_intensity <- as.numeric(powerdata$Global_intensity)
  powerdata$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
  powerdata$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
  powerdata$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)
  
  ## subset data from 02/01/2007 and 02/02/2007
  
  subsetdata <- subset(powerdata, Date =="2007-02-01" | Date == "2007-02-02")
  
  ## plot histogram of global active power for those 2 days
  png("plot.png", width=480, height=480)
  hist(subsetdata$Global_active_power, col="red", border="black", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab ="Frequency")
  dev.off()     
}

