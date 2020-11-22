require(ggplot2)

for (val in c("helicases","cancer1", "cancer2", "cancer3", "spambase1" ) ) {
    data <- read.csv(paste0("../data/",val,".csv"))
    print(val)
    print("Validation")
    print(summary(data$Validation))
    print("Test")
    print(summary(data$Test))
}
