##Reading data
housePower<-read.table("./ArchivosR/household_power_consumption.txt",header = TRUE,sep=";",nrows=2075259)
##Setting dates from factor
housePower$Date<-as.Date(housePower$Date,format="%d/%m/%Y")
##Subsetting only the dates we need and removing full data
houseData<-subset(housePower,Date >="2007-02-01" & Date <="2007-02-02")
rm(housePower)
## as numeric for Global_active_power
houseData$Global_active_power<-as.numeric(houseData$Global_active_power)
## Plot hist
hist(houseData$Global_active_power, col="red",main = "Global Active Power", xlab="Global Active Power (kilowatts)")
##Copying hist as .png
dev.copy(png,file="plot1.png")
dev.off()
