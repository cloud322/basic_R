#dataManage1
#기초 데이터 관리

# 리더쉽에관한 조사결과
# 성별따라 리더쉽ㅂ?
#국적?
#질문에대한 평점?

man<-c(1,2,3,4,5)
date<-c('10/24/14', '10/28/14', '10/01/14', '10/12/14', '05/01/14')
country<-c('US','US','UK','UK','UK')
gender<-c('M','F','F','M','F')
age<-c(32,45,25,39,99)
q1<-c(5,3,3,3,2)
q2<-c(4,5,5,3,2)
q3<-c(5,2,5,4,1)
q4<-c(5,5,5,NA,2)
q5<-c(5,5,2,NA,1)
lead<-data.frame(man,date,country,gender,age,q1,q2,q3,q4,q5,stringsAsFactors = F)
lead
#새로운 속성(컬럼)
#데이터프레임에 새로운 열을 추가하려면 $연산자 사용
#or transform() 함수를 이용
mydata<-data.frame(x1=c(2,2,6,4),x2=c(3,4,2,8))
mydata
# X
# sumx<-x1+x2
# meanx<-x1+x2/2
# O
sumx<-mydata$x1+mydata$x2
meanx<-(mydata$x1+mydata$x2)/2
sumx
meanx
mydata$sumx<-mydata$x1+mydata$x2
mydata$meanx<-(mydata$x1+mydata$x2)/2
mydata
#attach/detach
attach(mydata)
mydata$sumx<-x1+x2
mydata$meanx<-(x1+x2)/2
detach(mtdata)

# 새로운 열추가 :transform
mydata<-transform(mydata,sumx=x1+x2,meanx=(x1+x2)/2)
rm(mydata)
mydata

########################2 변수 (컬럼)값 재작성
#기존의 변수나 값을 기준으로 새로변 변수값생 생성
# 연속값을 가지는 변수를 3개의 카테고리로 나눔
#잘못 작성된 값을 바른 값으로 대체
#조건에따라 통과 탈락 변수 생성
lead$age_cate[lead$age>75]<-'노년'
lead
lead$age_cate[lead$age<75]<-'사람'

lead<-within(lead,{age_cate[age==99]<-'백수'
age_cate[age==45]<-'불혹'})

############3 컬럼명 변경 - 변 ㅁ명이 맘에 안든다면 바꾸자
fix(lead)
lead
#데이터 프레임의 이름출력 
names(lead)
names(lead)[2]<-'newDate'
names(lead)[6:10]<-c('1','2','3','4','5')
#plyr 패키지 를 이용  이름바꿔보자
install.packages('plyr')
library('plyr')
lead<- rename(lead,c(man='manager',newDate='date'))
lead

###########################4 결측값(누락값) 처리
# 누락 오류 부적절한 데이터를 보완 NA
# 3 is.na() 는 누락값여부확인
x<-c(1,2,3,NA)
is.na(x)
is.na(lead[6:10])
# 누락값 비교불가능 ->비교연산사 ㅅ용불가
#분석에서 누락값은 제외하는 것이 좋ㅇ음
y<-x[1]+x[2]+x[3]+x[4]
y
z<-sum(x)
z
#na.rm=T 를사용 누락값 제외
z<-sum(x,na.rm=T)
z
#na 가있는 관측치 아예제거 - na.omit()
na.omit(lead)

#############################5 날짜 데이터 다루기
#현재 날짜 시간 출력
Sys.Date()
Sys.time()
date()

# 날짜 데이터를 입력할때는 보통 문자형식사 사용
#경우에따라 날짜로 검색하거나 계산해야할 필요가 존재
#따라서 문자형식을 날짜 형식으로 변환해야함 as.date()
#as.Date() 기본 형식은 yyyy-mm-dd
mydate<-c('2007-10-05','2018-03-01')
class(mydate)
madates<-as.Date(mydate)
class(madates)

#기본 형식이 아니 다른 형식의 날짜데이터는?
#형식 지정자를 사용해 변환   (Y - 4자리연도)
mydate<-c('01/05/2016','08/16/1975')
mydates<-as.Date(mydate,'%m/%d/%Y' )
mydates

fmt<-'%m/%d/%y'
lead$date<-as.Date(lead$date,fmt)
lead

#날짜변환 - format()
today<-Sys.Date()
format(today,format='%m %d %B %b %Y %y %A %a')

#날짜계산
edate<-as.Date('1990-03-22')
sdate<-as.Date('2018-02-28')
mydays<-edate-sdate
mydays

difftime(edate,sdate)
difftime(edate,sdate,units = 'weeks')
difftime(edate,sdate,units = 'hours')
difftime(edate,sdate,units = 'mins')

#날짜를 문자로변환
strdate<-as.character(edate)
strdate

a<-c(1,2,3)
is.numeric(a)
is.vector(a)
a<-as.character(a)
is.numeric(a)
is.character(a)

