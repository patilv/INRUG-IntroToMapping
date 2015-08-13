shinyServer(function(input, output) {
  
  output$thingstodotable <- DT::renderDataTable(thingstodo[,c(1,4)], server=FALSE)
  output$mymap <- renderLeaflet({
    filteredrows=input$thingstodotable_rows_all
    selectedrows=input$thingstodotable_rows_selected
    if(is.null(filteredrows)) return(invisible())    
    myDataplot=thingstodo[filteredrows, ]
    if(length(selectedrows)>0) {myDataplot=thingstodo[selectedrows,]}
    
    if(is.null(myDataplot)) return()
    
    mymap = leaflet(data=myDataplot) %>% #,width = "100%", height = "100%") %>%   
      addTiles() %>% 
      setView(-117.4, 47.668, zoom = 13) %>%
      addMarkers(popup=~Attraction)
  })
  
})