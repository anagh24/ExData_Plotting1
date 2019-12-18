# reading the required data from"household_power_consumption.txt" 

EPCdata <- read.table("household_power_consumption.txt",na.strings = "?", sep = ";", skip = 66637, nrows = 2880)


# this code section is used to  to convert the Date and Time variables to Date/Time classes

EPCdata[ ,1] <- as.Date(EPCdata[ ,1],format = "%d/%m/%Y")

t <- paste(as.Date(EPCdata$V1), EPCdata$V2)

EPCdata[ ,10] <- as.POSIXct(t)

# setting up the global graphics parameter

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))



with(EPCdata, {
  
  # plotting the "Global Active Power" VS 2-days plot at [1,1] position
  
  plot(V3 ~ V10, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  # plotting the "Voltage" VS 2-days plot at [1,2] position
  
  plot(V5 ~ V10, type="l", ylab="Voltage (volt)", xlab="")
  
  # plotting the "Global Active Power (submetering_1,submetering_2,submetering_3)" VS 2-days plot at [2,1] position
  
  plot(V7 ~ V10, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  lines(V8 ~ V10,col='Red')
  
  lines(V9 ~ V10,col='Blue')
  
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  # plotting the "Global Reactive Power" VS 2-days plot at [2,2] position
  
  plot(V4 ~ V10, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
  
})

# to store the plot in png file

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()







