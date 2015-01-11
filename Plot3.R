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
## Plot 3
with(data, {
plot(Sub_metering_1~Datetime, type="l",
ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()