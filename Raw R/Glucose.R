library(jsonlite)

tableCols <- c("value")
temp <- data.frame(matrix(ncol = length(tableCols), nrow = 0))
colnames(temp) <- tableCols

for (i in 1:60){
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
  Sys.sleep(2)
}
write.csv(temp, file = myfile)