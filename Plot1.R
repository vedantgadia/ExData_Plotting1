#Reading the data from the file and assigning classes at the same time.
my_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), colClasses = c("character", "character", "numeric", "numeric", "numeric","numeric", "numeric", "numeric","numeric"))

#Merging Date and Time into one entity by using strptime.
#Filtring data according to the dates asked.
my_data <- with(subset(my_data, Date == "1/2/2007" | Date == "2/2/2007"),data.frame(Timestamp = strptime(paste(Date, Time),format = "%d/%m/%Y %H:%M:%S"),Global_active_power, Global_reactive_power, Voltage,Global_intensity, Sub_metering_1, Sub_metering_2,Sub_metering_3))

#Opening a Graphics Device in mac
quartz()

#Plot1
#A histogram of Global Active Power

hist(my_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

#COpying the plot and saving as a png file
dev.copy(png, filename = "Plot1.png")

#Closing the Graphics Device
dev.off()
