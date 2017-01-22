
# main function
run <- function(inputdirname = "C:/Users/Ult/Documents/R/exdata_data_household_power_consumption") {
  Sys.setlocale("LC_ALL","English_United States.1252")
  file_path <- paste(inputdirname, "/household_power_consumption.txt", sep="")
  col_classes <- c("factor","factor", rep("numeric", 7))
  data1 <- read.table(file_path,sep=";", header = TRUE, colClasses = col_classes, na.strings = "?")
  data2 <- data1[data1$Date %in% c("1/2/2007","2/2/2007"), ]
  dt1 <- paste(data2$Date, data2$Time)
  dt3 <- as.POSIXct(strptime(dt1, "%d/%m/%Y %H:%M:%S",tz='GMT'))
  data3 <- data.frame(dt3, data2$Global_active_power)
  plot(data3, xaxt="n",type = "o", pch=27, ylab = "Global Active Power (kilowatts)",xlab = "")
  axis.POSIXct(side=1, at=cut(data3$dt3, "days"), format="%a") 
  dev.copy(png, file="plot2.png")
  dev.off()
}