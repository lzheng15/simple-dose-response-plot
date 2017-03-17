#arsenic and hypertension data for review!
arhyp<-read.csv("C:/Users/lzheng/Documents/arsenic ckd systematic review/Dose Response Table.csv", na=".")
save(arhyp,file="arhyp.rda") 

#Dose response plot for albuminuria!

#set working directory for systematic review folders
setwd("C:/Users/lzheng/Documents/arsenic ckd systematic review")
getwd()

#read in data
albuminuria<-read.csv("C:/Users/lzheng/Documents/arsenic ckd systematic review/test-albuminuria.csv", na=".")
# saves as an R object, use extension .rda
save(albuminuria,file="albuminuria.rda") 
names(albuminuria)

#load from pre-saved data
load("C:/Users/lzheng/Documents/arsenic ckd systematic review/albuminuria.rda")

######################################################################################################################
#start plotting!

plot(albuminuria$x,log(albuminuria$OR),xlim=c(0,1.30),ylim=c(log(0.8),log(2)),type="n",xlab="Relative arsenic increase vs. baseline category",ylab="Relative Risk Estimate",axes=F)

#Chen Y 2011, part 1, cross sectional
points(albuminuria$x[c(1)],log(albuminuria$OR[c(1)]),pch=16,col=1,cex=2)
points(albuminuria$x[c(2,3,4,5)],log(albuminuria$OR[c(2,3,4,5)]),pch=16,col=1,cex=2)
segments(albuminuria$x[c(1)],log(albuminuria$OR[c(1)]),albuminuria$x[c(2)],log(albuminuria$OR[c(2)]),lty=1,lwd=3,col=1)
segments(albuminuria$x[c(2)],log(albuminuria$OR[c(2)]),albuminuria$x[c(3)],log(albuminuria$OR[c(3)]),lty=1,lwd=3,col=1)
segments(albuminuria$x[c(3)],log(albuminuria$OR[c(3)]),albuminuria$x[c(4)],log(albuminuria$OR[c(4)]),lty=1,lwd=3,col=1)
segments(albuminuria$x[c(4)],log(albuminuria$OR[c(4)]),albuminuria$x[c(5)],log(albuminuria$OR[c(5)]),lty=1,lwd=3,col=1)

# Chen Y 2011, part 2, prospective 
points(albuminuria$x[c(6)],log(albuminuria$OR[c(6)]),pch=17,col=2,cex=2)
points(albuminuria$x[c(7,8,9,10)],log(albuminuria$OR[c(7,8,9,10)]),pch=17,col=2,cex=2)
segments(albuminuria$x[c(6)],log(albuminuria$OR[c(6)]),albuminuria$x[c(7)],log(albuminuria$OR[c(7)]),lty=1,lwd=3,col=2)
segments(albuminuria$x[c(7)],log(albuminuria$OR[c(7)]),albuminuria$x[c(8)],log(albuminuria$OR[c(8)]),lty=1,lwd=3,col=2)
segments(albuminuria$x[c(8)],log(albuminuria$OR[c(8)]),albuminuria$x[c(9)],log(albuminuria$OR[c(9)]),lty=1,lwd=3,col=2)
segments(albuminuria$x[c(9)],log(albuminuria$OR[c(9)]),albuminuria$x[c(10)],log(albuminuria$OR[c(10)]),lty=1,lwd=3,col=2)

#Zheng LY 2013
points(albuminuria$x[c(11)],log(albuminuria$OR[c(11)]),pch=16,col=4,cex=2)
points(albuminuria$x[c(12,13,14)],log(albuminuria$OR[c(12,13,14)]),pch=15,col=4,cex=2)
segments(albuminuria$x[c(11)],log(albuminuria$OR[c(11)]),albuminuria$x[c(12)],log(albuminuria$OR[c(12)]),lty=1,lwd=3,col=4)
segments(albuminuria$x[c(12)],log(albuminuria$OR[c(12)]),albuminuria$x[c(13)],log(albuminuria$OR[c(13)]),lty=1,lwd=3,col=4)
segments(albuminuria$x[c(13)],log(albuminuria$OR[c(13)]),albuminuria$x[c(14)],log(albuminuria$OR[c(14)]),lty=1,lwd=3,col=4)

axis(1,at=c(0,0.3, 0.69, 1,1.30),label=c("1","2","5","10","20"),cex=0.9,lty=1,lwd=2,line=0.5)
axis(2,at=c(log(0.8),log(1), log(1.5), log(2)),label=c("0.8","1.0","1.5", "2.0"),cex=0.9,adj=1,lty=1,lwd=2,line=0.5)
abline(h=0,lty=4,lwd=0.25)

title(main="Evaluation of Dose Response for Arsenic and Albuminuria/Proteinuria")     # add a title
legend(locator(1),legend=c("Chen Y et al. 2011 Cross-Sectional","Chen Y et al. 2011 Prospective","Zheng LY et al. 2013"),pch=c(16,17,15),col=c(1,2,4),bty="n")
#legend placed with mouse click in Regular R, not RStudio.