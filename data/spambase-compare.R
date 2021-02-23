library(ggplot2)
library(ggthemes)

spambase1.base <- read.csv("../data/spambase1-p64.csv")
spambase2.base <- read.csv("../data/spambase2-p64.csv")
spambase3.base <- read.csv("../data/spambase3-p64.csv")

spambase1.tf <- read.csv("../data/cec-2021-spambase-1.csv")
spambase2.tf <- read.csv("../data/cec-2021-spambase-2.csv")
spambase3.tf <- read.csv("../data/cec-2021-spambase-3.csv")

wilcox.test( spambase1.tf$Validation, spambase1.base$Validation)
wilcox.test( spambase2.tf$Validation, spambase2.base$Validation)
wilcox.test( spambase3.tf$Validation, spambase3.base$Validation)

wilcox.test( spambase1.tf$Test, spambase1.base$Test)
wilcox.test( spambase2.tf$Test, spambase2.base$Test)
wilcox.test( spambase3.tf$Test, spambase3.base$Test)

spambase1.lr11 <- read.csv("../data/cec-2021-spambase1-lr11.csv")
spambase2.lr11 <- read.csv("../data/cec-2021-spambase2-lr11.csv")
spambase3.lr11 <- read.csv("../data/cec-2021-spambase3-lr11.csv")


wilcox.test( spambase1.lr11$Validation, spambase1.tf$Validation)
wilcox.test( spambase2.lr11$Validation, spambase2.tf$Validation)
wilcox.test( spambase3.lr11$Validation, spambase3.tf$Validation)

wilcox.test( spambase1.lr11$Test, spambase1.tf$Test)
wilcox.test( spambase2.lr11$Test, spambase2.tf$Test)
wilcox.test( spambase3.lr11$Test, spambase3.tf$Test)

comparison.layers <- data.frame(experiment=c(rep("spambase1.3L",length(spambase1.tf$Test)),
                                             rep("spambase1.1L",length(spambase1.lr11$Test)),
                                             rep("spambase2.3L",length(spambase2.tf$Test)),
                                             rep("spambase2.1L",length(spambase2.lr11$Test)),
                                             rep("spambase3.3L",length(spambase3.tf$Test)),
                                             rep("spambase3.1L",length(spambase3.lr11$Test))),
                                Accuracy=c(spambase1.tf$Test,spambase1.lr11$Test,
                                           spambase2.tf$Test,spambase2.lr11$Test,
                                           spambase3.tf$Test,spambase3.lr11$Test))

ggplot(comparison.layers,aes(x=experiment,y=Accuracy,group=experiment))+geom_boxplot(notch=T)+theme_tufte()

comparison.overall <- data.frame(experiment=c(rep("spambase.3L",length(spambase1.tf$Test)),
                                             rep("spambase.1L",length(spambase1.lr11$Test)),
                                             rep("spambase.3L",length(spambase2.tf$Test)),
                                             rep("spambase.1L",length(spambase2.lr11$Test)),
                                             rep("spambase.3L",length(spambase3.tf$Test)),
                                             rep("spambase.1L",length(spambase3.lr11$Test))),
                                Accuracy=c(spambase1.tf$Test,spambase1.lr11$Test,
                                           spambase2.tf$Test,spambase2.lr11$Test,
                                           spambase3.tf$Test,spambase3.lr11$Test))

wilcox.test(comparison.overall[comparison.overall$experiment=="spambase.3L",]$Accuracy, comparison.overall[comparison.overall$experiment=="spambase.1L",]$Accuracy)

spambase1.t.tf <- read.csv("../data/cec-2021-spambase-1-times.csv")
spambase2.t.tf <- read.csv("../data/cec-2021-spambase-2-times.csv")
spambase3.t.tf <- read.csv("../data/cec-2021-spambase-3-times.csv")

spambase1.t.lr11 <- read.csv("../data/cec-2021-spambase-1-lr11-times.csv")
spambase2.t.lr11 <- read.csv("../data/cec-2021-spambase-2-lr11-times.csv")
spambase3.t.lr11 <- read.csv("../data/cec-2021-spambase-3-lr11-times.csv")

wilcox.test(spambase3.t.tf$Time,spambase3.t.lr11$Time)

spambase1.lr12 <- read.csv("../data/cec-2021-spambase1-lr12-mg48.csv")
spambase2.lr12 <- read.csv("../data/cec-2021-spambase2-lr12-mg48.csv")
spambase3.lr12 <- read.csv("../data/cec-2021-spambase3-lr12-mg48.csv")

comparison.generations <- data.frame(experiment=c(rep("spambase1.3L",length(spambase1.tf$Test)),
                                                  rep("spambase1.2L",length(spambase1.lr12$Test)),
                                                  rep("spambase2.3L",length(spambase2.tf$Test)),
                                                  rep("spambase2.2L",length(spambase2.lr12$Test)),
                                                  rep("spambase3.3L",length(spambase3.tf$Test)),
                                                  rep("spambase3.2L",length(spambase3.lr12$Test))),
                                Accuracy=c(spambase1.tf$Test,spambase1.lr12$Test,
                                           spambase2.tf$Test,spambase2.lr12$Test,
                                           spambase3.tf$Test,spambase3.lr12$Test))


ggplot(comparison.generations,aes(x=experiment,y=Accuracy,group=experiment))+geom_boxplot(notch=T)+theme_tufte()
