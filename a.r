if(1==0)
{
  print("true")
}else     #needs to be in same line
{
  print("no")
}


x<- 1:10
ifelse(x<5|x>8,x,0)

a=c(1,2,3,4)
ifelse(a%%2==0,"even","odd")


x<-c("what","is","truth")
if("Truth" %in% x){
  print("truth exists")
}else if("is" %in% x){
  print("is exists")
}else{
  print("no truth ):")
}

print(a)

vec<-c("hi","hello")
for(val in vec){
    print(val)
}  

z=0
while(z<5){
  z=z+1
  print(z)
}

x="hello"
switch(x,"hello"={print("apple")},"hi"={print("no")})
print(seq(69,420)) #sequence
print(mean(1:9))  #mean
print(sum(1:5))   #sum of n numbers

num = as.integer(readline(prompt="enter a num")) #readline
if(num>=18)
{
  print("eligible")
}else
{
  print("NO")
}


#simple calculator
a=as.integer(readline(prompt="enter 1st num"))
b=as.integer(readline(prompt="enter 2nd num"))
num = as.integer(readline(prompt="enter choice 1.add 2.sub 3.mul -.div"))

if(num==1)
{
  print(a+b)
}else if(num==2){
  print(a-b)
}else if(num==3)
{
  print(a/b)
}else{
  print(a*b)
}

#readcsv
#-x-x-x-x-xx-x-x--x-x-x-x-x-x-x-xSession 3-x-x-xx-x-x-x--x-x--x-x-x-x-x--x-x--x-x-x-x--x-x-x-x-
my_data=read.csv(file="c:/Users/01fe17bcs246/Desktop/lab2.csv")
print(is.data.frame(my_data))
print(ncol(my_data))
print(nrow(my_data))
sal<-max(my_data$salary)
#average_salary
avg_sal<-mean(my_data$salary)
#selects tuple of max salary person
reval=subset(my_data,salary==max(salary))
retval=subset(my_data,as.Date(start_date)>as.Date("2014-01-01"))
letters[1:10]
#writing to csv
write.csv(retval,"output.csv")
newdata=read.csv("output.csv")
#to drop csv
write.csv(retval,"output.csv",row.names=FALSE)
newdata=read.csv("output.csv")

#extracting 3 columns
modifiedData=my_data[c(1,3)]
write.csv(modifiedData,file="MyInfo.csv")

vec_a=c(100,20,500)
vec_b=vec_a*0.02
vec_c=c("hubli","dwd","Bgm")
vec_d=c(200,64,277)
salesdf=data.frame(id=vec_a,vec_b,vec_c)
write.csv(salesdf,"MyInfo.csv",row.names=FALSE)
salesdf_2=read.csv("MyInfo.csv")
salesdf_2

my_data2=subset(my_data,salary>avg_sal & dept=="IT")
my_data2$name

#bind vectors row wise
tmp=rbind(vec_a,vec_b,vec_d)
row_scores=rowSums(tmp)
scores=cbind(tmp,row_scores)

#-------lab4-------------
data()
airquality
str(airquality)
temperature = airquality$Temp
hist(temperature)
hist(temperature,main="Max daily temp",xlab="temp in degree F",xlim=c(50,100),col="blue",freq = FALSE)
output=hist(temperature)
output

h=hist(temperature,ylim = c(0,40))
text(h$mids,h$counts,labels=h$counts)

adj = c(0.5,-0.5)

hist(temperature,breaks=4,main="With breaks= 4")
hist(temperature,breaks=20,main="With breaks= 20")

hist(temperature,
     main="Maximum daily temperature at La Guardia Airport",xlab="temp",xlim=c(50,100),col="chocolate",border="brown",breaks=c(55,60,65,70,75,80,100))

#LP -09
y=c(75,38,85,62,69,89,47,77,75,73,66,87,83,29,91,52,65,56,88,87,90,97,63,74,76,68,49,79,37,58,83,65,69,81,63,94,70,82,76,60,77,73,84,74,71,60,81,70,63,82)
length(y)
summary(y)
k=1+3.22*log10(50)
width=(max(y)-min(y))/7
breaks=seq(min(y),max(y)+10,by=10)
bins=cut(y,breaks,right=F)
freq=table(bins)
freq.table=cbind(freq)
h=hist(y,xlim=c(0,max(y)+10),ylim=c(0,20),breaks,col="6",right=F)
text(h$mids,h$counts,labels=h$counts,adj=c(0.5,-0.5))
#-----------------------------------
#To create frequency polygon
x.pts=c(min(h$mids) - (h$mids[2] - h$mids[1]), h$mids, max(h$mids)+(h$mids[2]-h$mids[1]))
y.pts=c(0,h$counts,0)    
lines(x.pts,y.pts,type="o",main="freq poly")

#rel freq
rel.freq=freq/length(y)
rel.freq
cbind(freq,rel.freq)
h1=hist(y,breaks,col="orange",main="Rel Freq",probability = T)
lines(density(y))

