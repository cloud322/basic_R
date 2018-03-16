#dataManage2

#수학함수
abs()     #절대값
sqrt()
ceiling()
floor()
round()
trunc()   #절삭
signif(44.4555555)  #반올림 .000?

sort() #순서 - 0 +
rev() #reverse
rank()
cumsum()
prod()#r곱
cumprod()#누적곱
cummax()
cummin()

#통계함수
data<-c(5,6,1,2,4,4,5)
sum()
prod()
max()
min()
diff(data)  #차분
which.max(data)# 2번쨰가 최대값 index
which.min(data)#최소값의 index 3번쨰 
range(data)
mean()
median()
sd()
var()
mad(data)#중위가값

#확률 함수 runif() 0~1 사이균등분포 난수 생성
#set.seed(nnn) 난수생성 seed 설정
runif(10)
#문자함수 
# nrow ncol
ch<-c('ab','xyz','abc123')
nchar(ch) #문자수 샌다
length(ch)
ch<-'1234567a'
substr(ch,2,4) #지정한위치 문자를 추출

grep('456',ch,fixed=T)  #지정한 패턴에 의해 문자검ㅅ
x<-c('123','456','789','abc')
grep('456',x,fixed=T)

#sub() 패턴에 의지 짖정한 문자를 검색하고 문자 치환
sub('\\s',',','hello, world')
sub('\\s',',','  hello,  world') #",hello, world"
sub('\\s',',','hello,world ')

# strsplit() #문자에서 특정 요소를 분ㄹ리ㅣ
c<-strsplit('abc123','')
c

# paste() #구분자로 문자열을 분리한후 결합
paste('x',1:3,sep = '')
paste('x',1:3,sep = 'M')
paste('오늘은',date())

toupper(ch)
tolower(ch)

#############################################################################
options(digits = 2) #소수점 두자리
student<-c('John Davis','Angela Williams','Bullwinkle Moose','David Jones','Janice Markhammer','cheryl Cushing','Reuven Ytzrhak','Greg Knox','Joel England','Mary Rayburn')
math<-c(502,600,412,358,495,512,410,625,573,522)
science<-c(95,99,80,82,75,85,80,95,89,86)
english<-c(25,22,18,15,20,28,15,30,27,18)
roster<-data.frame(student,math,science,english,stringsAsFactors = F)
roster
#성적테이블 표준화 시킴 :scale
newdata<-scale(roster[2:4])
newdata
#평균점수구하기
mean(newdata)  #안나옴
#apply 함수 이용
#특정 연산을 손쉽게 처리해주는 함수
score<-apply(newdata,1,mean)   #행단위
score
score<-cbind(roster,score)

iris[1:4]
iris1<-apply(iris[1:4],1,mean)  #행
apply(iris[1:4],2,mean)         #열
iris1
# 이웃 분류 KNN   백터지원SVM 신경망등
#많은분류 알고리즘에 유용하게세사용
#변수값 적당한 수준으로 조정 :0~1사이 or -1~1
# 조정된 값을 평균과 표준편차로 다시 계산
iris[1:4]
scale(iris[1:4])

#maxscore minscore
maxscore<-apply(newdata,1,max)
minscore<-apply(newdata,1,min)
maxscore
minscore

newdata<-cbind(newdata,maxscore)
newdata<-cbind(newdata,minscore)

roster<-cbind(roster,maxscore)
roster<-cbind(roster,minscore)
#maxmath maxsci maxeng
maxmath<-max(math)
maxmath
maxsci<-max(science)
maxsci
maxeng<-max(english)

max<-apply(newdata[,1:3],2,max)
min<-apply(newdata[,1:3],2,min)
max
min
max<-apply(newdata[,2:4],2,max)
min<-apply(newdata[,2:4],2,min)
#minmath minsci mineng
minmath<-min(math)

minsci<-min(science)
mineng<-min(english)

#학점계산-사분위수
#quantile() - 집단에서 측정수 ㅅ치의 특성을 표현
#분위수 - 확률적으로 균등하게 영역나눠 계산한수
y<-quantile(score,c(.8, .6, .4, .2))
y

roster$grade[score>=y[1]] <-'A'
roster$grade[score<y[1] & score>=y[2]] <-'B'
roster$grade[score<y[2] & score>=y[3]] <-'c'
roster$grade[score<y[3] & score>=y[4]] <-'D'
roster$grade[score<=y[4]] <-'F'

roster$grade
score>=y[1]
score<y[1] & score>=y[2]
score<y[2] & score>=y[3]
score<y[3] & score>=y[4]
score<=y[4]
roster
#이름에서 성과 이름분리 strsplit
strsplit(roster$student,' ')

name<-c('a 1','b 2')
names<-strsplit(name,' ')
names
names[[1]][1]
apply(names, 1 ,'[')
#names에 있는 모든 원소에 대해 행단위로 원소추출함수 [ 적용
sapply(names, '[',1) 

names<-strsplit(roster$student,' ')
lname<-sapply(names,'[')

lname<-sapply(names,'[',1)
fname<-sapply(names,'[',2)
lname
fname

#roster<-cbind(fname,lname)
roster<-cbind(fname,lname,roster[,-1])
roster
roster <- roster[order(fname),]
roster

#apply - 배열 행령 함수를 행이나 열 방향으로 적용
#        결과는 백터 행렬리스트로 출력(범용으로사용)

#1~20 합 1차원
sum(1:20)
nums<-matrix(1:20,ncol=4)
#행 sum
apply(nums,1,sum)
#열 sum
apply(nums,2,sum)

#sapply - sapply(대상, 함수) apply lapply 사용간편호

