data<-read.csv("c:/_Practice/coursera/datascience/course 4. exploratory analysis/household_power_consumption.txt",sep=";",as.is=T)
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


png("plot3.png", bg="transparent",width = 700, height  =700, units ="px")
plot(data2$new_date, data2$Sub_metering_1, col="black", type="l", ylab="Energe sub meters", xlab="",ylim=c(0,40))
points(data2$new_date,data2$Sub_metering_2, col="red",type="l")
points(data2$new_date,data2$Sub_metering_3, col="blue",type="l")
legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  lwd = 1,
       cex = 1.1)
dev.off()