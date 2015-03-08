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

##Plot the hist and save to .png file
png("plot1.png", bg = "transparent")
with(ls_data, 
     hist(Global_active_power,
          breaks = 12,
          col = "red",
          main =  "Global Active Power",
          xlab = "Global Active Power (kilowatts)")
)
dev.off()