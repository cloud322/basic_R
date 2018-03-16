#graph2
#선형그래프 - plot
#시간별 추세표시하는ㄷ 적합
apple<-c(3,9,12,10,23,31,41)
plot(apple,type = 'o',col='red')
axis(1,at=1:7,lab=c('m','t','w','th','f','sa','su'))
axis(2,ylim=c(0,250))
title(main='요일사 사과 섭취ㅊ',col.main='purple')
title(xlab = '요일',col.lab='blue')
title(ylab = 'apple',col.lab='purple')


#막대그레프
#여러 가지 통계나 사물의 양을 막대 모양의 길이로 나타내어 알아보기 쉽도록 그린 그래프
# 수량의 많고 적음이나 늘고 줄어드는 양, 크고 작음을 비교하거나 변화 상황의 일별, 월별, 연별 통계 등에 많이 이용 
#자료를 쉽게 비교할 때 사용하는 그래
a<-c(1,2,3,4,5)
p<-c(5,4,3,2,1)
b<-c(2,2,2,2,2)
f<-data.frame(a,p,b)
barplot(as.matrix(f),main='f 섭취량',ylab='섭취량',xlab='과일',col=rainbow(5),beside=T,ylim=c(0,10))

#히스토그램 
#각각데이터구 구간을 대표하는 대표값을 기준으로 나타낸 분포표를 그래프로 나타낸것
#연속적인 데이터의 분포를 주로 표현하는데 사요용
score<-c(0,1,2,3,4,5,6,7,8,12,11,0)
hist(score,main='score',ylab='섭취량',xlab='과일',breaks=10)

#원그래프 pie 
#전체를 기준으로 한 부분의 상대적 크기를 표시
#전체에대한 부분의 비율슈ㅟ ㅜㅂ게 알수 잇게해줌

s<-c(1,2,3,4,5)
l<-c('a','b','c','d','e')
pie(s,l,main='sl',col=rainbow(5))

#박스 수염 그래프 boxplot
# 중앙값 평균 사분위수등과 같은 주요 통계 측정칠르 시각화
#변수의 주요 통계속성을 검사하는데 유용한 시각적 보조도구를 제공
boxplot(a,p,b,col = c('red','blue','green'),names =c('apple','peach','berry'))

attach(iris)
boxplot(Petal.Width,Sepal.Width)
summary(Sepal.Width)
detach(iris)

summary(Sepal.Width)
boxplot(a,p,b,col = c('red','blue','green'),names =c('apple','peach','berry'),horizontal = T)

