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
##Create the new file plot3.png ##
png(file = "plot3.png")
plot(DateTime,Sub_metering_1, type = "l",xlab = " ",ylab = "Energy Submerging")##create the plot with sub_metering_1#
##add the lines of sub_metering_2,Sub_metering_3##
lines(DateTime,Sub_metering_2,col='Red')
lines(DateTime,Sub_metering_3,col='blue')
##add the legend to plot##
legend("topright",lty =1,col = c("black","red","blue"),legend = c("Sub_metering_1","sub_metering_2","sub_metering_3"))
dev.off()##closes the png file##