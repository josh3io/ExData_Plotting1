require(data.table)
DT <- data.table(read.table("household_power_consumption.txt",sep=";",header=TRUE))

date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

DT$date_obj <- as.Date(as.character(DT$Date),format="%d/%m/%Y")

graph_data <- DT[DT$date_obj %in% c(date1,date2),]

png(filename="plot1.png")
hist(as.numeric(as.character(graph_data$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
