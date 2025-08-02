install.packages("pROC")
install.packages("randomForest")
library(pROC)
library(randomForest)
set.seed(420)
num.samples<-100
weight<-sort(rnorm(n=num.samples,mean=172,sd=29))
obese<-ifelse(runif(n=num.samples)<(rank(weight)/100),1,0)
obese
plot(x=weight,y=obese)
glm.fit=glm(obese~weight,family=binomial)
lines(weight,glm.fit$fitted.values)

#For ROC
roc(obese,glm.fit$fitted.values,plot=TRUE)
par(pty="s")
roc(obese,glm.fit$fitted.values,plot=TRUE)
roc(obese,glm.fit$fitted.values,plot=TRUE,legacy.axes=TRUE)
roc(obese,glm.fit$fitted.values,plot=TRUE,legacy.axes=TRUE,percent=TRUE,xlab=
      "False positive percentage", ylab="True positive percentage", 
    col="#377eb8", lwd=4)
roc.info<-roc(obese,glm.fit$fitted.values,legacy.axes=TRUE)
roc.df<-data.frame(tpp=roc.info$sensitivities*100,
                   fpp=(1-roc.info$specificities)*100,
                   thresholds=roc.info$thresholds)
head(roc.df)
tail(roc.df)
roc.df[roc.df$tpp>60&roc.df$tpp<80]

#For AUC
roc(obese,glm.fit$fitted.values,plot=TRUE,legacy.axes=TRUE,
    percent=TRUE,xlab="False positive percentage", ylab="True positive percentage",
    col="#377eb8",lwd=4,print.auc=TRUE,print.auc.x=45,partial.auc=c(100,90),
    auc.polygon=TRUE,auc.polygon.col="#377eb8")

#For random forest
roc(obese,glm.fit$fitted.values,plot=TRUE,legacy.axes=TRUE,
    percent=TRUE,xlab="False positive percentage", ylab="True positive percentage",
    col="#377eb8",lwd=4,print.auc=TRUE,print.auc.x=45,partial.auc=c(100,90),
    auc.polygon=TRUE,auc.polygon.col="#377eb8")
plot.roc(obese,rf.model$votes[,1], percent=TRUE, col="#4daf4a",lwd=4,
         print.auc=TRUE,add=TRUE,print.auc.y=40)
legend("bottomright",legend=c("Logistic Regression", "Random Forest"),
       col=c("#377eb8","#4daf4a"),lwd=4)

par(pty="m")
