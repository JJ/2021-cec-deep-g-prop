require(ggplot2)
require(ggthemes)


plotting <- read.csv("../data/helicases.csv")
ggplot(plotting, aes(x=Experiment,y=Test,group=Experiment))+geom_boxplot()+theme_tufte()
for (val in c("helicases","cancer1", "cancer2", "cancer3", "spambase1", "spambase2", "spambase3" ) ) {
    data <- read.csv(paste0("../data/",val,".csv"))
    print(val)
    print("Validation")
    print(summary(data$Validation))
    print(sd(data$Validation))
    print("Test")
    print(summary(data$Test))
    print(sd(data$Test))
    print("Generations")
    print(summary(data$Generations))
    print(sd(data$Generations))

}
