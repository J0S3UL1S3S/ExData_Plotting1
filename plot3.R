# Exploratory Data Analysis-Project 1
# Plot 3

hpc <- read.table(file="household_power_consumption.txt",
    header = TRUE, sep=";")
str(hpc)
hpc$DataTime <- paste(hpc$Date, sep = " ", hpc$Time)
hpc$DataTime <- strptime(hpc$DataTime, "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

df1.hpc <- subset(hpc, hpc$Date=="2007-02-01" | hpc$Date =="2007-02-02")
df1.hpc$Sub_metering_1 <- as.numeric(df1.hpc$Sub_metering_1)
df1.hpc$Sub_metering_2 <- as.numeric(df1.hpc$Sub_metering_2)
df1.hpc$Sub_metering_3 <- as.numeric(df1.hpc$Sub_metering_3)

plot(df1.hpc$DataTime, df1.hpc$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(df1.hpc$DataTime, df1.hpc$Sub_metering_1)
lines(df1.hpc$DataTime, df1.hpc$Sub_metering_2, col="red")
lines(df1.hpc$DataTime, df1.hpc$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"),
  legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
