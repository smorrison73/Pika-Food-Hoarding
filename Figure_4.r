rm(list = ls())

library(pgirmess)
library(MASS)
library(rpart)

#import the data
survdata = read.csv("HPinitiation_survival.csv", na.strings="unknown")

#show data, display variable names, attach
names(survdata); attach(survdata)

sex=factor(sex, labels=c("m", "f")); is.factor(sex)
age=factor(age, labels=c("a", "j")); is.factor(age)
year=factor(year, labels=c("2004", "2005")); is.factor(year)
surv=factor(surv, labels=c("1", "0")); is.factor(surv)

####################################################
#                   MAKE TREES                     #
####################################################
## make the tree model
tree.1=rpart(lived_died~as.numeric(julian)+as.factor(age)+as.factor(year)+as.factor(sex), cp=0.0000000001, minsplit=10)

#print and plot the cp statistics to determine tree size (where xerror is minimized)
printcp(tree.1)
plotcp(tree.1)

#Display and plot tree details
tree.1
plot(tree.1, margin=.10)
text(tree.1)

#Prune the tree by using cp statistic
tree.1.pruned = prune.rpart(tree.1, cp=0.1)

#Display and plot pruned tree
tree.1.pruned
plot(tree.1.pruned)
text(tree.1.pruned)

#Save the pruned tree as a PDF
pdf(file="Figure_4.pdf", height=4, width=4)
par(mfrow = c(1, 1),mar=c(4,4,4,4)+0.2, pty = "m", cex=0.75)
plot(tree.1.pruned, margin=0.1); text(tree.1.pruned)
dev.off()

#calculate confusion matrix for pruned tree
(tt=table(actual=survdata$lived_died,predicted=predict(tree.1.pruned, type="class")))

#calculate the error rate for pruned tree
1-sum(diag(tt))/sum(tt)