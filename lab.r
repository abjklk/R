data(women)
ls(women)
ht=women$height
wt=women$weight
#scatter plot
plot(ht,wt)
plot(ht,wt,main="scatter plot of ht and wt",xlab="ht",ylab="wt")
cor(ht,wt) #correlation
hrs=c(10,15,12,20,8,16,14,22)
scores=c(92,81,84,74,85,80,84,80)
plot(hrs,scores)
cor(hrs,scores)
#linear regression lm(y~x) gives relation y on x. x->indep.
plot(hrs,scores,abline(lm(scores~hrs),col="blue",lwd=2),pch=17,col=2)

x=c(12,13,10,9,20,7,4,22,15,23)
y=c(50,54,48,47,70,20,15,40,35,37)
plot(x,y)
cor(x,y)
mod=lm(wt~ht)
plot(ht,wt,main="regression line wt on ht",pch=16,abline(mod),col="blue")
print(mod) #slope and y-intercept
summary(mod)
fitted(mod,wt)#expected value

a=data.frame(ht=c(50,60))
result=predict(mod,a)
print(result)

#LP4
sales=c(10,11,13,15,16,19,14)
exp=c(60,62,65,70,73,75,71)
plot(sales,exp)
cor(sales,exp)

mod1=lm(sales~exp)
b=data.frame(exp=90)
predict(mod1,b)

mod2=lm(exp~sales)
b=data.frame(sales=25)
predict(mod2,b)

#multiple regression
data(mtcars)
ls(mtcars)

mod=lm(mpg~.,data=mtcars)
summary(mod)


input=mtcars[,c('mpg','disp','hp','wt')]
print(head(input))
model=lm(mpg~disp+hp+wt,data=input)
summary(model)
print(model)
#or better
model1=lm(mpg~hp+wt,data=mtcars)
print(model1)
summary(model1)

a=data.frame(disp=221,hp=102,wt=2.91)
b=data.frame(disp=0,hp=102,wt=2.91)
predict(model,a)
predict(model,b)

#LP9
x1=c(4,7,9,12)
x2=c(1,2,5,8)
y=c(7,12,17,20)
model=lm(y~x1+x2)
summary(model)
fitted(model,y)

#Logistic Regression
#glm - generalized linear model
beaver2
dat=subset(beaver2,select = c(temp,activ))
dat
logr_activ=glm(activ~temp,data=dat,family = binomial)
print(logr_activ)
summary(logr_activ)
#or
lofr_activ=glm(activ~temp,data=dat,family=binomial(link = ))
print(lofr_activ)
plot(beaver2$temp,beaver2$activ,xlab="temp",ylab="probability of active")
points(beaver2$temp,fitted(logr_activ),pch=10,col="blue")
curve(predict(logr_activ,data.frame(temp=x),type="response"),add=TRUE,lwd=3)
a=data.frame(temp=c(33,38))
predict(logr_activ,a,type="response")

#----------
data(mtcars)
dat=subset(mtcars,select=c(mpg,am,vs))
dat

logr_vm=glm(vs~mpg,data=dat,family=binomial)
logr_vm

#libraries
library(ggplot2) #didnt work

#newlab
#classification method
install.packages(RWeka)
library("RWeka")
library(party)
buys=read.csv("Electronics.csv")
buys
summary(buys)
str(buys)
m1=J48(Buys_Computer~.,data=buys)
plot(m1)
summary(m1)

newdata=data.frame(Age="<=30",Income="M",Student="y",Credit_Rating="F")
predict(m1,newdata,type="probability")
newdata2=data.frame(Age=">40",Income="M",Student="y",Credit_Rating="F")
predict(m1,newdata2,type="prob")

library(e1071)
m2=naiveBayes(Buys_Computer~.,data=buys)
m2
newdata2=data.frame(Age=">40",Income="M",Student="y",Credit_Rating="F")
newdata=data.frame(Age="<=30",Income="M",Student="y",Credit_Rating="F")
predict(m1,newdata1)
mod1= C5.0(Buys_Computer~.,data=buys)
plot(mod1)
summary(mod1)
C5imp(mod1,metric='usage')


colors=read.csv("colors.csv")
library(RWeka)
summary(colors)
m2=J48(Shape~.,data=colors)
plot(m2)
m2=C5.0(Shape~.,data=colors)
plot(m2)
data()
weather=WeatherPlay
summary(weather)
m1=J48(play~.,data=weather)
plot(m1)

