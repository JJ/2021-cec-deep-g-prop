require(ggplot2)

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
