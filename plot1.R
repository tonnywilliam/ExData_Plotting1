library(data.table)
file<-"c:/users/Tonny/Downloads/household_power_consumption.txt"
d<-fread(file)
d1<-d[Date=="2/2/2007"|Date=="1/2/2007"]
d1[,datetime:=paste(Date,Time)]
d1$datetime<-as.POSIXct(d1$datetime,"%d/%m/%Y %H:%M:%S",tz="GMT")
d1$Global_active_power<-as.numeric(d1$Global_active_power)
par(mar=c(4,4,1,1))
hist(d1$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,"plot1.png")
dev.off()
