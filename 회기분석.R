#회기분석
#상관분석은 변수들이 얼마나 밀접한과계
#회기분석은 상관분석+ 예측
#변수 한가지 이상 가느능

#독립변수 종속변수 
# mean 으로 회기
#영향 가설적실험 인과관계 모델링 등

# 회기분석에는 선형회귀분석과 로지스틱 회귀분석 있음

p<-c(110,120,130,140,150)
c<-c(100,105,128,115,142)
plot(p,c,pch=20,col='red')

iq<-lm(c~p)
abline(lm(c~p))
#y=-4.20 + 0.94x

# Call:
#   lm(formula = c ~ p)
# 
# Coefficients:
#   (Intercept)            p  
# -4.20         0.94  

#lm() 으로 구한 회귀식이 통계적으로 유의 여부 확인 
summary(iq)
# Call:
#   lm(formula = c ~ p)
# 
# Residuals:
#   1     2     3     4     5 
# 0.8  -3.6  10.0 -12.4   5.2 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)  
# (Intercept)  -4.2000    40.9644  -0.103   0.9248  
# p             0.9400     0.3133   3.001   0.0576 .
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 9.906 on 3 degrees of freedom
# Multiple R-squared:  0.7501,	Adjusted R-squared:  0.6668 
# F-statistic: 9.004 on 1 and 3 DF,  p-value: 0.05764

# p-value: 0.05764
# Adjusted R-squared:  0.6668
# F-statistic: 9.004 on 1 and 3 DF
coef(iq)
predict(iq,data.frame(c(117,117,117,117,117)))

#cars
cars
head(cars)  

plot(cars)
plot(cars$speed,cars$dist)

c<-lm(cars)
c
d2<-lm(cars$speed~cars$dist)
abline(d2,col='blue')
d<-lm(cars$dist~cars$speed)
abline(d,col='red')

summary(c)
# Call:
#   lm(formula = cars)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -7.5293 -2.1550  0.3615  2.4377  6.4179 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  8.28391    0.87438   9.474 1.44e-12 ***
#   dist         0.16557    0.01749   9.464 1.49e-12 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 3.156 on 48 degrees of freedom
# Multiple R-squared:  0.6511,	Adjusted R-squared:  0.6438 
# F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12

a<-read.csv('c:/java/a.csv',header=T)
head(a)
plot(a)
plot(a[[4]],a[[8]])
plot(a$rides,a$overall)
b<-lm(overall~rides)
b
abline(b,col='blue')
summary(b)
# Call:
#   lm(formula = a$overall ~ a$rides)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -33.597 -10.048   0.425   8.694  34.699 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -94.9622     9.0790  -10.46   <2e-16 ***
#   a$rides       1.7033     0.1055   16.14   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 12.88 on 498 degrees of freedom
# Multiple R-squared:  0.3434,	Adjusted R-squared:  0.3421 
# F-statistic: 260.4 on 1 and 498 DF,  p-value: < 2.2e-16

# 다항선형 회귀분석 
#놀이기구+게임+청결도
head(a)
a
plot(overall~rides+games+clean)
attach(a)
MR<-lm(overall~rides+games+clean)
MR
# (Intercept)        rides        games        clean  
# -131.6788       0.5780       0.2603       1.2838  

summary(MR)

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -31.628  -8.820   0.387   8.488  35.261 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -131.67877    9.38425 -14.032  < 2e-16 ***
#   rides          0.57798    0.15991   3.614 0.000332 ***
#   games          0.26028    0.07709   3.376 0.000793 ***
#   clean          1.28381    0.17764   7.227 1.88e-12 ***
#
# Residual standard error: 11.93 on 496 degrees of freedom
# Multiple R-squared:  0.4392,	Adjusted R-squared:  0.4358 
# F-statistic: 129.5 on 3 and 496 DF,  p-value: < 2.2e-16
#############################################################
c<-read.csv('c:java/c.csv')
head(c)
#로지스틱회귀분석 
#선형회귀분석에서는 특정 독립녀수 입력하면 회귀식 통해 수치결과
#소득, 시험성적,연간소득 - 선형회귀사용

#예측하고자 하는것이 수치적으로 나타내기 어려운 것은 -로지스틱

#범주형 데이터인 경우 적용
str(c)
#rank 이산형 데이터이므로 범주형으로 전환
range(c$rank)
c$rank<-as.factor(c$rank)
#회귀 분석
glm_c<-glm(admit~gre+gpa+rank,family = 'binomial',c)
glm_c
summary(glm_c)

