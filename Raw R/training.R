#data input

#split data to 2 80 20 train and test
splt<- sample(2, nrow(glucose_a), replace = TRUE, prob = c(0.8,0.2))
traindata <- glucose_a[splt==1, ]
freedata <- glucose_a[splt==2, ]

#data convert
traindata$value<-as.character(traindata$value)
traindata$value<-as.numeric(traindata$value)

freedata$value<-as.character(freedata$value)
freedata$value<-as.numeric(freedata$value)

#results
meant <- mean(traindata$value)
print(meant)
print(traindata)

print(freedata)
#perbandingan
probability <- freedata$value > (meant+5) | freedata$value < (meant-5)
print(probability)
totfal <- length(probability[probability==FALSE])
tottrue <- length(probability[probability==TRUE])
print(totfal)
print(tottrue)
#percentage
tots <- totfal+tottrue
perc <- totfal/tots * 100
print(perc)


#lowest highest point of glucose
min(freedata$value)
max(freedata$value)
print(freedata)

# Pie Chart
slices <- c(totfal, tottrue)
lbls <- c("Healthy","Diabetic")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Diabetic Levels") 

#graph
# Define the cars vector with 5 values
glucose <- c(traindata$value)
levels2 <- c(freedata$value)
# Graph cars using blue points overlayed by a line 
plot(glucose, type="o", col="blue", ylim=c(100,110))
# Graph trucks with red dashed line and square points
#lines(levels2, type="o", pch=22, lty=2, col="red")
# Create a title with a red, bold/italic font
title(main="Glucose Level", col.main="red", font.main=4)

#graph
# Define the cars vector with 5 values
levels2 <- c(freedata$value)
# Graph cars using blue points overlayed by a line 
plot(levels2, type="o", col="blue", ylim=c(100,110))
# Graph trucks with red dashed line and square points
#lines(levels2, type="o", pch=22, lty=2, col="red")
# Create a title with a red, bold/italic font
title(main="Glucose Level", col.main="red", font.main=4)

