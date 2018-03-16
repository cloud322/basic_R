#graph1
#숫자와 텍스트만으로 작성된 통계결과 지루
#그래프와 그림형태제 ㅈ시 (시각적묘사)

#그래프그리고 plot(x,y) plot(y~x)
x<-c(1:10)
y<-c(10:1)
plot(x,y)
plot(y~x)

x<-c(-5:5)
y<-(3*x)+5
plot(x,y)

x<-c(1:100)
y<-sqrt(x)
plot(x,y)

y<-log(x)
plot(x,y)

plot(rnorm(15))
hist(rnorm(15))
boxplot(rnorm(15))

#그래프출력방향 지정 sink()
install.packages("googleVis")
library(goggleVis)

bmp('c:/Java/graph.bmp')
png('c:/Java/graph.png')
pdf('c:/Java/graph.pdf')
jpeg('c:/Java/graph.jpeg')
head(mtcars)
attach(mtcars)
plot(wt,mpg) 
abline(lm(mpg~wt)) 
title('차량 중량에따른 연비 상관관계')
detach(mtcars)
sink()
dev.off()

plot(wt,mpg,type='p') #점 
plot(wt,mpg,type='l') #선
plot(wt,mpg,type='h') #수직선 
plot(wt,mpg,type='s') #계단식
plot(wt,mpg,type='S') #계단식

#graph 옵션 설정 par()
#pch 점종류 0~25
#lty 선종류 1~6
#cex 기호크기 1,1.5,0.5
#lwd 선굵기 1, 1.5, 0.5 
par(lty=2, pch = 17,lwd =3,cex= 1)
plot(wt,mpg,type = 'b')
#or
plot(wt,mpg,type = 'b',lty=2, pch = 17,lwd =2,cex= 1)

par(bg='light cyan')

plot(wt,mpg,col='red',col.axis='blue',col.lab='green',col.main='purple',main='main',col.sub='navy',sub='서브',fg='orange')
#사용가능 색상조회
colors()
c1<-rainbow(7)
c2<-heat.colors(10)
c3<-topo.colors(10)
c4<-cm.colors(10)
c5<-gray(0:10/10)
plot(1:10,10:1,col=c1)
plot(1:10,10:1,col=c2)
plot(1:10,10:1,col=c3)
plot(1:10,10:1,col=c4)
plot(1:10,10:1,col=c5)

#iris 에서 종별로 색상을 지정선 산점도 출력
head(iris)
#plot(formula=Petal.Width~Sepal.Width,data=sample,xlab='sepal넓이',ylab='petal넓이', xlim=c(4,6), ylim(0,1),col=c('red','blue','green')[Species])
plot(Petal.Width~Sepal.Width,iris,main='iris',xlab='sepal넓이',ylab='petal넓이',col=c('red','blue','green')[Species])
#원원
pie(rep(1:10),labels=c1,col=c1)
pie(rep(1:10),labels=c2,col=c2)
pie(rep(1:10),labels=c3,col=c3)
pie(rep(1:10),labels=c4,col=c4)

#글씨변 변경 windowsFonts
windowsFonts(
A=windowsFont("궁서체"),
B=windowsFont('Consolas'),
C=windowsFont('고딕')
)

#그래프옵션초기
par(mfrow=c(1,1))
#1기본 2진하게 3이탤릭 4 진하고이텔릭
par(font.lab=3,font.main=4,font.axis=2,family='B')
plot(wt,mpg,type = 'b',main = 'font')

#범례 - legend(위치,제목,범레)
install.packages("Hmisc")
library(Hmisc)
minor.tick(nx=3,ny=3,tick.ratio = 0.5)
par(mfrow=c(1,1))
plot(wt,mpg,type = 'b',lty=1, pch = 15,col='red',ylim = c(0,60),main = 'wt,mpg')
lines(wt,cyl,type = 'b',lty=2, pch = 17,col='blue')   #두번쨰그레프
abline(h=c(30),lwd=1.5,lty=2,col='gray')  #보조선
#legend('topleft',inset=0.5,title='',c('A','B'),lty=c(1,2),pch = c(15,17),col=c('red','blue')) 
legend('topleft',title='',c('A','B'),lty=c(1,2),pch = c(15,17),col=c('red','blue')) 
#위치는 3x3으나 나누어진 영역을 top center bottom left right 조합
#한화면에 여러개의 그래프 배치
# mfrow=c(행,열)
# mfcol=c(행,열)

#2x2 형태그,래프
par(mfrow=c(2,2))
attach(mtcars)
plot(wt,mpg,main = '차량두게 대비 연비 산점도')
plot(wt,disp,main = '차량두게 대비 연비 산점도')
hist(wt,main = '차량무게 히스토 ')
boxplot(wt,main='차량무게 박스 그래프')
detach(mtcars)
#1x2 형태그 그래프
par(mfrow=c(3,1))
attach(mtcars)
plot(wt,mpg,main = '차량두게 대비 연비 산점도')
plot(wt,disp,main = '차량두게 대비 연비 산점도')
hist(wt,main = '차량무게 히스토 ')
detach(mtcars)

#layout 영역의 갯수는 행렬을이용
# layout(matrix(영역번호),너비,높이)
#layout.snow() -영역 미리볼있 이음

attach(mtcars)
layout(matrix(c(1,1,2,3),2,2))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)


attach(mtcars)
layout(matrix(c(1,1,2,3),2,2,byrow = T))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)

#split.screen() - 화면분할
#split.screen(c(행,열),스크린번호 )

attach(mtcars)
split.screen(c(2,1))  #screen 2행 1열로나눔
split.screen(screen=2,c(1,2)) #2행1열 스크린을 1행 2열나 누눔
screen(1)#1,1
hist(wt)
screen(3)#2,1
hist(mpg)
screen(4)#2,2
hist(disp)
detach(mtcars)
close.screen(all=T)


