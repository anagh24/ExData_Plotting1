# reading the required data from"household_power_consumption.txt" 

EPCdata <- read.table("household_power_consumption.txt",na.strings = "?", sep = ";", skip = 66637, nrows = 2880)


# this code section is used to  to convert the Date and Time variables to Date/Time classes

EPCdata[ ,1] <- as.Date(EPCdata[ ,1],format = "%d/%m/%Y")

t <- paste(as.Date(EPCdata$V1), EPCdata$V2)

EPCdata[ ,10] <- as.POSIXct(t)

# to display the plot

plot(EPCdata$V3 ~ EPCdata$V10, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# to store the plot in png file

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()