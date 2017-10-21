set.seed(1313)

N <- 100000
p <- 25
X <- matrix(round(runif(N*p*2),3)*100, nrow = N, ncol = p*2)
X <- as.data.frame(X)

for (i in 1:10) {
  X[,i] <- cut(X[,i], breaks = (0:2)*50.1, labels = LETTERS[1:2], include.lowest=T)
  X[,i+10] <- cut(X[,i+10], breaks = (0:4)*25.1, labels = LETTERS[1:4], include.lowest=T)
}

s1 <- 4*(X$V22/100 - 0.5)^2
s2 <- X$V45/100
s3 <- -X$V25/100
s4 <- sin(X$V50/15)
s5 <- pmax(X$V33, 50)/50
s6 <- X$V14 == "A"
s7 <- X$V15 == "A"
s8 <- cos(X$V49/15)
s9 <- 4*(X$V21/100 - 0.5)^2

am <- X[,c("V22","V45","V35","V50","V33","V14","V15","V49","V21")]
rf <- randomForest::randomForest(y[1:50000]~., data=am[1:50000,])

ss <- s1 + 
  s2 + 
  s3 + 
  s4 + 
  s5 + 
  s6 + 
  s7 + 
  s8 + 
  s9

nX <- X[,sample(1:50, replace = FALSE)]
colnames(nX) <- c(paste0(LETTERS, "1"), paste0(LETTERS, "2"))[1:50]


rr <- ss - 2.5
pp <- exp(rr)/(exp(rr)+1)

y <- rbinom(length(pp), 1, pp)

summary(glm(y~., data=X))

summary(glm(y~., data=nX))

ndf <- data.frame(y = c("klasa +", "klasa -")[y+1], nX)

ndf_train <- ndf[1:50000,]
ndf_test <- ndf[50001:100000,]
ndf_test_raw <- ndf_test[,-1]

save(ndf_train, ndf_test, ndf_test_raw, file = "dane.rda")

write.table(ndf_train, file="zbior_uczacy.txt", sep=";")
write.table(ndf_test_raw, file="zbior_testowy.txt", sep=";")
