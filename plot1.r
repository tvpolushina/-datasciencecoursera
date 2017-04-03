setwd("c:/_Practice/coursera/datascience/course 4. exploratory analysis")
data<-read.csv("household_power_consumption.txt",sep=";",as.is=T)
for (i in 3:9){
  data[,i]<-as.numeric(data[,i])}
dates <- data[,1]
times <- data[,2]
x <- paste(dates, times)
Date_time<-strptime(x, "%d/%m/%Y %H:%M:%S")

timefrom <- strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S")
timeto <- strptime("03/02/2007 00:00:01","%d/%m/%Y %H:%M:%S")
mydata<-intersect(which(Date_time>timefrom),which(Date_time<=timeto))

data2<-data[mydata,]
data2$new_date<-Date_time[mydata]
dim(data2)

png("plot1.png", bg="transparent",width = 700, height  =700, units ="px")
hist(data2$Global_active_power,col="red", xlab="Global active power (kilowattes)", main="Global active power")
dev.off()