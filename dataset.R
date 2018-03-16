#변수 - 알파벳 숫자 _ . 으로구성
#첫 글자는 문자나 . 으로 시작할것
a<-1
b<-2
.c<-3
#잘못된 변수명
#3c<-4
#.4<-5

#변수할당 <- (추천) , <<-, = 

#변수명 입력하면 변수의 값을 출력
a
b
.c
# 데이터 집합 : 행(관측값 레코드 사례) 열(변수 필드 속성) 으로 이루어진 2차원배열
# R에서 데이터 생성하려면 스칼라 백터 배열 데이터프레임 리스트동의 다양한 자료구조사용
#R 에서 다룰수 있는 데이터 유형은 숫자,문자,논리,복소수 등이 있음

#vector 숫자 문자 노리형 데이터들로 구성된 1차원 배열
#scala 요소가 하나만존재하는 백터
#벡터안의 자료는 반드단 단일유형이어야함

#scala
a<-3
a
b<-4.5
c<-a+b
b
c
d<-'hello'
d
#vector
e<-c(1,2,3,4,5,-9,-8,-7,-6)
f<-c('one','two','three','four')
#g<-(TRUE,FALSE,T,F,flase,true)
g<-c(TRUE, FALSE, T, F)
#vector 단일유형 자동으로 형변환~
h<-c('9',8,'7')  
h
i<-c(1,'2',3)
i
j<-c(9,8,7,c(5,4,3))
j
#1~10까지
k<-1:10
k
l<-seq(1,10)
l
m<-seq(0,10,2)
m
n<-rep(1:2,3)
n
o<-rep(1:2, each=5)
o
# c[] 이용 vector/scala 요서출력
e[3]
e[-3]
e[c(1,5,7)]
e[2:6]

?seq
?rep

seq(0, 1, by=0.001) 
seq(0, 1, length.out=1000) 

rep(1:10,each=3)
rep(1:10,time=3)

length(m)

#비교연산자 < > != ==
ex<-c(1,3,5,7,9,NA)
ans<-ex<5
print(ans)
#논리 연산자 & | ! && ||
c(T,F)&c(F,T)   #벡터의 각 원소간 연산
c(T,F)&&c(F,T)  #단일 논리값을 계산 (단축식 평가 지원)
#산술 연산자 + - * / %

#요소 NA 검사
is.na(ex[6])
x<-NULL
is.null(x)
is.null(1)


# matrix 백터의 2차원배열 동일한 유형의 원소들로 구성
#1행은 숫자 2행은 문자 같은구성 불가
#matrix(vector,nrow= number,ncol=number)
a<-matrix(c(1,2,3,4,5,6,7,8,9),nrow=3)
b<-matrix(c(1,2,3,4,5,6,7,8,9),ncol=3)
a
b
c<-matrix(1:20,nrow=5,ncol=4)
c

cells<-c(1,35,67,99)
rnames<-c('r1','r2')
cnames<-c('c1','c2')
#행
d<- matrix(cells,nrow = 2,ncol = 2,byrow = T, dimnames = list(rnames,cnames))
d
#열
d<- matrix(cells,nrow = 2,ncol = 2,byrow = F, dimnames = list(rnames,cnames))
d
# 행령의 각요소는 행렬이름[행,열]로접근가능
#imnames()으로 행과 열에 이름을 부여했다면 그이름을 접근가능
d['r1',] #1행만출력
d[,'c2'] #2열만출력

d[2,2]
dim(d)
nrow(d)
ncol(d)
#역행렬
solve(d)
#전치행렬
t(d)

