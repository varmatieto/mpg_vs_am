######## MPG_VS_AM app


library(markdown)

shinyUI(navbarPage(" MPG_vs_AM ",
                   
                   
                   tabPanel("About",
                            includeMarkdown("data/about.md")
                                         ),
                   tabPanel("Plot",
                            sidebarPanel(
                              selectInput('x', 'Variable', 
                                          choices = c("Displacement"= "disp",
                                                      "Weight" = "wt",
                                                      "Horsepower" = "hp"),
                                          width ="80%"),
                              hr(),
                              
                              checkboxInput('ten', 'Trend line')
                            ),
                              mainPanel(
                                plotOutput("plot",width = "100%", height = "450px")
                              )
                            )
                   )
                                       )

