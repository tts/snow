shinyUI(fluidPage(  
  
  theme = shinytheme("cosmo"),
  
  titlePanel("Snow Depth 2012-2014"),
  
  sidebarLayout(
    sidebarPanel(
      br(),
      dateInput("day", 
                label = "Pick a day:", 
                min = "2011-09-01",
                max = "2014-12-31",
                value = "2014-11-01",
                startview = "year"),
      br(),
      p("Draw range to zoom in, double-click to zoom out again."),
      br(),
      br(),
      br(),
      HTML("Data by <a href='http://en.ilmatieteenlaitos.fi/open-data-licence'>
                 Finnish Meteorological Institute</a>."),
      br(),
      HTML("<a href='http://www.github.com/rOpenGov/fmi'>rmi R package</a>
                Jussi Jousimo et al. (C) 2014."),
      br(),
      br(),
      br(),
      HTML("More on this graph, see <a href='http://tuijasonkkila.fi/blog/2015/01/snow-in-lapland/'>blog posting</a>.")
    ),
    
    
    mainPanel(
      
      tabsetPanel(
        tabPanel("Graph", dygraphOutput("dygraph")
        ),
        tabPanel("Map", leafletOutput("leaflet"))
      )
    )
  )
))