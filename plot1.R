# This R script creates the first plot (plot1.png) based on 
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

#plot1.png
png(filename = "plot1.png", width=480, height=480)
hist(hpc_data3$Global_active_power, 
     col = "red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
