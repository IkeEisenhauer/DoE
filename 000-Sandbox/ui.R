##############################
### data Types - ui.R ########
##############################

library(shiny) 

shinyUI(pageWithSidebar( 
  
  headerPanel("Widget values and data types"), 
  
  sidebarPanel(
    
     textInput("species", label="Add a new species", value="Enter species"),
        numericInput("sepal.length", label="Add a new sepal length", value=""),
        numericInput("sepal.width", label="Add a new speal width", value=""),
        numericInput("petal.length", label="Add a new petal length", value=""),
        numericInput("petal.width", label="Add a new petal width", value=""),
        actionButton("addButton", "UPLOAD!"),
        actionButton("btnDownload", "DOWNLOAD Experimental Data")
  ),
  
  mainPanel( 
    h3("Output and data type"),
    tableOutput("table")
  )
))
