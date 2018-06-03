#Reading the data from the file and assigning classes at the same time.
my_data <- read.table("/Users/vedantgadia/Documents/R-Coursera/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), colClasses = c("character", "character", "numeric", "numeric", "numeric","numeric", "numeric", "numeric","numeric"))

#Merging Date and Time into one entity by using strptime.
#Filtring data according to the dates asked.
my_data <- with(subset(my_data, Date == "1/2/2007" | Date == "2/2/2007"),data.frame(Timestamp = strptime(paste(Date, Time),format = "%d/%m/%Y %H:%M:%S"),Global_active_power, Global_reactive_power, Voltage,Global_intensity, Sub_metering_1, Sub_metering_2,Sub_metering_3))


setwd("/Users/vedantgadia/Documents/GitHub/ExData_Plotting1/")
#Opening a Graphics Device in mac
quartz()

#Plot2
#Plot of Global Active Power vs Timestamp
plot(my_data$Timestamp, my_data$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")

#COpying the plot and saving as a png file
dev.copy(png, filename = "Plot2.png")

#Closing the Graphics Device
dev.off()

setwd("/Users/vedantgadia/Documents/R-Coursera/")
