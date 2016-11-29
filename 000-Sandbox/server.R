##########################################
##### data types and values - server.R ###
##########################################

library(shiny)

shinyServer(function(input, output) { 

  # Reset Data
    exp_data = data.frame()
  
  # The important part of reactiveValues()
    values <- reactiveValues()
    values$df <- exp_data
    observe({

        # your action button condition
        if(input$addButton > 0) {
          # create the new line to be added from your inputs
          newLine <- isolate(c(input$sepal.length, input$sepal.width, input$petal.length, input$petal.width, input$species))
          # update your data
          # note the unlist of newLine, this prevents a bothersome warning message that the rbind will return regarding rownames because of using isolate.
          isolate(values$df <- rbind(as.matrix(values$df), unlist(newLine)))
        }
       # your action button condition
        if(input$btnDownload > 0) {
          # Download Data to User
          output$downloadData <- downloadHandler(
            filename = function(){
              "Experiment_Data.csv"
            }
            content = function(file){
              write.csv(exp_data,file)
            }
            )
        }
      })
      output$table <- renderTable({values$df}, include.rownames=F)
        
  })
