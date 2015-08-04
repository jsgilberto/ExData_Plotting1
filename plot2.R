# This R script creates the second plot (plot2.png) based on 
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

png(filename = "plot2.png", width=480, height=480)
plot(hpc_data3$Time, hpc_data3$Global_active_power, 
     type="l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")
dev.off()
