
###############################################   
# Histogram of Global Active Power(Killowats)#     
###############################################

### Download the data from https://d396qusza40orc.cloudfront.net/
###    exdata%2Fdata%2Fhousehold_power_consumption.zip 
### and then unzipped

work_dir="C:/Users/KAUSHIK/Desktop/Assignment"
# set working directory to your working folder where data is available
setwd(work_dir)

# Read data, Its will take 15 seconds
data <- read.table('household_power_consumption.txt', sep=';', header=T,
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')

# convert dates and subset on two days in February 2007
data$DateTime <- strptime(paste(data$Date, data$Time), 
                          "%d/%m/%Y %H:%M:%S")
data <- subset(data, 
       as.Date(DateTime) >= as.Date("2007-02-01") & 
           as.Date(DateTime) <= as.Date("2007-02-02"))


# call plot device plot1.png
png("plot1.png", height=480, width=480)

# create histogram
hist(data$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')


dev.off()  # Close graphic device