# array n 차원행렬
# array(vector,차원,행렬이름)
dim1 <- c('A1','A2')
dim2 <- c('B1','B2','B3')
dim3 <- c('C1','C2','C3','C4')
z <- array(1:24,c(2,3,4),dimnames = list(dim1,dim2,dim3))
z[1,1,1]
z[1,2,3]
z[,,3]
dim(z)
#dataframe
#열마다 서로 다른 유형가 ㄱ질수 이쓴 자료구조 다양한 변수 관측치 범주(factor)를 표현하기위한 자료구조
#data frame(열1,열2,열3)
x<-c(1,2,3,4,5)
y<-c(T,F,T,T,T)
z<-c('a','b','c','d','e')
s<-data.frame(x,z,y)
#작업공간에 생성된 객체의 구조 확인
str(s)
#데이터프레임이름 $ 열이름 형식
s$x
s[1,]
s[,c('x','y')]
s[,c('x')]
#자동으로 백터로 변화하는 것 방지하려면 drop=F
s[,c('x'),drop = F]

x<- data.frame(x=1:1000)
head(x)
tail(x)
1:n+1
1:(n+1)
##문제13
g<-'my'
h<-c(25,26,18,39)
j<-matrix(1:10,nrow=5)
k=c('one','two','three')
mylist<-list(title=g,ages=h,j,k)

mylist
mylist[[2]]
mylist[['ages']]
mylist[2]
mylist$ages
##
patientID<-c(1,2,3,4)
AdmDate<-c(10/15/2014,11/01/2014,10/21/2014,10/28/2014)
age<-c(25,34,28,52)
Diabetes<-c('Type1','Type2','Type1','Type1')
Status<-c('poor','improved','excell','poor')
pationtdata<-data.frame(patientID,AdmDate,age,Diabetes,Status)
pationtdata
#데이터 structure 
str(pationtdata)
#1,2 속성
pationtdata[1:2]
#속성명으로 출력
pationtdata[c('Diabetes','Status')]
pationtdata$age
pationtdata$patientID
pationtdata$Status
# 위 처럼 모든 변수 앞에 pationtdata$ 사용
#특정 속성 출력 불편 - attach(),detach(),with() 사용

#attach()특정 데이터프레임 명을 검색경로에 추가
#detach()특정 데이터 프레임 명을 검생경로에 제거
attach(pationtdata)
patientID
age
Diabetes
Status
detach(pationtdata)
#with(객체명, {속성명})
with(pationtdata,{patientID})
with(pationtdata,
{
  print(patientID)
  print(Status)
})
with(pationtdata,patientID)
#list - 하나의 이아 ㅇ래 다양한 객체들으 ㄹ모아놓은 것
# 키 값 형태로 데이터를 담아 두는 연관 배열의 일종
# list(이름1=객체1, 이름2=객체2, 이름3=객체3,.....)
#단일값 list
sj1<-list(name='지현',kor=1,eng=2,mat=3)
sj1
sj1[1]
sj1['name']   # $name [1] "지현"

sj1[[1]]
sj1[['name']] # [1] "지현"
#vetor을 list 원소로사용
sja1<-list(name='지현',kem=c(1,2,3))
sja1
#지현 영어점수
sja1$kem[2]
sja1[['kem']][2]
#list 자신을 list 원소로구성
mixed<-list(a=sj1,b=sja1)
mixed
#지현영어점수
mixed$b[[2]][2]
mixed$b$kem[2]
mixed[['b']][['kem']][2] 

#sample R scripts 3
mtcars
help(mtcars)
summary(mtcars)
summary(mtcars$mpg)
plot(mtcars$mpg,mtcars$disp)
plot(mtcars$mpg,mtcars$wt)

attach(mtcars)
summary(mpg)
plot(mpg,disp)
detach(mtcars)

with(mtcars,
     {
     print(mpg)
     print(disp)})
#factor
# vector 자료규조에 추가정보가 더해진 것
# 카테고리 자료형을 만들어 데이터에 의미를 부여하고할때사용
a<-1:3
a
factor(a,levels = c(1,3,5))
factor(a,levels = c(1,3,5),labels=c('일','삼','오'))

mgr1_q<-c(5,4,5,5,5)
factor(mgr1_q,levels = c(1,2,3,4,5),labels=c('일','이','삼','좋음','매우좋음'))
