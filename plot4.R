file.Name <- "household_power_consumption.txt"
file.path <- "~/R_Workspace/exploratory/ExData_Plotting1/"

#downlad and unzip file, if file doesn't exist
file.full <- paste(file.path,file.Name, sep="")
if(!file.exists(file.full)){
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","exploratory/ExData_Plotting1/householdpowerconsumption.zip",method = "curl")
      unzip("exploratory/ExData_Plotting1/householdpowerconsumption.zip",exdir = "exploratory/ExData_Plotting1/")
}

#read data
data.full <- read.csv(file.full, header = TRUE, sep = ";")

#format the data
data.full$Date <- as.Date(data.full$Date, format = "%d/%m/%Y")

#subset of data
data.small <- data.full[data.full$Date == "2007-02-01"| data.full$Date=="2007-02-02",]

#format the numeric field Global_active_power
data.small$Global_active_power <- as.numeric(as.character(data.small$Global_active_power))
data.small$Sub_metering_1 <- as.numeric(as.character(data.small$Sub_metering_1))
data.small$Sub_metering_2 <- as.numeric(as.character(data.small$Sub_metering_2))
data.small$Sub_metering_3 <- as.numeric(as.character(data.small$Sub_metering_3))
data.small$Voltage <- as.numeric(as.character(data.small$Voltage))
data.small$Global_reactive_power <- as.numeric(as.character(data.small$Global_reactive_power))

#set the png file
png(filename=paste(file.path,"plot4.png",sep=""),width = 480, height = 480, units = "px")
#set datetime
datetime <- strptime(paste(data.small$Date, data.small$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
#create the plot
par(mfrow=c(2,2))
#plot 1
plot(datetime,data.small$Global_active_power,type="l",xlab="",ylab="Global Active Power")
#plot 2
plot(datetime,data.small$Voltage,type="l",xlab="datetime",ylab="Voltage")
#plot 3
plot(datetime,data.small$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,data.small$Sub_metering_2,col="red",type="l")
lines(datetime,data.small$Sub_metering_3,col="blue",type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty=1,col=c("black","red","blue"),cex=0.75)
#plot 4
plot(datetime,data.small$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
#close the file
dev.off()