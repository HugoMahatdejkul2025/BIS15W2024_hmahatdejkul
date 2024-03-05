library("shiny")
library("tidyverse")


ui <- fluidPage(
  selectInput("x", "Select X Variable", choices = c("thermoregulation","trophic.guild"), 
              selected = "thermoregulation"),
  
  plotOutput("plot")
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    ggplot(data=homerange,aes_string(x="locomotion",fill="trophic.guild"))+
      geom_bar(position="dodge",alpha=.4,color="black")+
      theme_light(base_size=18)
    #Can do Labs() too
    
    
    
  })
}

shinyApp(ui, server)
