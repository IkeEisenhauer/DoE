##########################################
##### data types and values - server.R ###
##########################################

library(shiny)
data(iris)

shinyServer(function(input, output) { 
  
  output$textDisplay <- renderTable({ 
                                     
    getMat = matrix(c(paste(input$checkGroup, collapse=','), class(input$checkGroup),
                      input$boxInput, class(input$boxInput),
                      as.character(as.Date(input$theDate, origin = "1970-01-01")), class(input$theDate),
                      paste(as.character(as.Date(input$dateRange[1], origin = "1970-01-01")),
                            as.character(as.Date(input$dateRange[2], origin = "1970-01-01")), collapse = ','),
                            class(input$dateRange),
                      input$pickNumber, class(input$pickNumber),
                      input$pickRadio, class(input$pickRadio),
                      input$comboBox, class(input$comboBox),
                      input$slider, class(input$slider),
                      input$comment, class(input$comment)
                      ), ncol=2, byrow = TRUE)

    colnames(getMat) = c("Value", "Class")
    
    getMat

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
})
