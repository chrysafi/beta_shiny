library(shiny)

shinyUI(fluidPage(
  
  #  Application title
  titlePanel("Prior for stock depletion"),
  
  # Sidebar with sliders that demonstrate various available
  # options
  
  
  sidebarLayout(
    
    
    sidebarPanel
    (
      
            
      
             selectInput("select", label = h4("Select species"), 
                         choices = list("Species 1" = 1, "Species 2" = 2,
                                        "Species 3" = 3,"Species 4"=4, "Species 5" = 5,
                                        "Species 6" = 6,"Species 7" = 7,"Species 8" = 8, "Species 9" = 9,
                                        "Species 10" = 10,"Species 11" = 11, "Species 12" = 12,
                                        "Species 13" = 13, "Species 14" = 14, "Species 15" = 15,
                                        "Species 16" = 16,"Species 17" = 17, "Species 18" = 18, "Species 19" = 19,
                                        "Species 20" = 20),selected = 1),
     selectInput("dataset",label=h4("select data set"),
                            choices=list("Data set a"=1,"Data set b"=2,"Data set c"=3,"data set d"=4),
                            selected=1),
    h4("Scroll the bars to adjust depletion"),
     column(6,sliderInput("m", "Mean ", 
                          min=0, max=1, value=0.4)),    
     
     
     column(6,sliderInput("sd", "Sigma ", 
                          min = 0, max = 0.5, value = 0.2)),
     
      
      actionButton("update", "Update Table"),
     
     column(12,h3("Table for depletion")),
     
     column(10,tableOutput("mytable"))
      
      
      
    ),
    
    # Plot beta distribution and equation
    mainPanel(
      h4("Background info for the species:"),
      h5(textOutput("info")),
      uiOutput("plot"),
      
      plotOutput("Betaplot"),
      
      tags$head( tags$style( HTML('#mytable table {border-collapse:collapse; } 
                             #mytable table th { transform: rotate(-45deg)}'))),
      
      
      downloadLink('downloadData', 'Download')  
      
      
    )
    
    
    
  )))
