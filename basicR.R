# simple test
# ctrl + shift +c
# one line execution ctrl + enter
print('hello')
# 여러줄
print(
  'hello'
)
#sample R script
#age weight 
age<-c(1,3,5,2,11,9,3,9,12,3)
a = c(1,3,5,2,11,9,3,9,12,3)
weight<-c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)
#입력된값 확인
age
weight

mean(weight)
mean(age)
sd(weight)
var(weight)
cor(age,weight)
#graph
plot(age,weight)
#demo
demo()
#graph demo
demo('graphics')
#도움말 함수
help.start()
#q도움말
help('q')
?q
#R종료
q()
# including word with q
help.search('q')
# online search 
RSiteSearch('q')
#function with letter q
apropos('q',mode = 'function')
# usable on currently installed package
data()
# show all usable 
vignette()
# workspace related function
# current working directory
getwd()
#new working dir
setwd('c:/java')
# all object
ls()
# remove 1~more object
rm(age)
rm(weight)
ls()
#usable options in current dir
options()
# all cmd history
history()
# from the end last 5
history(5)
# save history(.Rhistory)
savehistory('c:/java/myhis')
# load history to memory
loadhistory('파일명')
loadhistory('c:/java/myhis')
#
save(age,file='c:/java/age.data')
load('c:/java/age.data')
#
setwd('c:/java')
dir.create('xyz')

#sample R script2
setwd('c:/java/xyz')
options('digits')
options(digits=3)
options('digits')
x<-runif(20) #20개의 임의의 난수생성
x
#기본적인 통계정보 출력 (최대 최소 평균 중간 최빈mode)
# 하한 사분위값 (데이터의 25%가 이값보다 작거나 같음)
# 상한 사분위값 (데이터의 75%가 이값보다 크나 같음)
summary(x)
#histogram 출력
hist(x)

#package
#package 
.libPaths()
#installed packages
installed.packages()
#
library(help='datasets')
#dataset package hairEyecolor
# to memory
library('datasets') 
HairEyeColor
#install
install.packages('packageName')
install.packages('rJava')
update.packages()
remove.packages('rJava')
# installing package한번만 실행
# 라이브러리 적잰느 매번 실행해야함
# 한편 특정함수 실행할때 library 명령없이 사용가능한 함수 있음 - base system package

#도움말을 열어  'introduction R' 을 열어보자
#vcd package 설치
#이용간으한 function & dataset
#package Arthritis 적재 데이터집합 살펴
#Artritis dataset print
#Artritis example 실행

help('introduction')
?Introduction
RSiteSearch('intorduction')

install.packages('vcd')
library('datasets') 
Arthritis
##
help.start()
install.packages('vcd')
library(help='vcd')
library('vcd') 
Arthritis
help('Arthritis')
# examples
example('Arthritis')

# or Examples

data("Arthritis")
art <- xtabs(~ Treatment + Improved, data = Arthritis, subset = Sex == "Female")
art

mosaic(art, gp = shading_Friendly)
mosaic(art, gp = shading_max)
