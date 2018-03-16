#readData
#데이터를 외부로부터 가저오는 방법
#1 -키보드로 입력 - edit(),fix()
#작은 데이터 칩합 사용 경우
smalldata <- data.frame(age=numeric(0),weight=numeric(0.0))
smalldata<-edit(smalldata)
smalldata
#R 의 데이터 타입
#numeric charactor logical 
m<-data.frame(date=character(),country=character(),gender=character())
m<-edit(m)
m
#텍스트 형태로 입력 - read.table() 함수사용
txtdata<-'
age,weight
1 0.7
2 1.2
3 1.3'
txtdata

txtdata<- read.table(header = T,text=txtdata)
txtdata
#구분된 파일 에서 데이터 읽어오기
sales<- read.table('c:/java/sales.txt',sep = ',')
sales<- read.table('c:/java/sales.txt',sep = ',',header=F,colClasses = c('character','numeric','numeric'))
sales

stations<- read.table('c:/java/stations.csv',sep = ',',header=F)
str(stations)

me<- read.table('c:/java/SummerMedallists.txt',sep = '\t',header=T)
me
#csv 파일 읽기
#read.csv (파일명 옵션들...)

?read.csv()
?read.csv2()

stat<- read.csv('c:/java/stations.csv',header = F,na.strings = '')
#엑셀로 데이터읽어오기
install.packages('readxl')
library('readxl')
med<-read_excel('c:/java/SummerMedallists.xlsx',sheet=1)
str(med)

#또다른 패키지 xlsx
sys.setenv(JAVA_HOME='C:/JAVA/jdk1.8.0_152')
install.packages('rJava')
install.packages('xlsx')
library('xlsx')
med<-read_excel('c:/java/SummerMedallists.xlsx',sheetIndex=1)
str(med)
med

#html xml 파일 읽어 오기
install.packages('XML')
library('XML')
library('methods')
xmldata<-xmlParse('c:/Java/emp.xml')
empdata<-xmlToDataFrame('c:/Java/emp.xml')
empdata

#JSON
install.packages('jsonlite')
library('jsonlite')
install.packages('httr')
library('httr')
#jsondata<- fromJSON('c:/Java/primer-dataset.json')
jsondata<- fromJSON('https://api.github.com/users/hadley/repos')
jsondata

#대용량
zip1<-read.table('c:/Java/서울특별시-2017.10.csv',sep = ',',stringsAsFactors = F, header = T,fill=T)
zip2<-read.csv('c:/Java/서울특별시-2017.10.csv',sep = ',',stringsAsFactors = F, header = T)
head(zip)
str(zip1)
str(zip2)

install.packages('data.table')
library(data.table)

?fread
fread('c:/Java/서울특별시-2017.10.csv',sep = ',',header = T,stringsAsFactors = F)

#관계형 데이터베이스
#R에서는 RDBMS 에서 데이터를 읽어올수 있는 다양한 환경 지원
# R <- MySQL
install.packages('RMySQL')
library('RMySQL')
mysqlconn = dbConnect(MySQL(),user='cloud',password='Abcdef_12',dbname='cloud',host='192.168.27.128')
#테이블목출 출ㄹ
emp<-dbListTables(mysqlconn)
emp<-dbSendQuery(mysqlconn, 'select * from employees')
emp<-fetch(emp)
str(emp)

dbWriteTable(mysqlconn,'테이블명',객체명,overwrite=T)
dbDisconnect(mysqlconn)

# R<- Oracle
sys.setenv(JAVA_HOME='C:/JAVA/jdk1.8.0_152')
install.packages('DBI',dep=T)
install.packages('RJDBC',dep=T)
library('DBI')
library('RJDBC')
library('rJava')

drv<-JDBC('oracle.jdbc.OracleDriver',classPath = 'D:/빅데이터/JDBC/ojdbc7.jar','')
oraconn<-dbConnect(drv,'jdbc:oracle:thin:@192.168.27.128:1521:xe','hr','hr')
oemp<-dbGetQuery(oraconn,'select *from EMPLOYEES')
str(oemp)
dbDisconnect(oraconn)
