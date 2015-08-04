# This R script creates the third plot (plot3.png) based on 
# household_power_consumption.txt obtained from UC Irvine Machine Learning Repository
# Warning: the read.table function reads a relatively heavy file.

library(dplyr)
setwd("C:/R 2015/Course04/project1")
hpc_data <- read.table("household_power_consumption.txt", 
                       header=TRUE,
                       sep=";", 
                       na.strings = "?");
hpc_data$Date <- as.Date(hpc_data$Date, format = "%d/%m/%Y")
hpc_data2 <- filter(hpc_data, Date == "2007-02-01" | Date == "2007-02-02")
hpc_data3 <- tbl_df(hpc_data2)
rm(list=c("hpc_data","hpc_data2"))
date_time <- paste(hpc_data3$Date, hpc_data3$Time)
hpc_data3$Time <- strptime(date_time, "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)
plot(hpc_data3$Time, hpc_data3$Sub_metering_1,type="l", col ="black",
     ylab = "Energy sub metering", xlab = "")
lines(hpc_data3$Time, hpc_data3$Sub_metering_2, col="red")
lines(hpc_data3$Time, hpc_data3$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), lwd = 1)
dev.off()
