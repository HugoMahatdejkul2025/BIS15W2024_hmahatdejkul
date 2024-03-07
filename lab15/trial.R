library(shiny)
library(ggplot2)
library(reshape2)

# Sample data
data <- data.frame(
  plant_type = c("tree", "fruit", "vegetable", "flower"),
  height = c(10, 5, 7, 8),
  weight = c(20, 15, 18, 12)
)

# Define UI
ui <- fluidPage(
  titlePanel("Plant Data Visualization"),
  
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("variables",
                         label = h3("Variables to Display"),
                         choices = list("Height" = "height",
                                        "Weight" = "weight"),
                         selected = c("height", "weight")
      )
    ),
    
    mainPanel(
      plotOutput("plot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  output$plot <- renderPlot({
    # Filter data based on selected variables
    plot_data <- data[, c("plant_type", input$variables)]
    
    # Melt data for plotting
    plot_data <- melt(plot_data, id.vars = "plant_type")
    
    # Plot
    ggplot(plot_data, aes(x = plant_type, y = value, color = variable)) +
      geom_point() +
      labs(x = "Plant Type", y = "Value", color = "Variable") +
      theme_minimal()
  })
}

# Run the application
shinyApp(ui = ui, server = server)

