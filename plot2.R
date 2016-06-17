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
##plot
plot(houseData$Global_active_power~houseData$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
##png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()