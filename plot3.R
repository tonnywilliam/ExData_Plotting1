library(data.table)
file<-"c:/users/Tonny/Downloads/household_power_consumption.txt"
d<-fread(file)
d1<-d[Date=="2/2/2007"|Date=="1/2/2007"]
d1[,datetime:=paste(Date,Time)]
d1$datetime<-as.POSIXct(d1$datetime,"%d/%m/%Y %H:%M:%S",tz="GMT")
d1$Global_active_power<-as.numeric(d1$Global_active_power)
par(mar=c(4,4,1,1))
plot(d1$datetime,d1$Sub_metering_1,type ="l",xlab="",ylab="Energy sub metering")
points(d1$datetime,d1$Sub_metering_2,type ="l",col="red")
points(d1$datetime,d1$Sub_metering_3,type ="l",col="blue")
legend("topright",legen=c("Sub_metering_1","Sub_metering_3","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1))
dev.copy(png,"plot3.png")
dev.off()
