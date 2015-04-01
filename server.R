# Define server logic required to draw figure
###set workign directory to run the app###

#setwd("C:/Users/chrysafi/")

library(shiny)

shinyServer(
  function(input, output, session) {
    
      

alphaconv<-function(m,sd)
(
  m*(((m*(1-m))/(sd^2))-1)
  ) 
  
betaconv<-function(m,sd)
(
  (1-m)*(((m*(1-m))/(sd^2))-1) 
)

output$Betaplot <- renderPlot(
{
  t<-seq(0,1,0.001)
  Dist.out<-dbeta(t,alphaconv(input$m,input$sd),betaconv(input$m,input$sd))
  # plot beta
  plot(t,Dist.out, col = rgb(0/255,86/255,149/255),main="Beta for dataset a",xlab="Depletion",ylab="probability",xlim=c(0,1),ylim=c(0,5),type="l",lwd=5)
}
)

output$Betaplot2 <- renderPlot(
{
  t<-seq(0,1,0.001)
  Dist.out<-dbeta(t,alphaconv(input$m2,input$sd2),betaconv(input$m2,input$sd2))
  # plot beta
  plot(t,Dist.out, col = rgb(0/255,86/255,149/255),main="Beta for dataset b",xlab="Depletion",ylab="probability",xlim=c(0,1),ylim=c(0,5),type="l",lwd=5)
}
)
output$Betaplot3 <- renderPlot(
{
  t<-seq(0,1,0.001)
  Dist.out<-dbeta(t,alphaconv(input$m3,input$sd3),betaconv(input$m3,input$sd3))
  # plot beta
  plot(t,Dist.out, col = rgb(0/255,86/255,149/255),main="Beta for dataset c",xlab="Depletion",ylab="probability",xlim=c(0,1),ylim=c(0,5),type="l",lwd=5)
}
)
output$Betaplot4 <- renderPlot(
{
  t<-seq(0,1,0.001)
  Dist.out<-dbeta(t,alphaconv(input$m4,input$sd4),betaconv(input$m4,input$sd4))
  # plot beta
  plot(t,Dist.out, col = rgb(0/255,86/255,149/255),main="Beta for dataset d",xlab="Depletion",ylab="probability",xlim=c(0,1),ylim=c(0,5),type="l",lwd=5)
}
)

a<-reactive({
  as.numeric(c(input$select,input$m,input$sd,input$m2,input$sd2,input$m3,input$sd3,input$m4,input$sd4))
})

values<- reactiveValues()
values$df<-data.frame(Species=numeric(0),mu_a=numeric(0),sd_a=numeric(0),mu_b=numeric(0),sd_b=numeric(0),mu_c=numeric(0),sd_c=numeric(0),mu_d=numeric(0),sd_d=numeric(0))
newEntry<- observe({
  if(input$update >0){
    newLine<-isolate(a())
    isolate(values$df[nrow(values$df) + 1,] <-a())
  }
})

output$mytable<-renderTable({values$df})


####downloading data

output$downloadData <- downloadHandler(
  filename = function() {
    paste('prior_dep', '.csv', sep='')
  },
  content = function(file) {
    write.csv(values$df, file)
  },contentType="csv"
)




  }
)

