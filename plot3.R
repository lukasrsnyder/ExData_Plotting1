##download data
download.file(url      = "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "Household Power Consumption.zip")

##Read in the data
ls_data <- read.table(unz("Household Power Consumption.zip", "household_power_consumption.txt"),
                      sep = ";",
                      na.strings = "?", 
                      header=TRUE)

##Subset to just what we want
ls_data <- subset(ls_data, Date %in% c("1/2/2007", "2/2/2007"))
##Convert date and time to date variables
ls_data$Date=as.Date(ls_data$Date, format = "%d/%m/%Y")
ls_data$Time=as.Date(ls_data$Time, format = "%H:%M:%S")



# Create Date/Time stamp
ls_data$DateTime <- strptime(paste(ls_data$Date, 
                                   ls_data$Time), 
                             format="%Y-%m-%d %H:%M:%S",
                             tz="EST")

##Create plat 3
png(filename = "Plot3.png", width=480, height=480, bg="transparent")


plot (y=ls_data$Sub_metering_1, 
      x=ls_data$DateTime, 
      ylab="Energy sub metering", 
      xlab="",
      type="l", 
      col="black")
lines(y=ls_data$Sub_metering_2, 
      x=ls_data$DateTime,
      ylab="Energy sub metering", 
      xlab="",
      type="l", 
      col="red")
lines(y=ls_data$Sub_metering_3,
      x=pc_data$DateTime, 
      ylab="Energy sub metering",
      xlab="",
      type="l", 
      col="blue")
legend("topright", 
       legend=c("Sub_metering_1", 
                "Sub_metering_2", 
                "Sub_metering_3"), 
       col=c("black", "red", "blue"), 
       lty=c(1,1))

# Close the PNG file device
dev.off()