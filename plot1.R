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

#set the png file
png(filename=paste(file.path,"plot1.png",sep=""),width = 480, height = 480, units = "px")

#create the histogram
hist(data.small$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()