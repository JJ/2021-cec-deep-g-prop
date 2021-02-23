

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


wilcox.test( spambase1.lr11$Validation, spambase1.base$Validation)
wilcox.test( spambase2.lr11$Validation, spambase2.base$Validation)
wilcox.test( spambase3.lr11$Validation, spambase3.base$Validation)

wilcox.test( spambase1.lr11$Test, spambase1.base$Test)
wilcox.test( spambase2.lr11$Test, spambase2.base$Test)
wilcox.test( spambase3.lr11$Test, spambase3.base$Test)
