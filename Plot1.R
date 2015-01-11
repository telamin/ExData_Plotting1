plot1.R

## we need to read the complete dataset which has almost 3 million obs and 9 variables(columns)
data_all <- read.csv("C://Users//abdu//Desktop//explore//household_power_consumption.txt", header=T, sep=';', na.strings="?",
nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")
## partition the data so that we have only  data from feb2007(2days)
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)
## then  Converting dates as recommended
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
## Plot 1
hist(data$Global_active_power, main="Global Active Power",
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Saving to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()