##########################################
##### data types and values - server.R ###
##########################################

library(shiny)
data(iris)

shinyServer(function(input, output) { 
  
       # just a small part of iris for display
      iris_sample <- iris[sample(nrow(iris), 10),]
      row.names(iris_sample) <- NULL

      # The important part of reactiveValues()
      values <- reactiveValues()
      values$df <- iris_sample
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
      output$table <- renderTable({values$df}, include.rownames=F)
    
    
  })