#-----------------------------ogive
freq=table(cut(y,breaks,right=F))

cumfreq=c(cumsum(freq)) #xD
cbind(freq,cumfreq)
cumfreq0=c(0,cumfreq)
plot(breaks,cumfreq0,xlab="less than",ylab="less than freq",main="Ogive")
lines(breaks,cumfreq0,lwd=1,col="blue")
Mfreq<-sum(freq)-cumfreq0
Mfreq

points(breaks,Mfreq,xlab="less than",ylab="less than freq",main="Ogive")
lines(breaks,Mfreq,lty=2,lwd=2,col="red")

summary(y)

#----Lp11

g=c(50,40,41,17,11,7,22,44,28,21,19,23,37,51,54,42,88,41,78,56,72,56,17,7,69,30,80,56,29,33,46,31,39,20,18,29,34,59,73,77,36,39,30,62,54,67,39,31,53,44)
summary(g)
k=1+3.22*log10(50)
width=(max(g)-min(g))/7
breaks=seq(min(g),max(g)+12,by=12)
bins=cut(g,breaks,right=F)
freq=table(bins)
freq.table=cbind(freq)

freq=table(cut(g,breaks,right=F))
cumfreq=c(cumsum(freq)) #xD
cbind(freq,cumfreq)
cumfreq0=c(0,cumfreq)
plot(breaks,cumfreq0,xlab="less than",ylab="less than freq",main="Ogive")
lines(breaks,cumfreq0,lwd=2,col="blue")
Mfreq<-sum(freq)-cumfreq0
Mfreq

points(breaks,Mfreq,xlab="less than",ylab="less than freq",main="Ogive")
lines(breaks,Mfreq,lty=2,lwd=2,col="red")



#--------------------------Boxplot

male = c(46,40,36,47,29,43,37,38,45,50,48,60)
female=c(26,25,33,35,35,28,30,29,61,32,33,45)
summary(male)
summary(female)
boxplot(female,horizontal = TRUE,main="BoxPlot Female",col='purple') #horizontal
boxplot(male,horizontal = TRUE,main="BoxPlot Male",col='red')
boxplot(male,female,names=c('male','female'),horizontal = TRUE,main="Male vs female",col=c("red","purple"))
#LP15
cat1=c(91.5,92.18,95.39,91.79,89.07,94.72,89.21)
cat2=c(89.18,90.95,93.21,97.19,97.04,91.07,92.75)
boxplot(cat1,cat2,horizontal = TRUE,main="Catalyst 1 and 2",names=c("cat1","cat2"))
qqnorm(cat1)
qqline(cat1)
abline(a=mean(cat1),b=sd(cat1))

#compare with cat2
qqplot(cat1,cat2,pch=35,col='purple')
abline(a=0,b=1)
#from qq plot we verify cat2 more variable than cat1
#LP16
phoenix=c(3,7,25,10,15,6,1,25,15,7)
arizona=c(48,44,40,38,33,21,20,12,1,18)
boxplot(phoenix,arizona,horizontal = TRUE,main="Phoenix vs arizona",names=c("phoenix","arizona"))
qqplot(phoenix,arizona,pch=35,col='purple')
abline(a=0,b=1)
#arizona more var
##add boxplot on hist using add attr
hist(airquality$Temp,col="blue")
boxplot(airquality$Temp,horizontal=TRUE,at=30.5,add=TRUE,axes=FALSE,col="red")
qqnorm(airquality$Temp)
qqline(airquality$Temp)

par(mfrow=c(1,2))
y=c(75,38,85,62,69,89,47,77,75,73,66,87,83,29,91,52,65,56,88,87,90,97,63,74,76,68,49,79,37,58,83,65,69,81,63,94,70,82,76,60,77,73,84,74,71,60,81,70,63,82)
length(y)
breaks=seq(min(y),max(y)+10,by=10)
h=hist(y,xlim=c(0,max(y)+20),ylim=c(0,20),breaks,col="3",right=F)
boxplot(y,horizontal = TRUE,at=9,add=TRUE,axes=FALSE,col="red",width=1)
qqnorm(y)
qqline(y)


#LP11
sub=c(72,84,61,76,104,76,86,92,80,88,98,76,97,82,84,67,70,81,82,89,74,73,86,81,85,78,82,80,91,83)
length(sub)
summary(sub)
breaks=seq(min(sub),max(sub)+10,by=10)
h=hist(sub,xlim=c(0,max(y)+20),ylim=c(0,20),breaks,col="3",right=F)
boxplot(sub,horizontal = TRUE,at=9,add=TRUE,axes=FALSE,col="red",width=1)
qqnorm(sub)
qqline(sub)

data()
beaver2
qqplot(beaver2$temp[beaver2$activ==1],beaver2$temp[beaver2$activ==0])
hist(beaver2$temp[beaver2$activ==0])

