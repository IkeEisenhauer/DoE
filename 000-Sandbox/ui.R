##############################
### DoE Game 1 based on Diamond - ui.R ########
##############################

library(shiny) 

shinyUI(pageWithSidebar( 
  
  headerPanel("DoE Simulation 001 - Eisenhauer"), 
  
  sidebarPanel(
    
     textInput(sliderInput(inputId="A", label="A", min=0, max=3.5,value = 1, step=0.1),
               sliderInput(inputId="B", label="B", min=0, max=3,value = 1, step=0.1),
               sliderInput(inputId="C", label="C", min=0, max=2,value = 1, step=0.1),
               sliderInput(inputId="D", label="D", min=0, max=5,value = 1, step=0.1),
               sliderInput(inputId="E", label="E", min=0, max=2.5,value = 1, step=0.1),
               sliderInput(inputId="F", label="F", min=0, max=2,value = 1, step=0.1),
               sliderInput(inputId="G", label="G", min=0, max=2.5,value = 1, step=0.1),
               sliderInput(inputId="H", label="H", min=0, max=2,value = 1, step=0.1),
               sliderInput(inputId="I", label="I", min=0.4, max=2,value = 1, step=0.1),
               sliderInput(inputId="J", label="J", min=0, max=3,value = 1, step=0.1),
               sliderInput(inputId="K", label="K", min=0, max=1.2,value = 1, step=0.1),
               sliderInput(inputId="L", label="L", min=0, max=2,value = 1, step=0.1),
               sliderInput(inputId="M", label="M", min=0, max=2,value = 1, step=0.1),
               sliderInput(inputId="N", label="N", min=0, max=1.5,value = 1, step=0.1),
               sliderInput(inputId="O", label="O", min=0.4, max=3.5,value = 1, step=0.1),
               sliderInput(inputId="P", label="P", min=0, max=2.0,value = 1, step=0.1),
               sliderInput(inputId="Q", label="Q", min=0, max=10,value = 1, step=0.1),
               sliderInput(inputId="R", label="R", min=0, max=18,value = 1, step=0.1),
        actionButton("addButton", "Run Experiment"),
        downloadButton("btnDownload", "DOWNLOAD Experimental Data")
  ),
  
  mainPanel( 
    h3("Output and data type"),
    tableOutput("table")
  )
))
