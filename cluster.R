#군집분석
#다중척도법 계량

#각객체 유사성 측정 유사성 높은 집단 분류
#군집에 속한 유사성과 서로다른 군집 속한 개체간 상이성 규명 분석방법

#개별군집의 특성은 ㄱ가 군집에 속한 구성원들의 평균값으로 
#나타낼수 있고 이겄은 다른 군집간의 이질성을 구분하는데 사용할수 있음

#가장 가까운 데이터들 끼리 먼저 연결하여 트리형태로 표시
# 이러한 트리를 덴드로 그램이라함   ((Dendrogram))
a<-read.csv('c:/java/aca.csv')
a

install.packages("cluster")
library(cluster)
aca_dist<-dist(a)^2
hc1<-hclust(aca_dist,method='single')#최단거리
plot(hc1,hang=1)

hc2<-hclust(aca_dist,method='complete')#최장거리 
plot(hc2,hang=1)

hc3<-hclust(aca_dist,method='average')#평균거리
plot(hc3,hang=1)

#비계층적군집방법 - k-mean
km4<-kmeans(a,4);km4#군집 4
km5<-kmeans(a,5);km4#군집 5
km6<-kmeans(a,6);km4#군집 6

plot(a,col=km4$cluster)
plot(a,col=km5$cluster)
plot(a,col=km6$cluster)

# cluster means : 각군집중심점 (평균값)
# clustering vector : 각요소의 군집 분류번호