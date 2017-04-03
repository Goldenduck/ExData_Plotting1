
my_data<-read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings = "?")
my_data$date_time<-paste(my_data$Date,my_data$Time,sep=" ")

my_data$date_time<-strptime(my_data$date_time,format="%d/%m/%Y %H:%M:%S")
my_data$Date<-as.Date(my_data$Date,"%d/%m/%Y")
data_in_use<-my_data[which(my_data$Date>='2007-02-01' & my_data$Date<='2007-02-02'),]
data_in_use$Global_active_power<-as.numeric(data_in_use$Global_active_power)

png("plot2.png", width=480, height=480)
plot(data_in_use$date_time,data_in_use$Global_active_power, ylab ="Global Active Power (Kilowatts)", xlab=" ",type="l" )
dev.off()
