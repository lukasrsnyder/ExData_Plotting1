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


png(filename = "Plot2.png", width=480, height=480, bg="transparent")

# Create plot 2
plot(y=ls_data$Global_active_power, 
     x=ls_data$DateTime,
     ylab="Global Active Power (killowatts)", 
     xlab="",
     type="l")

# Close the PNG file device
dev.off()
