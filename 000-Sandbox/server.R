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
      })

      output$btnDownload <- downloadHandler(
        filename = function() {paste("Experimental_Data", ".csv", sep='')},
        content = function(file) {
          write.csv(values$df,file)
        }
      )  
                            
      output$table <- renderTable({values$df}, include.rownames=F)
        
  })
