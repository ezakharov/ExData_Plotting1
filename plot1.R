
# main function
run <- function(inputdirname = "C:/Users/Ult/Documents/R/exdata_data_household_power_consumption") {
  file_path <- paste(inputdirname, "/household_power_consumption.txt", sep="")
  col_classes <- c("factor","factor", rep("numeric", 7))
  data1 <- read.table(file_path,sep=";", header = TRUE, colClasses = col_classes, na.strings = "?")
  data2 <- data1[data1$Date %in% c("1/2/2007","2/2/2007"), ]
  par(mfrow=c(1,1), mar = c(4,4,2,1))
  hist(data2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", ylim=c(0,1200), las=2)
  dev.copy(png, file="plot1.png")
  dev.off()
}