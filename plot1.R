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
png("plot1.png", width = 480, height = 480)
hist(household_power_consumption_data$Global_active_power,col = "red", main= "Global Active Power",xlab = "Global Active Power (Kilowats)" )





