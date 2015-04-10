# Define server logic required to draw figure
###set workign directory to run the app###

setwd("C:/Users/chrysafi/")

library(shiny)

shinyServer(
  function(input, output, session) {
    
##########beta distribution#############    
    
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
  plot(t,Dist.out, col = rgb(0/255,86/255,149/255),main="Beta for distribution for stock depletion",xlab="Depletion",ylab="probability",xlim=c(0,1),ylim=c(0,5),type="l",lwd=5)
}
    )

##########reactive elements#############

a<-reactive({
  as.numeric(c(paste(input$select,input$dataset,sep=""),input$m,input$sd))
})



b<-reactive({
  as.numeric(paste(input$select,input$dataset,sep=""))
})

d<-reactive({
  as.numeric(input$select)
})

##############reactive table##############
values<- reactiveValues()
values$df<-data.frame(Species_Scenario=numeric(0),mean=numeric(0),std=numeric(0))
newEntry<- observe({
  if(input$update >0){
    newLine<-isolate(a())
    isolate(values$df[nrow(values$df) + 1,] <-a())
  }
})

output$mytable<-renderTable({values$df})


####downloading data#############

output$downloadData <- downloadHandler(
  filename = function() {
    paste('prior_dep', '.csv', sep='')
  },
  content = function(file) {
    write.csv(values$df, file)
  },contentType="csv"
)
####image file#################

output$plot<-renderUI({
  
      img(src=paste("FISH",b(),".png",sep=""), height = 600, width = 600)
})
  
#####information provided##########  
output$info <- renderText({
  
  if ( d()==1 ) {
    info <- "Family:Gadidae VBF K: 0.2 Linf: 50 cm Amax: 30 yrs Lmat: 20 cm Management started: 1995"
  } else {
    
    if ( d()==2)  {
  info <- "Family:Scombridae VBF K: 0.3 Linf: 60 cm Amax: 10 Lmat: 25 cm Management started: 1990"
    } else {
      
      if ( d()==3 ) {
        info <- "family:C VBF K:Linf:Amax:Lmat:Management started:"
      } else {
        
        if ( d()==4 ) {
          info <- "family:D VBF K:Linf:Amax:Lmat:Management started:"
        } else {
          
          if ( d()==5) {
            info <- "family:E VBF K:Linf:Amax:Lmat:Management started:"
          } else { 
            
            if ( d()==6 ) {
              info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
            }
            else {
              
              if ( d()==7)  {
                info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
              } else {
                
                if ( d()==8 ) {
                  info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
                } else {
                  
                  if ( d()==9 ) {
                    info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
                  } else {
                    
                    if ( d()==10) {
                      info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
                    } else { 
                      
                      if ( d()==11 ) {
                        info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
                      }
                      else {
                        
                        if ( d()==12)  {
                          info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
                        } else {
                          
                          if ( d()==13 ) {
                            info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
                          } else {
                            
                            if ( d()==14 ) {
                              info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
                            } else {
                              
                              if ( d()==15) {
                                info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
                              } else { 
                                
                                if ( d()==16 ) {
                                  info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
                                } else {
                                  
                                  if ( d()==17)  {
                                    info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
                                  } else {
                                    
                                    if ( d()==18 ) {
                                      info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
                                    } else {
                                      
                                      if ( d()==19 ) {
                                        info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
                                      } else {
                                        
                                        if ( d()==20) {
                                          info <- "family:VBF K:Linf:Amax:Lmat:Management started:"
                                        } 
          }
        }
      }
    }
  }
                            }}}}}}}}}}}}}}
  
}) 




  }
)
