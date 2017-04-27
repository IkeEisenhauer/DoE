##############################
### DoE Game 3 based on Diamond - ui.R ########
##############################

library(shiny) 
library(shinydashboard)

dashboardPage(
  skin="green",
  dashboardHeader(
    title="DoE Simulation 003 - Eisenhauer",
    titleWidth = 350
  ),
  dashboardSidebar(
    width = 350,
    sidebarMenu(
      menuItem("Overview", tabName = "Overview", icon = icon("info-circle")),
      menuItem("Control", tabName = "Inputs", icon = icon("industry")),
      menuItem("Experimental Results", tabName = "ExperimentalResults", icon = icon("table"))
      ),
    HTML("<hr>"),
    actionButton("addButton", "Run Experiment", icon=icon("play"))
  ),
  dashboardBody( 
    tabItems(
      tabItem(
        tabName = "Overview",
        h3("Simulation for Hands On Exercises STAT466")
      ),
      tabItem(
        tabName = "Inputs",
        div(style="height: 1200px;",box(
          width = 750,
          title = "Controls",
          status = "primary",
          solidHeader = TRUE,
          div(style="height: 150px;",numericInput(inputId="C", label="C", value=0, min=0,max=3)),
          div(style="height: 150px;",numericInput(inputId="F", label="F",value=0,min=0,max=3)),
          div(style="height: 150px;",numericInput(inputId="G", label="G",value=0,min=0,max=3)),
          div(style="height: 150px;",numericInput(inputId="K", label="K",value=0,min=0,max=2))
        ))
      ),
      tabItem(tabName = "ExperimentalResults",
        h3("Experimental Results"),
        downloadButton("btnDownload", "Download Experimental Data"),
        tableOutput("table")
      )
    )
  )
)