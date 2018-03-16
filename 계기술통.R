#기술통

#모집단

#표본

#기술토계 대표적내용
#min max 평균 sd var

#var - (평균 데이터값사이 )제고
#deviation - 평균 데이터값사이 
#sd -sqrt(var)

#기술통계 관련 함수
head(mtcars)
head(iris)  #6r개
tail(iris)
length(mtcars)
nrow(mtcars)
ncol(mtcars)
str(mtcars)

install.packages('car')
library(car)
some(mtcars)

names(mtcars) #변수이름
class(mtcars) #원소속성

#데이터요약
min()
max()
mean()
median()
sd()
var()
range(mtcars)
quantile(mtcars$mpg)
?quantile
summary(mtcars) #min Q1 median mean Q3 Max
apply(data, row/col,func) #집계함수이용데이터 요약
apply(mtcars,1,mean)#row 행
apply(mtcars,2,mean)#col 열
?apply

# skewness 왜도 
# 0>  왼쪽으로 치우치
# 0<  오른쪽으로 치우치침
hist(mtcars$mpg)
hist(mtcars$mpg,freq=F)
lines(density(mtcars$mpg),col='red')

install.packages("fBasics")
library(fBasics)
skewness(mtcars)
#차종별 가격에대한 왜도
library(MASS)
with(Cars93,tapply(Price,Type,skewness))

# kurtosis 첨도
# 0>  위쪽으로 치우치
# 0<  아래쪽으로 치우치침
kurtosis(mtcars)
kurtosis(mtcars$mpg)
kurtosis(mtcars$disp)

library(MASS)
head(Cars93)
with(Cars93,tapply(Price,Type,kurtosis))
hist(Cars93$Price,freq=F)
lines(density(Cars93$Price),col='red')
a<-c(1,2,3,4,5)
mean(a)
median(a)

#quantile
d<-c(1,2,3,4,5,6,7,8,9,10)
quantile(d)

qqnorm(d)
qqline(d)
#기술통시 식각화
#산점도
#막대그래프
#원
#히스토
#상자수염

#줄기 잎
stem(Cars93$MPG.highway)
stem(Cars93$MPG.city)

str(faithful)
stem(faithful$eruptions)
hist(faithful$eruptions)

