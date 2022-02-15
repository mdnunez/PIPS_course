library(shiny)
library(matrixStats)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Student grading app"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      fileInput(inputId = "grades", label = "please upload grades as csv", accept = ".csv"),
      
      textInput(inputId = "useless_text", value = "replace me...", label = "U can enter stuff here")
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot"),
      tableOutput(outputId = "final_grades"),
      downloadButton(outputId = "download", label = "Download .csv")
      
    )
  )
) #end ui

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  my_data <- eventReactive( input$grades, {
    df <- read.csv2(input$grades$datapath)
    df})
  

  output$distPlot <- renderPlot({
    df <- my_data()
    print(data.matrix(df))
    final_grades <- rowWeightedMeans(x = data.matrix(df), w = c(rep(0.15, 4), 0.4))
    print(final_grades)
    
    hist(final_grades,  col = "#75AADB", border = "white",
         xlab = "Final grades",
         main = "Grade distribution")
  })
  
  output$final_grades <-renderTable({
    df <- my_data()
    df$final_grades <- rowWeightedMeans(x = data.matrix(df), w = c(rep(0.15, 4), 0.4))
    df
    })
  
  output$download <- downloadHandler(
    filename = function() {
      paste0("my_final_grades", ".csv")
    },
    content = function(file) {
      df <- my_data()
      df$final_grades <- rowWeightedMeans(x = data.matrix(df), w = c(rep(0.15, 4), 0.4))
      
      write.csv(df, file)
    }
  )
  
}#end server

# Create Shiny app ----
shinyApp(ui = ui, server = server)