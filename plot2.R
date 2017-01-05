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
##create the new plot2.png in my working directory##
png(file = "plot2.png")
plot(DateTime,Global_active_power, type = "l",xlab = " ",ylab = "Global Active power(kilowatts)"##to get the plot as mentioned in course project##
dev.off()##cloase the png file##
