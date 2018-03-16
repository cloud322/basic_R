# 상관분석

# 2개의 변수 x, y 가 있을 때
# 이 두 변수가 서로 어떤 관계에 있는지 파악하는 경우 존재

# 키x가 클수록 몸무게y도 증가하는가?
# 교육x을 많이 받으면 소득y이 증가하는가
# 광고x를 많이 하면 판매량y이 커지는가?

# 이처럼 두 변수가 서로 어떤 관계에 있는지 파악 - 상관분석
# 두 변수의 상관관계응 산점도로 나타내고
# 점들이 흩어져 있는 모습을 보고 관계를 파악
# 기울기에 따라 양/음의 상관관계로 분류

# 한편, 상관분석은 서로가 어떤관계에 있는지 파악할수가 있지만,
# 서로의 인과관계는 파악할 수 없다
# 즉, 여름이 다가오면 빙과류가 많이 팔린다
# 여름이 다가오면 모기가 점점 많아진다
# 하지만, 모기가 많아져서 빙과류가 많이 팔리나?
# 이것은 서로 직접적인 관련은 없다
# 단지, 여름이라는 변수가 큰 영향을 미쳤을 뿐이다

# 간혹 다른상황에서 서로 직접적인 영향을
# 주고 받는 경우도 존재

cor()

# 회사에서 신제품이 출시 되었을때
# 안내메일을 발송하는 횟수와 제품판매량 사이 관계 조사
# 제품판매량 : 3, 5, 8, 11, 13
# 안내메일발송수 : 1, 2, 3, 4, 5
a<-c(3, 5, 8, 11, 13)
b<-c(1, 2, 3, 4, 5)
cor(a,b)
plot(a,b)

#iris 꽃받침 꽃잎
head(iris)
iris
#cor(Sepal.Width, Petal.Width)
cor(iris$Sepal.Width, iris$Petal.Width)
plot(iris$Sepal.Width, iris$Petal.Width)
cor(iris[1:4])

airquality
head(airquality)


a<-airquality[,c(1:4)]
cor(a)
a
a2<-na.omit(a)
a2
cor(a2)
plot(a2)
plot(a2$Ozone)
plot(a2$Solar.R)

pairs(a2, panel= panel.smooth)

abline(a2$Ozone,1:150)    
abline(a2$Ozone/150,1:150)   

library(ggplot2)
qplot(Ozone,Solar.R, data=a2, geom=c('point','smooth'))

#상관계수 
#상관분석은 두변수가 서로 어떤 관계인지를 파악 

#실업자수 Unemployeed 개인소비 지출 PCE 상관관계
library(ggplot2)
#ctrl+click(economics)
economics
?economics
str(economics)
cor(economics$pce,economics$unemploy)
plot(economics$pce,economics$unemploy)


plot(economics$pce,col='red')
plot(economics$unemploy,col='blue')


cor.test(economics$pce,economics$unemploy)


cor(economics$psavert,economics$unemploy)
plot(economics$psavert,economics$unemploy)
?plot

library(MASS)
Cars93
head(Cars93)
str(Cars93)
plot(MPG.highway~Weight,data=Cars93)
?lm
abline(lm(MPG.highway~Weight,data=Cars93),col='red')

cor(Cars93$MPG.highway,Cars93$Weight)
cov(Cars93$MPG.highway,Cars93$Weight)

#상관행렬
#여러변수 2개이상의 상관관계를 한번에 알아보고자 하는경우 모든 변수에 대한 상관
#관계를 알려주는 상관 행렬을 이용

cor()
corrplot()

head(mtcars)
cor_cars<-round(cor(mtcars),2)
cor_cars
install.packages("corrplot")
library(corrplot)
corrplot(cor_cars)  #열그래프로 시각화
                    # - red  + blue
?corrplot
corrplot(cor_cars,method="ellipse")


#놀이동산 csv
a<-read.csv('c:/java/a.csv',header=T)
head(a)
a2<-a[2:8]
#weekend num.child    distance rides games wait clean overall
#그래프
plot(a2)
#공분산
round(cov(a2),3)
#상관계수
round(cor(a2),3)
#상관계수가설검증
cor.test(a2)

plot(a[,4:8])
a3<-cor(a[,4:8])
corrplot(a3,method = "ellipse")
head(a[,4:8])

ls(a)
ls.str(a)
str(a)

