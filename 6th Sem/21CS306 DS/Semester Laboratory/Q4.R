#4. Develop a Shiny app using the iris dataset with three features: 
#(1) Select a numerical and categorical variable to display summary statistics. 
#(2) Choose two numerical variables for a scatter plot, colored by a categorical variable. 
#(3) Generate a box plot for a selected numerical and categorical variable

library(shiny)

#1. Dataset Loading
data("iris")

#2. UI
ui <- fluidPage (
  titlePanel("Iris Dataset Explorer"),
  
  sidebarLayout (
    sidebarPanel (
      #Summary Statistics
      selectInput("numVar", "Select Numerical Variable:", choices = names(iris)[1:4], selected = "Sepal.Length"),
      selectInput("catVar", "Select catgorical Variable:", choices = c("Species"), selected = "Species"),
      hr(),
      
      #Scatter Plot
      selectInput("xVar", "Select X axis:", choices = names(iris)[1:4], selected = "Sepal.Length"),
      selectInput("yVar", "Select Y axis:", choices = names(iris)[1:4], selected = "Petal.Length"),
      hr(),
      
      #Box Plot
      selectInput("boxNumVar", "Select Numerical Variable:", choices = names(iris)[1:4], selected = "Petal.Width"),
      selectInput("boxCatVar", "Select Numerical Variable:", choices = c("Species"), selected = "Species")
    ),
    
    mainPanel(
      h4("1: Summary Statistics"),
      verbatimTextOutput("summaryOutput"),
      
      h4("2. Scatter Plot"),
      plotOutput("scatterPlot"),
      
      h4("3. Box Plot"),
      plotOutput("boxPlot")
    )
  )
)

#3. Server
server <- function(input, output) {
  
  #Summary Statistics
  output$summaryOutput <- renderPrint({
    summary(iris[[input$numVar]])
  })
  
  #Scatter Plot
  output$scatterPlot <- renderPlot({
    plot(iris[[input$xVar]], iris[[input$yVar]], col = iris$Species, xlab = input$xVar, ylab = input$yVar, main = paste(input$yVar, "vs", input$xVar), pch = 19)
    legend("topright", legend = levels(iris$Species), col = 1:3, pch = 19)
  })
  
  #Box Plot
  output$boxPlot <- renderPlot({
    boxplot(iris[[input$boxNumVar]] ~ iris[[input$boxCatVar]], col = c("lightblue", "lightgreen", "lightpink"), 
            main = paste(input$boxNumVar, "by", input$boxCatVar), xlab = input$boxCatVar, ylab = input$boxNumVar)
  })
}

#4. Execution
shinyApp(ui = ui, server = server)
