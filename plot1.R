library(anytime)

my_data<-read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings = "?")



my_data$Date<-as.Date(my_data$Date,"%d/%m/%Y")
my_data$Time<-strptime(my_data$Time,format = "%HH:%MM:%SS")
my_data$Date<-anytime(as.factor(my_data$Date))
my_data$Time<-anytime(as.factor(my_data$Time))


data_in_use<-my_data[which(my_data$Date>='2007-02-01' & my_data$Date<='2007-02-02'),]
data_in_use$Global_active_power<-as.numeric(data_in_use$Global_active_power)

png("plot1.png", width=480, height=480)

hist(data_in_use$Global_active_power,main = "Global Active Power",col="red",xlab="Global Active Power (Kilowatts)")

dev.off()