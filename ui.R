library(shiny)

shinyUI(fluidPage(
  
  #  Application title
  titlePanel("Beta distribution for depletion prior"),
  
  # Sidebar with sliders that demonstrate various available
  # options
  
  
  sidebarLayout(
    
    
    sidebarPanel
    (
      
        column(6,sliderInput("m", "Mean dataset a", 
                  min=0, max=1, value=0.4)),    
      
      
      column(6,sliderInput("sd", "Sigma dataset a", 
                 min = 0, max = 0.5, value = 0.2)),
      column(6,sliderInput("m2", "Mean dataset b", 
                  min=0, max=1, value=0.4)),    
      
      
      column(6,sliderInput("sd2", "Sigma dataset b", 
                  min = 0, max = 0.5, value = 0.2)),
      column(6,sliderInput("m3", "Mean dataset c", 
                  min=0, max=1, value=0.4)),    
      
      
      column(6,sliderInput("sd3", "Sigma dataset c", 
                  min = 0, max = 0.5, value = 0.2)),
      column(6,sliderInput("m4", "Mean dataset d", 
                           min=0, max=1, value=0.4)),    
      
      
      column(6,sliderInput("sd4", "Sigma dataset d", 
                           min = 0, max = 0.5, value = 0.2)),
    
      column(10,
             selectInput("select", label = h3("Select species"), 
                         choices = list("Species 1" = 1, "Species 2" = 2,
                                        "Species 3" = 3,"Species 4"=4, "Species 5" = 5,
                         "Species 6" = 6,"Species 7" = 7,"Species 8" = 8, "Species 9" = 9,
                         "Species 10" = 10,"Species 11" = 11, "Species 12" = 12,
                         "Species 13" = 13, "Species 14" = 14, "Species 15" = 15,
                         "Species 16" = 16,"Species 17" = 17, "Species 18" = 18, "Species 19" = 19,
                         "Species 20" = 20),selected = 1)),
      column(10,actionButton("update", "Update Table"))
     
      
      
    ),
    
    # Plot beta distribution and equation
    mainPanel(
      
      column(6,plotOutput("Betaplot")),
      column(6,plotOutput("Betaplot2")),
      column(6,plotOutput("Betaplot3")),
      column(6,plotOutput("Betaplot4")),
      tags$head( tags$style( HTML('#mytable table {border-collapse:collapse; } 
                             #mytable table th { transform: rotate(-45deg)}'))),
      tableOutput("mytable"),
      
      downloadLink('downloadData', 'Download')  
    
      
      )
    
    
  
)))
