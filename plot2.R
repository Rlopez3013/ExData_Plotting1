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
#### Basic Plot ####
png("plot2.png")
plot(subenergy_dt$Time,subenergy_dt$Global_active_power,type = "l",ylab = "Global Active Power",xlab = "Time")
dev.off()