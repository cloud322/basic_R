#다차원척도법
#개체사이의 유사.비유사성 픅정 2.3차원공간에 점으로 표현
#개체간 근접성 시각화 데이터속 패턴 구조 찾아냄
#개체간 유클리드 거리행렬 이용

#계량적 다차원 척도법
#데이터가 연속형변수인경우 사용
library(MASS)
data("eurodist")
eurodist
head(eurodist)

#각 도시정보 2차원으로 정리
city<-cmdscale(eurodist)
city
head(city)
#도시정보 x y 로 mapping
x<-city[,1]
y<- -city[,2]
#지도에 도시정보 출력
plot(x,y,type='n')
text(x,y,rownames(city),cex=0.5)
abline(v=0,h=0,lty=2)

#자동차에 대한 선호도조사 다차원적
#5대 차종에대한 호감도 1~9사이
?set.seed
set.seed(5478993)
q<-matrix(sample(c(1:9),25,replace=T),nrow=5,ncol=5)
#설문냐용 난수로만들어 행렬에 저장

car_names=c('fe','Bu','enzo','Mas','Au')
colnames(q)<-car_names
rownames(q)<-car_names
q

#행렬에 행제목과 열제목으로 작성
?dist
qm<-dist(q)
qm<-cmdscale(qm)
plot(qm, type='p')
abline(v=0,h=0)

#
q1<-matrix(rnorm(100),nrow=5)
q1<-dist(q1)
q1<-cmdscale(q1)
plot(q1,type='p')
abline(v=0,h=0)
text(qm,c(rownames(q)))

#유사부류찾기 - 거리개념
#학업집중도에따라 학생반편성해보기
ac<-read.csv('c:/java/aca.csv',stringsAsFactors = F)
head(ac)
aca<-dist(ac) #유클리드거리계산
aca_xy<-cmdscale(aca) # 2차원좌표형식
plot(aca_xy,type='n')
text(aca_xy,as.character(1:52))

#고객들이 선호하는 음식메뉴유사성알아보기
food<-read.csv('c:/java/food.csv',stringsAsFactors = F)
head(food)
f<-dist(food)
f
f_xy<-cmdscale(f)
plot(f_xy,type='n')
text(f_xy,rownames(food))
#18번고객 -  추어탕 갈비탕간의거리 0
#2번고객 - 추어탕 갈비탕 간의거리 0 
#중요도가없음 구분지어줘야할 필요존재

#
food2<-read.csv('c:/java/food.csv')
food2<-food2[,-1] #1열제외
food2<-t(as.matrix(food2)) %*% as.matrix(food2)# t() 기존데이터 행열로전환
                                              # 1: -1 계산하면 -1 나와야된다
                                              #거리계산이 제대로되도록 자기자신을 한번더 곱함
food2
f2<-dist(food2)
f2_xy<-cmdscale(f2)

plot(f2_xy,type='n')
text(f2_xy,colnames(food2))
abline(v=0,h=0)
x<-c(1,2,3,NA)
mean(x)
