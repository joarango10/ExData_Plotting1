
plot2 <- function(){
  ## Aim of this function is to 
  ## 1. read the household_power_consumption.txt file
  ## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
  ## 3. generate a plot of global active power vs. time
  
  ## Parameters: none
  ## Assumes household_power_consumption.txt file located in working dir
  

  data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
  data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
  datetime <- paste(as.Date(data1$Date), data1$Time)
  data1$Datetime <- as.POSIXct(datetime)
  
  ## Plot 2
  with(data1, {
    plot(Global_active_power~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
  })
}

