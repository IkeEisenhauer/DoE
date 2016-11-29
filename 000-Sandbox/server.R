##########################################
##### data types and values - server.R ###
##########################################

library(shiny)

shinyServer(function(input, output) { 

  # Reset Data
    exp_data = read.table(text="",
                         colClasses = c("double","double","double","double","character"),
                         col.names = c("sepal.length","sepal.width","petal.length","petal.width","species")
                         )
  
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
            write.csv(exp_data,"Experiment_Data.csv")
        }
      })
      output$table <- renderTable({values$df}, include.rownames=F)
        
  })
