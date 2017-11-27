library(pgirmess)
library(MASS)

#import the data
cumul04 = read.csv("hp-cumulative2004.csv")
cumul05 = read.csv("hp-cumulative2005.csv")

#show data, display variable names, attach
names(cumul04);head(cumul04); names(cumul05);head(cumul05)


pdf(file="Figure_1.pdf", height=8, width=5)
#par(mfrow = c(2, 1),mar=c(4,4,0,2)+0.2, pty = "m", cex=1)


#Set up plot environment for 1 column and 3 rows
par(mfrow = c(2, 1), mar=c(4,4,2,0)+0.2, pty = "m", cex=0.75) #mar(bottom, left, right, right)

attach(cumul04)
plot(julian,ad.cum, ylab="Cumulative Percent", xlab="Day of Year", las=1,pch=".")

lines(julian,ad.cum,lty=1)
lines(julian,juv.cum,lty=3)
text(170,90,"A) 2004")
text(165,40,"Adult",cex=0.75)
text(205,40,"Juvenile",cex=0.75)
detach(cumul04)

attach(cumul05)
plot(julian,ad.cum, type="n", ylab="Cumulative Percent",xlab="Day of Year", las=1)

lines(julian,ad.cum,lty=1)
lines(julian,juv.cum,lty=3)
abline(v=213, lty=4)
text(219, 15,"Day 213",cex=0.75)
text(170,90,"B) 2005")
text(180,30,"Adult",cex=0.75)
text(205,35,"Juvenile",cex=0.75)
detach(cumul05)
dev.off()