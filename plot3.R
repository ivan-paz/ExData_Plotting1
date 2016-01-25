#Download data from the UCI repository
#Uncomment the folowing lines to download the data
#url<-"https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
#download.file(url,"household_power_consumption.zip",method = "curl")
#unzip("household_power_consumption.zip")


#Read data,
household_power_consumption_data <- read.table("household_power_consumption.txt", sep = ';', stringsAsFactors = FALSE, head=TRUE)
#Cutting Data
household_power_consumption_data <-subset(household_power_consumption_data, Date == "1/2/2007" | Date == "2/2/2007")
household_power_consumption_data$Date <- paste(household_power_consumption_data$Date,household_power_consumption_data$Time)
household_power_consumption_data$Date<-strptime(household_power_consumption_data$Date,"%d/%m/%Y %H:%M:%S")




#Plotting
household_power_consumption_data$Global_active_power<-as.numeric(household_power_consumption_data$Global_active_power)
household_power_consumption_data$Sub_metering_1<-as.numeric(household_power_consumption_data$Sub_metering_1)
household_power_consumption_data$Sub_metering_2<-as.numeric(household_power_consumption_data$Sub_metering_2)
household_power_consumption_data$Sub_metering_3<-as.numeric(household_power_consumption_data$Sub_metering_3)




png("plot3.png", width = 480, height = 480,units = "px")
plot(household_power_consumption_data$Date, household_power_consumption_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(household_power_consumption_data$Date, household_power_consumption_data$Sub_metering_2, type = "l", col = "red")
lines(household_power_consumption_data$Date, household_power_consumption_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend  = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd = 1)
dev.off()




