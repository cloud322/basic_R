#dataManage3

#결측치 -  Na, 9999, unknown, not answer
#누락된값 비어있는 값 - ㅎ마수적용 불가 분석결왜 왜곡
#제거 또는 대체분 분실 실시
gender<-c('M','F','M','M','F')
score<-c(5,3,2,NA,4)
df<- data.frame(gender,score)

#결측치확인
is.na(df)

#결측치 빈도확인
table(is.na(df))
df[3,1]<-NA
table(is.na(df))
#성별에서 결측치 측정
table(is.na(df$gender))
#평균계산 결측치 NA포함생태 - NA 출력
mean(df$score)
sum(df$score)

#결측치처리 - na.rm
mean(df$score,na.rm=T)
#결측치처리 - na.omit
odf<-na.omit(df)
odf
mean(odf$score)

#MASS 라이브러리의 Cars93 데이집 집합에서 결측값 모두 몇개?
library(MASS)
head(Cars93)
table(is.na(Cars93))
is.na(Cars93)
#결측치 확인 - 관측치에겨 결픅값이 있는지 여부 검사
# 데이터 프레임의 각 행대에 대해 결측치를 확인
#행에 저장된 값이 모두 결측치가 아닌 경우에만 TRUE반환
complete.cases(Cars93)
table(complete.cases(Cars93))

#is.na vs complete.case 
#is.na 는 컬럼에대해 NA 여부확인
#complete.cases 는 행에대해 NA여부확인

#예제
library(sqldf)
iris_na<-iris
iris_na [c(10,20,25,40,32),3]<-NA
table(is.na(iris_na))
table(complete.cases(iris_na))
iris_na [c(33,100,125),1]<-NA
table(is.na(iris_na))
table(complete.cases(iris_na))

#결측값 처리
#결측값 행 제거
#평균값 또임 임의의값으로 대체임
#R에서는 DMwR패키지를 이용해서 중앙값으로대체
#R에서는 DMwR패키지를 이용해서 KNN 알고리즘이용해서 가중평균치로 대체
install.packages('DMwR')
library(DMwR)
#임의의값으로대체
df
odf<-df
is.na(odf$score)
odf$score[is.na(odf$score)]<-0
#or
df
odf<-df
# NA 제외평균계산
omean<-mean(odf$score,na.rm = T)
# NA항목 평균대체
odf$score<-ifelse(is.na(odf$score),omean,odf$score)
odf
# iris 예
head(iris_na)
table(iris_na)
is.na(iris_na)
table(is.na(iris_na))
iris_na[is.na(iris_na)]<-0
iris_na
summary(iris_na)
#DMwR편 - 중앙값대체
----------------------------
iris
iris_na<-iris
iris_na [c(10,20,25,40,32),3]<-NA
table(is.na(iris_na))
table(complete.cases(iris_na))
iris_na [c(33,100,125),1]<-NA
------------------------------
#위에서 구한 중ㅇ앙값을 NA가 위치한곳에 대체 - 불펴
mapply(median, iris_na[1:4],na.rm=T)

iris_na
centralImputation(iris_na[1:4])[c(10,20,25,40,32,33,100,125),]
iris_na
#DMwR - KNN
knnImputation(iris_na[1:4])[c(10,20,25,40,32,33,100,125),]


#이상치
# 정상 기준에서 벗어나면 결측처리
#논리적판단: 나이가 150을 넘어서면 이상 국어점수가 100넘으면 극단
#통계적판단: 평균으로부터 3표준편차 떨어진값 사분위수에하 핟단 상단 경계값을벗어난 값

age<-c(10,23,33,999,121)
score<-c(200,50,75,88,150)
name<-c('a','b','c','d','e')
df2<-data.frame(name,age,score)
df1

#이상치판단 - NA대체 ->결측처리
df2$age <- ifelse(df2$age>100 | df2$age<0 ,NA,df2$age)
df2$score <- ifelse(df2$score>100 | df2$score<0 ,NA,df2$score)
#논리적 판단에 의해 이상치들은 NA 로대체
df2
!complete.cases(df2)
df2_na<-centralImputation(df2)[!complete.cases(df2),]
df2_na<-knnImputation(df2)[!complete.cases(df2),]
#Not sufficient complete cases for computing neighbors.
?knnImputation
# NA 결측치들평 중앙값으로 대체
df2_na

df2<-rbind(na.omit(df2),df2_na)
df2



#mpg 데이집 집합에서 drv 에 이상치가 있는알 알아보고 수정
#결측처리시 %in% 연산자
#%in% c('f','r','4')
#drv : r 후륜 f전륜  4사류

head(Cars93)
str(Cars93)

mpgdrv<-mpg$drv
table(mpgdrv) #이상치여부확인
mpgdrv<-ifelse(mpgdrv %in% c('f','r','4'),mpgdrv,NA)
mpgdrv
!complete.cases(mpgdrv)
mpgdrv_na<-knnImputation(mpgdrv)[!complete.cases(mpgdrv),]
mpgdrv<-rbind(na.omit(mpgdrv),mpgdrv_na)

library(ggplot2)
mpg #1999년부터 200년년까지 38 인가차종에대한 연비통계