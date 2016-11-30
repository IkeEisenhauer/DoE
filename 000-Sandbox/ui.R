##############################
### DoE Game 1 based on Diamond - ui.R ########
##############################

library(shiny) 
library(shinydashboard)

dashboardPage(
  skin="green",
  dashboardHeader(
    title="DoE Simulation 001 - Eisenhauer",
    titleWidth = 350
  ),
  dashboardSidebar(
    width = 350,
    sidebarMenu(
      menuItem("Overview", tabName = "Overview", icon = icon("dashboard")),
      menuItem("Process Controls", tabName = "ProcessControls", icon = icon("dashboard")),
      menuItem("Machine Controls", tabName = "MachineControls", icon = icon("dashboard")),
      menuItem("Material Properties", tabName = "MaterialProperties", icon = icon("dashboard")),
      menuItem("Experimental Results", tabName = "ExperimentalResults", icon = icon("dashboard"))
      ),
    actionButton("addButton", "Run Experiment"),<br>,
    downloadButton("btnDownload", "Download Experimental Data")
  ),
  dashboardBody( 
    tabItems(
      tabItem(
        tabName = "Overview",
        h3("Explaination goes here")
      ),
      tabItem(
        tabName = "ProcessControls",
        box(
          title = "Process Controls",
          status = "primary",
          solidHeader = TRUE,
          sliderInput(width=100, inputId="A", label="A", min=0, max=3.5,value = 1, step=0.1),
          sliderInput(inputId="C", label="C", min=0, max=2,value = 1, step=0.1),
          sliderInput(inputId="D", label="D", min=0, max=5,value = 1, step=0.1),
          sliderInput(inputId="E", label="E", min=0, max=2.5,value = 1, step=0.1),
          sliderInput(inputId="I", label="I", min=0.4, max=2,value = 1, step=0.1),
          sliderInput(inputId="L", label="L", min=0, max=2,value = 1, step=0.1)
        )
      ),
      tabItem(tabName = "MachineControls",
        box(
          title = "Machine Controls",
          status = "primary",
          solidHeader = TRUE,
          sliderInput(inputId="B", label="B", min=0, max=3,value = 1, step=0.1),
          sliderInput(inputId="E", label="E", min=0, max=2.5,value = 1, step=0.1),
          sliderInput(inputId="F", label="F", min=0, max=2,value = 1, step=0.1),
          sliderInput(inputId="K", label="K", min=0, max=1.2,value = 1, step=0.1),
          sliderInput(inputId="N", label="N", min=0, max=1.5,value = 1, step=0.1),
          sliderInput(inputId="Q", label="Q", min=0, max=10,value = 1, step=0.1)
        )
      ),
      tabItem(tabName = "MaterialProperties",
        box(
          title = "Material Properties",
          status = "primary",
          solidHeader = TRUE,
          sliderInput(inputId="G", label="G", min=0, max=2.5,value = 1, step=0.1),
          sliderInput(inputId="H", label="H", min=0, max=2,value = 1, step=0.1),
          sliderInput(inputId="J", label="J", min=0, max=3,value = 1, step=0.1),
          sliderInput(inputId="M", label="M", min=0, max=2,value = 1, step=0.1),
          sliderInput(inputId="O", label="O", min=0.4, max=3.5,value = 1, step=0.1),
          sliderInput(inputId="P", label="P", min=0, max=2.0,value = 1, step=0.1)
        )
      ),
      tabItem(tabName = "ExperimentalResults",
        h3("Experimental Results"),
        tableOutput("table")
      )
    )
  )
)
