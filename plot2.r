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

png("plot2.png", bg="transparent",width = 700, height  =700, units ="px")
with(data2, plot(new_date,Global_active_power , xlab="",ylab="Global active power (kilowattes)", xaxt="n",  main="Global active power",type="l"))
axis.POSIXct(1,  at=seq(min(data2$new_date), max(data2$new_date), by="1 day"), cex.axis = .7,las=3)
dev.off()
