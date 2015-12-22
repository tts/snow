shinyServer(function(input, output, session) {
  
  output$leaflet <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addPopups(20.79, 69.05, "Enontekio, Kilpisjarvi") %>%
      addPopups(27.41, 68.42, "Inari, Saariselka tourist centre") %>%
      addPopups(29.18, 67.16, "Salla, Naruska") %>%
      setView(18.5167, 67.9000, zoom = 6) %>%
      addGeoJSON(hiihto1213) %>%
      addGeoJSON(hiihto1214) %>%
      addGeoJSON(hiihto1215) %>%
      addGeoJSON(hiihto1216)
  })
  
  dayPicked <- reactive({
    input$day
  })
  
  output$dygraph <- renderDygraph({
    dygraph(snow) %>%
      dySeries("Snow", label = "Saariselka") %>%
      dySeries("Snow.1", label = "Kilpisjarvi") %>%
      dySeries("Snow.2", label = "Salla") %>%
      dyAxis("x", drawGrid = FALSE) %>%
      dyAxis("y", label = "cm") %>%
      dyOptions(colors = RColorBrewer::brewer.pal(3, "Set2")) %>%
      dyLegend(show = "onmouseover", width = 400, showZeroValues = FALSE, hideOnMouseOut = TRUE) %>%
      dyEvent(date = dayPicked(), label = as.character(dayPicked()), labelLoc = "bottom")
  })
  
})