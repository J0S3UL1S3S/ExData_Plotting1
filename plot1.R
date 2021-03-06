# Exploratory Data Analysis-Project 1
# Plot 1

hpc <- read.table(file="household_power_consumption.txt",
    header = TRUE, sep=";")
str(hpc)
hpc$DataTime <- paste(hpc$Date, sep = " ", hpc$Time)
hpc$DataTime <- strptime(hpc$DataTime, "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

df1.hpc <- subset(hpc, hpc$Date=="2007-02-01" | hpc$Date =="2007-02-02")
df1.hpc$Global_active_power <- as.numeric(df1.hpc$Global_active_power)
hist(df1.hpc$Global_active_power,
 col="red", main="Global Active Power",
 xlab="Global Active Power(kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()