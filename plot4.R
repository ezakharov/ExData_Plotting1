

# main function
run <- function(inputdirname = "C:/Users/Ult/Documents/R/exdata_data_household_power_consumption") {
  Sys.setlocale("LC_ALL","English_United States.1252")
  file_path <- paste(inputdirname, "/household_power_consumption.txt", sep="")
  col_classes <- c("factor","factor", rep("numeric", 7))
  data1 <- read.table(file_path,sep=";", header = TRUE, colClasses = col_classes, na.strings = "?")
  data2 <- data1[data1$Date %in% c("1/2/2007","2/2/2007"), ]
  dt1 <- paste(data2$Date, data2$Time)
  #top-left
  dt3 <- as.POSIXct(strptime(dt1, "%d/%m/%Y %H:%M:%S",tz='GMT'))
  data3 <- data.frame(dt3, data2$Global_active_power)
  #bottom-left
  data4 <- data.frame(dt3, data2$Sub_metering_1)
  #top-right
  data5 <- data.frame(dt3, data2$Voltage)
  #bottom-right
  data6 <- data.frame(dt3, data2$Global_reactive_power)
  
  par(mfrow=c(2,2), mar = c(4,4,2,1))
  with (data3, {
    #top-left
    plot(data3, xaxt="n",type = "o", pch=27, ylab = "Global Active Power",xlab = "")
    axis.POSIXct(side=1, at=cut(data3$dt3, "days"), format="%a") 
    #top-right
    plot(data5, xaxt="n",type = "o", pch=27, ylab = "Voltage",xlab = "datetime")
    axis.POSIXct(side=1, at=cut(data3$dt3, "days"), format="%a") 
    #bottom-left
    plot(data4, xaxt="n",type = "l", pch=27, ylab = "Energy sub metering",xlab = "")
    lines(data4$dt3,data2$Sub_metering_2,col="red")
    lines(data4$dt3,data2$Sub_metering_3,col="blue")
    axis.POSIXct(side=1, at=cut(data3$dt3, "days"), format="%a") 
    legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    #bottom-right
    plot(data6, xaxt="n",type = "o", pch=27, ylab = "Global_rctive_power",xlab = "datetime")
    axis.POSIXct(side=1, at=cut(data3$dt3, "days"), format="%a") 
  })
  dev.copy(png, file="plot4.png")
  dev.off()
}