#데이터 정렬 order()
lead[order(lead$age)]
lead[order(-lead$age)]
lead[order(lead$age),]
lead[order(lead$gender,lead$age),]
lead[order(lead$gender,-lead$age),]

#데이터 병합 merge(),rbind()
#데이터가 여러위치에 존재한다면 이것을 결합해보자
id<-c(1:2)
lname<-c('kim','park')
pinfo<-data.frame(id,lname)
pinfo
id<-c(3:4)
lname<-c('kim2','park2')
pinfo2<-data.frame(id,lname)
pinfo2능

id<-c(5,6)
lname<-c('lee','seo')
pinfo3<-data.frame(id,lname)
#2개씩만 merge 가느
merge(A,B,by='ID')
merge(A,B,by=c('ID','country'))

merge(pinfo, pinfo2, by='id')
merge(pinfo, pinfo2, by='id',all = T)
merge(pinfo, pinfo2, by='id',all.x = T)
merge(pinfo, pinfo2, by='id',all.y = T)

merge(pinfo, pinfo3, by='id')

#근데 키가없다 cbind() 사용
#결합시 행갯수와 이름이 일치
cbind(A,B)
cbind(pinfo, pinfo3)

#행추가하기 rbind()
rbind(pinfo, pinfo3)
rbind(pinfo2, pinfo3)

#데이터 부분집합만들기
# df[행,열] 표기로 원소에 접근가능ㅍ
newdata<-lead[,(6:10)] 

myvars<-c('q1','q2','q3','q4','q5')
newdata<-lead[myvars]
newdata

myvars<-paste('q',1:5,sep='') # q1,q2,q3
newdata<-lead[myvars]
newdata

paste('hello','world','!!')
paste('hello','world','!!',sep = '-')
paste('hello','world','!!',sep = '')


#변수 제외하기 ! - null
myvars<-names(lead)%in%c('q3','q4')
myvars
# %in% R특수연산자 특정값포함여부 검사

newdata <-lead[myvars]
newdata
newdata <-lead[!myvars]
newdata
newdata<-lead[c(8,9)]
newdata
newdata<-lead[c(-8,-9)]
newdata
lead$q3<-lead$q4<-NULL
lead

#관측치를 검색후 선택
newdata<-lead[1:3,]
newdata
lead[lead$gender=='M'&
     lead$age>30,]

#날짜기간으로 검색
#먼저 문자형식을 날짜형식으변 ㅂ환
lead$date <-as.Date(lead$date)
class(lead$date)
startdate<-as.Date('2014-01-01')
class(startdate)
enddate<-as.Date('2014-05-31')

#which 함수사용
which(lead$date>=startdate & lead$date<=enddate )
newdata<-lead[which(lead$date>=startdate & lead$date<=enddate ),]
newdata
#mtcars 자료집합을 이용 which 사용하기
?mtcars
mtcars
# 변속기am가 자동 실린더cyl가 4인 자동차의 연비mpg 출ㄹ
cardata<-mtcars[which(mtcars$am==0 & mtcars$cyl==4 ),'mpg']
cardata
# 쉽게 부분 데이터 추출 subset()
newdata<-subset(lead,age>35|age<24,select=c(q1,q2,q3,q4,q5))
newdata
newdata<-subset(lead,age>=25&gender=='M',select=c(age,q1,q2,q3,q4,q5))
#무작위 표본추출 - sample :비복원/복원추출
#비복원
sample(x=1:10)
#복원
sample(x=1:10,replace =T)

data<-c(1:10)
sample(x=data,3)
sample(x=data,3,replace=T)

lead[c(1,3,5)]
mysample=lead[sample(1:5,3),]
mysample
#행 열 의 수 출력 nrow() ncol()
nrow(lead)
ncol(lead)
mysample = lead[sample(1:5 ,3),]
mysample = lead[sample(1:nrow(lead) ,3),]
mysample

#데이터 SQL처럼사용- sqldf
#sqldf 는 SQL 명령이 호출되면 자동으로 스키마 생성후
#데이터를 테이블에 불러온 후 SQL 문을 실행
install.packages('sqldf')
library(sqldf)
iris
sqldf('select * from iris')
sqldf('select distinct Species from iris')
unique(iris$Species)
iris[!duplicated(iris$Species),]
#dplyr 필요
distinct(iris$Species)

sql<-"select count(Species) from iris where 'Petal.Width'>0.5"
sqldf(sql)
sql <- 'select Species, avg("Sepal.Length") from iris group by "Species"'
sqldf(sql)

#구글에서 제공하는 데이터칩합 Fruits
install.packages('googleVis')
library(googleVis)
Fruits
mtcars

sqldf('select * from Fruits')
sqldf('select * from Fruits where Fruit = "Apples"')
sqldf('select * from Fruits limit 3')
sqldf('select * from Fruits order by year')
sqldf('select sum(Sales),max(Sales) from Fruits')
sqldf('select Fruit, avg(Sales) from Fruits group by Fruit')
