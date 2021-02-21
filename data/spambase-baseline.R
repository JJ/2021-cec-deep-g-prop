library("knitr")

spambase1.base <- read.csv("../data/spambase1-p64.csv")

spambase <- data.frame( partition = "spambase1",
                       best.validation = min(spambase1.base$Validation),
                       median.validation = median(spambase1.base$Validation),
                       average.validation = mean(spambase1.base$Validation),
                       best.test = min(spambase1.base$Test),
                       median.test = median(spambase1.base$Test),
                       average.test = mean(spambase1.base$Test),
                       sd.test = sd(spambase1.base$Test))

spambase2.base <- read.csv("../data/spambase2-p64.csv")

spambase <- rbind( spambase,
                  data.frame( partition = "spambase2",
                       best.validation = min(spambase2.base$Validation),
                       median.validation = median(spambase2.base$Validation),
                       average.validation = mean(spambase2.base$Validation),
                       best.test = min(spambase2.base$Test),
                       median.test = median(spambase2.base$Test),
                       average.test = mean(spambase2.base$Test),
                       sd.test = sd(spambase2.base$Test) ) )

spambase3.base <- read.csv("../data/spambase3-p64.csv")

spambase <- rbind( spambase,
                  data.frame( partition = "spambase3",
                       best.validation = min(spambase3.base$Validation),
                       median.validation = median(spambase3.base$Validation),
                       average.validation = mean(spambase3.base$Validation),
                       best.test = min(spambase3.base$Test),
                       median.test = median(spambase3.base$Test),
                       average.test = mean(spambase3.base$Test),
                       sd.test = sd(spambase1.base$Test) ) )

knitr::kable(spambase)
