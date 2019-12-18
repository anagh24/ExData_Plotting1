# reading the required data from"household_power_consumption.txt" 

EPCdata <- read.table("household_power_consumption.txt",na.strings = "?", sep = ";", skip = 66637, nrows = 2880)


# this code section is used to  to convert the Date and Time variables to Date/Time classes

EPCdata[ ,1] <- as.Date(EPCdata[ ,1],format = "%d/%m/%Y")

t <- paste(as.Date(EPCdata$V1), EPCdata$V2)

EPCdata[ ,10] <- as.POSIXct(t)

# to display the plot

plot(EPCdata$V7 ~ EPCdata$V10, type="l", ylab="Global Active Power (kilowatts)", xlab="")

lines(EPCdata$V8 ~ EPCdata$V10,col='Red')

lines(EPCdata$V9 ~ EPCdata$V10,col='Blue')

# adding the legend

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# to store the plot in png file

dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()