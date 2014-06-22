shinyUI(pageWithSidebar(
        headerPanel("Plotting App"),
        sidebarPanel
        (
                p("Select your data sets"),
                p("Select your ", code("y-axis"), " and ", code("x-axis"), " variables"),
                p("Select your plotting type"),
                br(),
                selectInput("dataset","Data Set:", 
                        list(iris="iris", mtcars="mtcars")
                ),
                uiOutput("yaxis"), 
                uiOutput("xaxis"),  	
                selectInput("plot.type","Plot Type:", 
                        list(boxplot = "boxplot", histogram = "histogram", density = "density", bar = "bar")
                )
        ),					
        mainPanel(
                h3(textOutput("caption")), 
                uiOutput("plot")
        )
))