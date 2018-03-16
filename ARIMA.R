#시계열

#패턴을 기리되 시간에따라 움직이는경우 = 추세
# 시계열 - 계절성 +추세성 +잡음
# 일정간격으로 배치된 값

#김치판매량 시계열 예측 
kim<-read.csv('c:/java/k.csv')


head(kim)

plot(kim$대형마트수량,type='l',xlab='주',ylab='수량')
plot(kim$백화점수량,type='l',xlab='주',ylab='수량')
library(zoo)

dates<-as.Date(as.character(kim$주마지막일자),format='%Y%m%d')

all_sales<-data.frame(cbind(kim$대형마트수량,kim$백화점수량,kim$수퍼수량,kim$편의점수량))
all_sales
z_sales<-zoo(all_sales,dates)
plot(z_sales,screen=1,col=c('red','blue','orange','purple'))
plot(z_sales,screen=c(1,4),col=c('red','blue','orange','purple'))

#마지막년도를기준으로 잘라서 추세를 그래프로확인
sale2015<-subset(kim,주마지막일자>='20150101' & 주마지막일자<='20151231',select = c(주마지막일자,대형마트수량,백화점수량,수퍼수량,편의점수량))
?subset
tail(sale2015)
sale2015
plot(sale2015)


#
sales2015<-zoo(all_sales,dates)
kim2015<-read.csv('c:/java/k2.csv')
k_sales<-zoo(kim2015$SALES,as.Date(as.character(kim2015$LAST_WK),format = '%Y%m%d'))
merge_2015<-merge(k_sale=window(sales2015,start = '2015-01-01',end = '2015-12-31'),k_sales,all=F)
head(merge_2015)
plot(merge_2015)

#각그래프 간의 상관과계알아봄
window(sales2015)
plot(window(sales2015))
k_sales
plot(k_sales)
# merge_k<-merge(k_s=window(k_sales),k_s=window(k_sales),k_sales,k_sales)
# plot(merge_k)
ccf(k_sales,window(sales2015$X1))
ccf(k_sales,window(sales2015$X2))
plot(diff(sales2015))

#자기상관 함수
acf(sales2015)

#자기상관 시계열에존재하는지 p값조사

#Box-pierce
Box.test(sales2015$X1)        
#Box-Ljung
Box.test(sales2015$X1,type='Ljung-Box') 

#이동평균볍으로 시계열을 좀더 부드럽게 표시
#데이터들을 몇개씩 묶어 평균 새로운 값

plot(sales2015$X1)
par(mfrow=c(2,2))
r1<-rollapply(sales2015$X1,2,mean)
r2<-rollapply(sales2015$X1,3,mean)
r3<-rollapply(sales2015$X1,4,mean)
r4<-rollapply(sales2015$X1,5,mean)
r5<-rollapply(sales2015$X1,8,mean)
plot(r1)
plot(r2)
plot(r3)
plot(r4)
plot(r5)

#이동평균 묶음 width수는 얼마가 
#acf 통해 자기상관수를사용
par(mfrow=c(1,1))
r11<-rollapply(sales2015$X1,11,mean)
plot(r11)

#
install.packages("forecast")
library(forecast)
#f1<-auto.arima(ts(log(sales2015$X1),frequency = 52))
f1<-auto.arima(ts(log(sales2015$X1),frequency = 52))
plot(forecast(f1))
# + season
f2<-auto.arima(ts(log(sales2015$X1),frequency = 52),seasonal = T)
plot(forecast(f2))
#생성된모형으로 값예측 
v<- predict(f2,n.ahead = 10)
    # 향후 10주 마트판매량 예측 

