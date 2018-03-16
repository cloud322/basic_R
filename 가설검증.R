# 가설검증

#추정
#확률표본

#점추정 - 모특 특정의값
#구간추정 -일정구간설정 

#신뢰구간
#점추정은 특성상 신뢰도 떨어짐 -구간으보 보완 \

#단일모집단의 모평균에 대신 신뢰구간 추정 및 검증
t.test()

s<-c(165,159,170,168,170,172,167, 158,170,171,164,165,168,167,171,200)
mean(s)
t.test(s)
geo_mean(s)


#단일 모집단의 모분산에 대한 신뢰구간 추정 및 검증 
카이제곱

#단일 모집단의 모분산에 대한 신뢰구간 추정 및 검증 
prop.test
# 100명중 48명이 이상표를 선호 
prop.test(48,100) #95%
prop.test(48,100, conf.level = 0.9)
prop.test(48,100, conf.level = 0.999999999999999)

prop.test(620,1350) 
prop.test(620,1350, conf.level = 0.99)
#가설검증
#현재가설 귀무가설 H0 대립가설 H1

#치료의 차도가 신약의 외부요인때문인여지 부 확인
#귀무 신약치료 효과 없다 a=b
#대립 신약 치료효과 있다 a>b

H0==0
H1!=0

?t.test
?prop.test
heads <- rbinom(1, size = 100, prob = .5)
prop.test(heads, 100)          # continuity correction TRUE by default
prop.test(heads, 100, correct = FALSE)

## Data from Fleiss (1981), p. 139.
## H0: The null hypothesis is that the four populations from which
##     the patients were drawn have the same true proportion of smokers.
## A:  The alternative is that this proportion is different in at
##     least one of the populations.

smokers  <- c( 83, 90, 129, 70 )
patients <- c( 86, 93, 136, 82 )
prop.test(smokers, patients)
