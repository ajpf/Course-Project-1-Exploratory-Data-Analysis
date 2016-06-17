##Reading data
housePower<-read.table("./ArchivosR/household_power_consumption.txt",header = TRUE,sep=";",nrows=2075259)
##Setting dates from factor
housePower$Date<-as.Date(housePower$Date,format="%d/%m/%Y")
##Subsetting only the dates we need and removing full data
houseData<-subset(housePower,Date >="2007-02-01" & Date <="2007-02-02")
rm(housePower)
## as numeric for Global_active_power
houseData$Global_active_power<-as.numeric(houseData$Global_active_power)

## Creating Dates and Time
datetime <- paste(as.Date(houseData$Date), houseData$Time)
houseData$Datetime <- as.POSIXct(datetime)
##Converting to numeric
houseData$Sub_metering_1 <- as.numeric(houseData$Sub_metering_1)
houseData$Sub_metering_2<- as.numeric(houseData$Sub_metering_2)
houseData$Sub_metering_3 <- as.numeric(houseData$Sub_metering_3)
houseData$Voltage <- as.numeric(houseData$Voltage)
houseData$Global_reactive_power <- as.numeric(houseData$Global_reactive_power)



## Making plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(houseData, {plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

# png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()