##Create new directory Data##
if(!file.exists("data")){dir.create("data")}
##download the file using the download.file##
download.file(fileurl,destfile = "./data.zip",method ="auto")
##unzip the file##
unzip(zipfile="./data.zip",exdir="./dataset")
## read the data into R##
bp <- read.table(file.choose(),header = T,sep = ";",na.strings = "?")
# convert the date variable to "Date" class
bp$Date <- as.Date(bp$Date, format = "%d/%m/%Y")
##subset the entire data(bp) with Dates"
subsetbp <- subset(bp,subset = (Date>= "2007-02-01"&Date <= "2007-02-02"))
##Convertind dateTime Variables#
subsetbp$DateTime <- strptime(paste(subsetbp$Date,subsetbp$Time),"%Y-%m-%d %H:%M:%S")
subsetbp$DateTime <- as.POSIXct(subsetbp$DateTime)
##create a new Plot4.png file##
png(file = "plot4.png")
par(mfcol = c(2,2))##this is very important to this plot,Here I gave mfcol = c(2,2).it will first fills the first column and then goes to second column##
plot(DateTime,Global_active_power,type = "l",xlab = " ",ylab = "Global Active Power")##plot for c(1,1)##
##plot for c(2,1)##
plot(DateTime,Sub_metering_1, type = "l",xlab = " ",ylab = "Energy Sub metering")
lines(DateTime,Sub_metering_2,col='Red')
lines(DateTime,Sub_metering_3,col='blue')
legend("topright",lty =1,col = c("black","red","blue"),legend = c("Sub_metering_1","sub_metering_2","sub_metering_3"))
##plot for c(1,2)##
plot(DateTime,Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
##plot for c(2,2)##
plot(DateTime,Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()##close the png file device##

