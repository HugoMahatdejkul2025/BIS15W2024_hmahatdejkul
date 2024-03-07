ui <- 
  
  dashboardPage(
    dashboardHeader(title = "UC admission"),
    dashboardSidebar(disable =  T),
    dashboardBody(
      fluidRow(
        box(title = "Plots", width = 2,
            
            
            selectInput("x", "choose Campus", choices = c("Davis", "Berkeley", "Santa_Barbara", "Irvine", "Merced", "Los_Angeles", "Santa_Cruz", "San_Diego", "Riverside"),
                        selected = "Davis")
            ,
            selectInput("y", "Choose Year", choices = c("2010", "2011", "2013", "2014","2015", "2016", "2017", "2018", "2019"),
                        selected = "2010"),
            
            checkboxGroupInput("z", "Type", choices = c("Admits", "Applicants", "Enrollees"),
                               selected = "Admits"),
        ),
        box(title = "UC Admission by Ethnicity", width = 9,
            plotOutput("plot", width = "600px", height = "800px"))
        
      )
      
      
    )
  )

server <- function(input, output,session) {
  
  session$onSessionEnded(stopApp)
  
  output$plot <- renderPlot({
    
    cleanuc %>%
      filter(campus == input$x) %>%
      filter(academic_yr == input$y) %>%
      filter(category == input$z) %>%
      ggplot(aes_string(x = "ethnicity", y = "filtered_count_fr",fill="ethnicity")) + 
      geom_col() + 
      labs(x = "Ethnicity", y= "Admission Count") +
      coord_flip() 
    
  })
  
}

shinyApp(ui, server)