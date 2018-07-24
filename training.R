#data input

#split data to 2 80 20 train and test
#splt<- sample(2, nrow(glucose_a), replace = TRUE, prob = c(0.8,0.2))
#traindata <- glucose_a[splt==1, ]
#freedata <- glucose_a[splt==2, ]

library(jsonlite)

input <- read.csv(file="d:\\Raw R\\glucose_a.csv", header=TRUE, sep=",")

traindata <- input

tableCols <- c("value")
temp <- data.frame(matrix(ncol = length(tableCols), nrow = 0))
colnames(temp) <- tableCols


for (i in 1:360){


    #source
    jsonData = fromJSON("http://ihealth.sepdek.net/")
    class(jsonData)
    names(jsonData)
    data <- jsonData$healthData
    
    #filter
    filename <- format(Sys.time(),"%b_%d_%H_%M_%S_%Y")
    myfile <- paste(filename,"_dataGlucose",".csv")
    
    #write to dir
    temp[i,] <- data[13, ]$value
    Sys.sleep(1)
  
    freedata <- temp
  
#data convert
traindata$value<-as.character(traindata$value)
traindata$value<-as.numeric(traindata$value)

freedata$value<-as.character(freedata$value)
freedata$value<-as.numeric(freedata$value)

#results
meant <- mean(traindata$value)
freemean <- mean(freedata$value)
#print(meant)
print(freemean)
#print(traindata)

#print(freedata)
#perbandingan
probability <- freedata$value > (meant+5) | freedata$value < (meant-5)
#print(probability)
totfal <- length(probability[probability==FALSE])
tottrue <- length(probability[probability==TRUE])
#print(totfal)
#print(tottrue)
#percentage
tots <- totfal+tottrue
perc <- totfal/tots * 100
#print(perc)


#lowest highest point of glucose
#min(freedata$value)
#max(freedata$value)
#print(freedata)

# Pie Chart
# slices <- c(totfal, tottrue)
# lbls <- c("Healthy","Diabetic")
# pct <- round(slices/sum(slices)*100)
# lbls <- paste(lbls, pct) # add percents to labels
# lbls <- paste(lbls,"%",sep="") # ad % to labels
# pie(slices,labels = lbls, col=rainbow(length(lbls)), main="Diabetic Levels")

#Live Feed GLucose
Live_glucose <- c(freedata$value)
plot(Live_glucose, type="o", col="blue", ylim=c(90,120))
abline(h=meant)
title(main="Live Feed Glucose", col.main="red", font.main=4)
}
