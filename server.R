library(datasets)
library(ggplot2) 

nlist<-function (vec){
        tmp<-as.list(vec)
        names(tmp)<-as.character(unlist(vec))
        tmp
}

shinyServer(function(input, output, session){
        output$yaxis <- renderUI({ 
                obj<-switch(input$dataset, "iris"=iris, "mtcars"=mtcars)	 
                var.opts<-nlist(colnames(obj))
                selectInput("yaxis","Y-Axis:", var.opts)				 
        }) 
        output$xaxis <- renderUI({ 
                obj<-switch(input$dataset, "iris"=iris, "mtcars"=mtcars)	 
                var.opts<-nlist(colnames(obj))
                selectInput("xaxis","X-Axis:", var.opts)				 
        }) 
        output$caption<-renderText({
                switch(input$plot.type, "boxplot"="Boxplot", "histogram"="Histogram",
                       "density"="Density plot", "bar"="Bar graph")
        })
        output$plot <- renderUI({
                plotOutput("p")
        })
        output$p <- renderPlot({         
                plot.obj<<-list() 
                plot.obj$data<<-get(input$dataset) 
                plot.obj$yaxis<<-with(plot.obj$data, get(input$yaxis)) 
                plot.obj$xaxis<<-with(plot.obj$data, get(input$xaxis)) 
                
                plot.type<-switch(input$plot.type, "boxplot"=geom_boxplot(),
                                  "histogram"=geom_histogram(alpha=0.5, position="identity"),
                                  "density"=geom_density(alpha=.8), "bar"=geom_bar(position="dodge")
                )
                require(ggplot2)
                .theme<- theme(
                        axis.line = element_line(colour='black', size=.8), 
                        panel.background = element_blank(),  
                        plot.background = element_blank()
                )	 
                if(input$plot.type=="boxplot")	{
                        p<-ggplot(plot.obj$data, 
                                  aes(
                                          x=plot.obj$xaxis, 
                                          y=plot.obj$yaxis,
                                          fill=as.factor(plot.obj$xaxis)
                                  )
                        ) + plot.type
                        p<-p+ geom_point(color='black', alpha=0.5, position='jitter') 
                } else {
                        p<-ggplot(plot.obj$data, 
                                  aes(
                                          x=plot.obj$yaxis,
                                          fill=as.factor(plot.obj$xaxis),
                                          xaxis=as.factor(plot.obj$xaxis)
                                  )
                        ) + plot.type
                }
                
                p<-p+labs(
                        fill=input$xaxis,
                        x = input$xaxis,
                        y = input$yaxis
                )  +
                        .theme
                print(p)
        })	
})