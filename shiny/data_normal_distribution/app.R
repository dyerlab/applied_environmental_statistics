library(shiny)
ui <- fluidPage(
   titlePanel("The Normal Distribution"),
   helpText("The parameters below are those most commonly ",
            "used in grabbing a set of random varaibles ",
            "from the normal probability distribution."),
   sidebarLayout(
      sidebarPanel(
         sliderInput("obs",
                     "Number of observations:",
                     min = 2,
                     max = 100,
                     value = 50),
         sliderInput("mu",
                     "Mean:",
                     min = -10,
                     max = 10,
                     value = 0),
         sliderInput("sd",
                     "Standard Deviation:",
                     min = 1,
                     max = 10,
                     value = 2)
      ),
      mainPanel(
         plotOutput("distPlot")
      )
   )
)
server <- function(input, output, session) {
  
   output$distPlot <- renderPlot({
     library(ggplot2)
     df <- data.frame(X=rnorm( n=input$obs,
                               mean=input$mu,
                               sd=input$sd))
     ggplot(df,aes(x=X, ..density..)) + 
       geom_histogram(bins=20) + 
       geom_density( col="red", size=1.25) +
       theme_bw() + 
       xlab("X") + ylab("Frequency")
   })
}
shinyApp(ui = ui, server = server)

