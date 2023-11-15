# Load necessary libraries
library(shiny)
library(DT)
library(magrittr)

# Define UI for the application
ui <- fluidPage(
  # Application title
  titlePanel("Old Faithful Geyser Data"),

  # Adding theme support
  theme = bs_theme(),

  # Using tabsetPanel to add multiple tabs
  tabsetPanel(
    # First tab: Original histogram functionality
    tabPanel(
      "Histogram",
      sidebarLayout(
        sidebarPanel(
          sliderInput("cells", "Number of cells:", min = 1, max = 50, value = 30),
          textInput("label_x", "Label for the x-axis:"),
          textInput("title", "Title for the graph:"),
          actionButton("make_graph", "Make the plot!", icon = icon("drafting-compass"))
        ),
        mainPanel(
          plotOutput("distPlot")
        )
      )
    ),
    # Second tab: Data table for summary statistics
    tabPanel(
      "Data Summary",
      DTOutput("dataTable")
    )
  )
)

# Define server logic for the application
server <- function(input, output, session) {
  # Adding theme control
  bs_themer()

  # Reactive expression for creating the histogram
  reactive_hist <- eventReactive(input$make_graph, {
    hist(faithful[, 2],
      breaks = seq(min(faithful[, 2]), max(faithful[, 2]), length.out = input$cells + 1),
      col = "darkgray", border = "white", xlab = input$label_x, main = input$title
    )
  })

  # Render the histogram plot
  output$distPlot <- renderPlot({
    reactive_hist()
  })

  # Reactive expression for creating the data summary
  reactive_summary <- reactive({
    data.frame(
      Summary = c("Min", "1st Qu.", "Median", "Mean", "3rd Qu.", "Max"),
      Value = as.numeric(summary(faithful[, 2]))
    )
  })

  # Render the data table
  output$dataTable <- renderDT(
    {
      reactive_summary()
    },
    options = list(pageLength = 6)
  )
}

# Create Shiny app
shinyApp(ui = ui, server = server)
