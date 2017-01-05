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
##Creating the Plot1##
png(file = "plot1.png")##creates "plot1.png" in my working Directory##
hist(Global_active_power,main = "Global Active Power",xlab = "Global Active Power(kilowats)",ylab= "frequency",col = "red")##Creates plot1 Histogram##
dev.off()##closes the png file device##
