######## MPG_VS_AM app



shinyServer(function(input, output, session) {
  
  library(ggplot2)
  mtcars$am<- as.factor(mtcars$am)
  mtcars$cyl<- as.factor(mtcars$cyl)
  mtcars$gear   <- as.factor(mtcars$gear)
  
  levels(mtcars$am) <- c("automatic", "manual")
  
  output$plot <- renderPlot({
    
     p1<-ggplot(mtcars, aes_string(y=input$y, x="mpg", color="am")) +
      geom_point(aes(shape = cyl), size = 4)
    
    if (input$ten) p1<-p1+ geom_smooth(method=lm, size =1, se=F,    # Don't add shaded confidence region
                                       fullrange=T)      
    
    p1
    
  })
  
  
})
