shinyUI(fluidPage(title = 'Cool Things To Do',
    leafletOutput("mymap",width="100%",height=800),
    absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                  draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
                  width = 330, height = "auto",style='opacity: .9',
                  h2("Things to Do"),
                  DT::dataTableOutput('thingstodotable')
    )
    
  ))
  