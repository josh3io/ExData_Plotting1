require(data.table)
require(ggplot2)

names <- strsplit(readLines("household_power_consumption.txt",n=1),";")

DT <- data.table(t(sapply(strsplit(grep("^2/2/2007|^1/2/2007",readLines("household_power_consumption.txt"),value=TRUE),";"),c)))
setnames(DT,names(DT),names[[1]])

DT$pos_obj <-as.POSIXct(strptime(as.character(paste(DT$Date,DT$Time,sep=" ")),format="%d/%m/%Y %H:%M:%S"))

graph_data <- data.table(Global_active_power=DT$Global_active_power,Date=DT$pos_obj)

png(filename="plot3.png")


plot(DT$pos_obj,DT$Sub_metering_1,type="line",xlab="",ylab="Global Active Power(kilowatts)")
lines(DT$pos_obj,DT$Sub_metering_2,col="red")
lines(DT$pos_obj,DT$Sub_metering_3,col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
