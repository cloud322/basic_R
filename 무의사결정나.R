#의사결정나무

#입력값 결과가 YN 같이 이산형데이터 출력

#supervised 

#앞서 받은 설문지 데이터에서 고객의 특성이나 규칙 파악
#패턴 - 의사결정 알고리즘 이용

#설문조사내용중 직장있고 30대 기혼자는 쿠폰사용 구매할수 있게
s<-read.csv('c:/java/skin.csv')
s
#범주형 factor
str(s)

library(rpart)
tree1<-rpart(쿠폰반응여부~.,data=s,control=rpart.control(minsplit=1))
plot(tree1,compress = T,uniform=T)
text(tree1,use.n=T,col='blue')

tree2<-rpart(쿠폰반응여부~.,data=s,control=rpart.control(minsplit=3))
plot(tree2,compress = T,uniform=T)
text(tree2,use.n=T,col='red')
#minsplit - 가지 분화ㅅ수

#타이타닉 살아남을 사람은?
# http://titanic-survivor.herokuapp.com

#기계학습의 하나로 특정항목에 대한 의사결정 규칙을 이진트리형태로 분류해나가는 기법
#수치형/ 범주형 모두가능
# 카이제곱 t검증 F검증 
#CART CHAID 알고리즘이나 기계학습 계열(엔트로피,정보이득인) ID3 C4.5 C5.0
#rpart - ID3
#tree - CART
install.packages("tree")
library(tree)
s2<-tree(쿠폰반응여부~.,data=s)
plot(s2)
text(s2)
# s 각변수에대해 쿠폰반응여부확인
xtabs(~결혼여부,data=s)
chisq.test(xtabs(~결혼여부,data=s))

xtabs(~결혼여부+쿠폰반응여부,data=s)
chisq.test(xtabs(~결혼여부+쿠폰반응여부,data=s))

#의사결정나무 비율(가중치) 확인


idx<-sample(2,nrow(iris),replace=T,prob=c(0.7,0.3))
idx
train.data<-iris[idx==2,]
train.data
test.data<-iris[idx==1,]
test.data
install.packages("party")
library(party)
library(tree)
iris.tree<-ctree(Species~.,data=train.data)
plot(iris.tree)
plot(iris.tree,type='simple')
