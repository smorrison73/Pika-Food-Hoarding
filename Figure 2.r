#read data into R
haytrip = read.csv("hayratedata.csv")
names(haytrip); attach(haytrip)
se=function(x) sqrt(var(x)/length(x))

times = ordered(c("0-1","1-2","2-3","3-4","4-5","5-6","6-7","7-8","8-9","9-10","10-11","11-12","12-13","13-14","14-15","15-16","16-17","17-18","18-19","19-20","20-21","21-22","22-23","23-24"))

month=ordered(c("June","July","August"))

June05 = subset(haytrip, month == "June", select = month:tripshr)
July05 = subset(haytrip, month == "July", select = month:tripshr)
August05 = subset(haytrip, month == "August", select = month:tripshr)

#Initiate a PDF file
pdf(file="hayrate_June_July_August.pdf", height=10.5, width=10)

#Set up plot environment for 1 column and 3 rows
par(mfrow = c(3, 1), mar=c(4,4,2,0)+0.2, pty = "m", cex=0.75) #mar(bottom, left, right, right)

#Create boxplot for June
boxplot(tripshr ~ time, data = June05, ylab = ("Trips per Hour"), xlab="Time of Day (24-hr clock)",ylim=c(0, 25), col = "skyblue", las=1)
text(2,20, "JUNE", cex=2)
text(2,15, "7 pikas", cex=.75)
text(2,13, "220 hours", cex=.75)

#Create boxplot for July
boxplot(tripshr ~ time, data = July05, ylab = ("Trips per Hour"), xlab="Time of Day (24-hr clock)",ylim=c(0, 25), col = "skyblue", las=1)
text(2,20, "JULY", cex=2)
text(2,15, "6 pikas", cex=.75)
text(2,13, "282 hours", cex=.75)

#Create boxplot for August
boxplot(tripshr ~ time, data = August05, ylab = ("Trips per Hour"), xlab="Time of Day (24-hr clock)",ylim=c(0, 25), col = "skyblue", las=1)
text(2,20, "AUGUST", cex=2)
text(2,15, "5 pikas", cex=.75)
text(2,13, "294 hours", cex=.75)
dev.off()