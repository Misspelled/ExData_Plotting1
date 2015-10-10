# Plot 1, Assignment 1, Exploratory Data Analysis

# reset par options

par(mfcol=c(1,1))

# read data if hasn't been loaded to memory already

if(!exists("pwrplt")) { 
    pwr <- read.table("power.txt", header = TRUE, sep = ";"
                  , stringsAsFactors = FALSE, row.names = NULL, na.strings = "?",colClasses = 
                      c("character","character","numeric",
                        "numeric","numeric","numeric","numeric",
                        "numeric","numeric"), nrows=2100000)
    pwr$Date2 <- as.Date(pwr$Date, format = "%d/%m/%Y")
    pwrplt <- subset(pwr, subset= Date2 >= "2007-02-01" & Date2 < "2007-02-03")
    pwrplt$Date <- as.POSIXct(paste(pwrplt$Date, pwrplt$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
    pwrplt$Date2 <- NULL
    pwrplt$Time <- NULL
    rm(pwr)
} 

# make plot

png(file = "plot1.png", bg = "white", width = 480, height = 480)
with(pwrplt, hist(Global_active_power
                  , col = "red", bg="grey"
                  ,main = "Global Active Power"
                  ,xlab = 'Global Active Power (kilowatts)'))
dev.off()