iris[1:4]
class(iris[1:4])
iris[,1:4]
class(iris[,1:4])

apply(iris[,1:4],mean)#안됨 1 or 2 줘야하 - apply(iris[,1:4],1,mean) vector결고
lapply(iris[,1:4],mean)#결과 리스트
sapply(iris[,1:4],mean)#결과 vector
#lapply

#실행흐름 제어 :if  for switch
#반복문 - 자주 사용하지 x apply 이용
for (i in 1:10){
  print(i)
  result<-i*3
  print(result)
}

i<-1
while(i<=10){
  print(i)
  i<-i+1
}

i<-1
while(T){
  i<-i*3
  print(i)
  if(i>99999) break
}

#do-while 과 유사
i<-1
repeat{
  result<-i*3
  print(result)
  if(i>99999) break
  i<-i+1
}

#조건문-if
grade='A'
if(is.character(grade)){grade<-as.factor(grade)}
if(!is.factor(grade)){grade<-as.factor(grade)}else{print('이미 factor 형으로 선언변 ㅅ수')}

#ifelse(조건,문장1,문장2)
i<-1
ifelse((i>10),'10보다큼','10보다작')

x<-c(6:-4)
sqrt(x) #In sqrt(x) : NaNs produced 음제 ㅈ곱근불가
sqrt(ifelse(x>0,x,NA))

#switch
todayfeels<-c('sad','blue','happy','afraid')
for(i in todayfeels){
  print(switch(i,sad='슬픔',blue='우울',happy='기쁨',afraid='두려'))}
todayfeels

#데이터 집게 aggregate
#특정값 갑을 기준으로 그룹한 ㅎ후 다양한 집계처리
#aggregate(계산될열~기준될열,데이터,함수)
library(googleVis)
Fruits
#년도별 총판매액
aggregate(Sales~Year,Fruits,sum)
#과일별 판매액
aggregate(Sales~Fruit,Fruits,sum)
#과일최 초고판매액
aggregate(Sales~Fruit,Fruits,max)
#과일펼 최저판매액
aggregate(Sales~Fruit,Fruits,min)
#과일별 연도별 판매액
aggregate(Sales~Fruit+Year,Fruits,sum)
#iris 종별 줄기의 평균길이
iris
aggregate(Sepal.Length~Species,iris,mean)

install.packages('MASS')
library(MASS)
str(Cars93)
split(Cars93$MPG.city,Cars93$Origin)
split(Cars93,'Origin')

aggregate(MPG.city+MPG.highway ~Manufacturer,Cars93,mean)
aggregate(MPG.highway ~Type + Manufacturer,Cars93,mean)
aggregate(MPG.city ~Type + Manufacturer,Cars93,mean)

#tapply
#1 2 3 4 5 6 7 8 9 10
#1 2 3 4 1 2 3 4 1  2
x<-c(1:20)
y<-rep(c(1,2,3,4),5)

tapply(x,y,sum)
tapply(x,x%%2 ==0,sum)
#홀수 합 합 짝수합
tapply(Fruits$Sales,Fruits$Year,sum)

#데이터 재구성 reshape
#데이터를 좀더 향상된 방식으로 자르고 붙ㅌ이는 기능
#wide-format data - e데이터분석시이용
#long-format data - 다양한상황에 이용

# melt -기존데이터 long-format data 로 변
#cast 기존 데이터를 wide-format data 로 변혛ㅇ
reshape()

#이처럼 데이터의 구조를 바꾸려면 reshape2 패키지설치 
#melt cast 사용
install.packages("reshape2")
library(reshape2)

airquality
str(airquality)
#melt 특정 컬럼ㄱ ㄱㅣ준으로 variable, value 로 나눔
#데이터프레임을 다룰때 데이터구조를  행의 키를 기준으로 나머지를 변수화해서
#하나의열에 담아버리는 것을 melt melting
#melt(데이터,기준열)

#month day 기준으로 나머지는 변수명 컬럼 값모두 합처저자
air<-melt(airquality,id=c('Month','Day'))
head(air)
head(airquality)
#month day 기준으로 
air2<-melt(airquality,id=c('Month','Day'),measure=c('Solar.R','Wind'))
head(air2)
air2
#mydata 생성하기

id<-c(1,1,2,2)
time<-c(1,2,1,2)
x1<-c(5,3,6,2)
x2<-c(6,5,1,4)
original<-data.frame(id,time,x1,x2)
original
melted<-melt(original, id=c('id','time'))
melted
rm(original)
rm(melted)

#fruit data year 기준으로 melt
melt(Fruits,id=c('Year'))
melt(Fruits,id=c('Year'),variable='fruits_type',value.name ='qty_price')
head(Fruits)

#melt데 ㄷ이터를 새로운 형식의 데이터로 만들러면
#집게함수가 적용된/적용되지않은 dcast 함수를이용
#dcast(data,기준컬럼~대상컬적,적용함수)

#id기준으로 variable 컬럼의 모둔 데이터를 그룹화해서 평균을 계산
dcast(melted,id~variable,mean)
dcast(melted,id~variable)
dcast(melted,id~variable+Time)
dcast(melted,id+variable~Time)

#fruit 데이터 year fruits 기준
#sales expense profit  data  melt 하세요
f<-melt(Fruits,id=c('Fruit','Year'),measure=c('Sales','Profit','Expenses'))
dcast(f,Year~variable)
dcast(f,Fruit~variable)
dcast(f,Year+Fruit~variable)
dcast(f,Year~Fruit+variable)

#R 편리하게 사용할수 도와주패 패키지
install.packages("rattle")
library(rattle)

