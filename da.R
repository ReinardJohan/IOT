library(shiny)
library(plotly)
library(shinyjs)
library(jsonlite)

#data input
input <- read.csv(file="d:\\Raw R\\glucose_a.csv", header=TRUE, sep=",")

traindata <- input


tableCols <- c("value")
temp <- data.frame(matrix(ncol = length(tableCols), nrow = 0))
colnames(temp) <- tableCols

jsSepdek = fromJSON("http://ihealth.sepdek.net/")

iHealth <- as.data.frame(jsSepdek)

#UI FILE------------------



ui <- fluidPage(
  titlePanel("Frontier Technology project"),
  
  
    
    mainPanel(id = "mainpanel", fluidRow(h3("Plot results"), align = "center",
                                         div(plotlyOutput("plot"), id='graph')
    )),
    
    useShinyjs()
    
    
  )

#//------------//



#SERVER FILE------------------

server <- function(input, output, session) {
  
  
  #data convert
  traindata$value<-as.numeric(traindata$value)
  
  #results
  meant <- mean(traindata$value)
  
  vline <- function(x = 0, color = "red") {
    list(
      type = "line", 
      y0 = 0, 
      y1 = 1, 
      yref = "paper",
      x0 = x, 
      x1 = x, 
      line = list(color = color)
    )
  }
  
  hline <- function(y = 0, color = "blue") {
    list(
      type = "line", 
      x0 = 0, 
      x1 = 1, 
      xref = "paper",
      y0 = y, 
      y1 = y, 
      line = list(color = color)
    )
  }
  
  values <- reactiveValues()
  
  values <- plot_ly(
    type = 'scatter',
    
    mode = 'lines'
    
  ) %>%
    
    #-----------
  
  
  
  #Row 1:
  
  add_trace(
    
    name = iHealth$healthData.sensor[1],
    
    y = iHealth$healthData.value[1],
    
    line = list(
      
      color = '#3a7d44',
      
      width = 3
      
    )
    
  ) %>%
    
    #-----------
  
  layout(
    
    yaxis = list(title = "Sensors"),
    
    xaxis = list(title = "Seconds Passed"),
    
    shapes = list(vline(0),hline(meant))
  ) 
  
  output$plot <- renderPlotly({values})
    
    
  observe({
    
    invalidateLater(1000, session)
    
    jsSepdek = fromJSON("http://ihealth.sepdek.net/")
    
    iHealth <- as.data.frame(jsSepdek)
    iHealth <- iHealth[13, ]
    
    plotlyProxy("plot", session) %>%
      
      plotlyProxyInvoke("extendTraces", 
              list(y=list(list(iHealth$healthData.value[1])  )),list(1))
    
  })

}

shinyApp(ui, server)