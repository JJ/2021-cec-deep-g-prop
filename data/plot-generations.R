library(ggplot2)
library(ggthemes)

generations <- read.csv("../data/ng-spambase1-generations.csv")
ggplot(generations,aes(x=Generation,y=Average.F2,group=Generation,color="Average F2"))+geom_boxplot()+geom_boxplot(aes(x=Generation,y=Max.F2,group=Generation, color="Max F2", fill="Max F2"))+theme_tufte()


ggplot(generations,aes(x=Generation,y=Average.Acc,group=Generation,color="Average Accuracy"))+geom_boxplot()+geom_boxplot(aes(x=Generation,y=Min.Acc,group=Generation, color="Min Accuracy", fill="Max Accuracy"))+theme_tufte()
