#### Reading naming and subsetting comsumtion data ####

energy_dt2 <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, na.strings = "?")
subenergy_dt <- subset(energy_dt2,energy_dt2$Date == "1/2/2007" | energy_dt2$Date == "2/2/2007")
str(energy_dt2)
str(subenergy_dt)
#### Converting data time format####

subenergy_dt$Date <- as.Date(subenergy_dt$Date,format="%d/%m/%Y" )
subenergy_dt$Time <- strptime(subenergy_dt$Time,format = "%H:%M:%S")
subenergy_dt[1:1440,"Time"]<-format(subenergy_dt[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subenergy_dt[1441:2880,"Time"]<-format(subenergy_dt[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#### Plot functions with and legend #####
png("plot3.png")
plot(subenergy_dt$Time,subenergy_dt$Sub_metering_1,type = "l",xlab ="", ylab = "Energy sub metering")
lines(subenergy_dt$Time,subenergy_dt$Sub_metering_2,col = 2)
lines(subenergy_dt$Time,subenergy_dt$Sub_metering_3,col = "blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

