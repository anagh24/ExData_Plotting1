# reading the required data from"household_power_consumption.txt" 

EPCdata <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", skip = 66637, nrows = 2880)


# creating the required histogram frequency plot of "Global Active power"  for the given household for a interval of 2 days(2007-02-01 and 2007-02-02)

hist(EPCdata$V3, col = rgb(1,0.2,0), main = "Global Active Power",xlab = "Global Active Power (killowatts)", ylab = "Frequency")



#for creating the above flot in plot1.png file

# opening png file of name "plot1.png" with width = 480 and height = 480

png("plot1.png", width=480, height=480)

# creating the plot in the png file

hist(EPCdata$V3, col = rgb(1,0.2,0), main = "Global Active Power",xlab = "Global Active Power (killowatts)", ylab = "Frequency")

#closing the file

dev.off()