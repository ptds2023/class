library(shiny)
library(magrittr)

# Define UI for application that draws a histogram
ui <- fluidPage(
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  # Sidebar with a slider input for number of cells
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "cells",
        label = "Number of cells:",
        min = 1,
        max = 50,
        value = 30
      ),
      textInput(
        inputId = "label_x",
        label = "Label for the x-axis:"
      ),
      textInput(
        inputId = "title",
        label = "Title for the graph:"
      ),
      actionButton(
        inputId = "make_graph",
        label = "Make the plot!",
        icon = icon("drafting-compass")
      )
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput(outputId = "distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  x <- reactive(faithful[, 2])
  breaks <- reactive(seq(min(x()), max(x()), length.out = input$cells + 1)) %>% bindEvent(input$make_graph)
  xlab <- reactive(input$label_x) %>% bindEvent(input$make_graph)
  title <- reactive(input$title) %>% bindEvent(input$make_graph)

  observeEvent(input$make_graph, message("Make a new graph"))

  output$distPlot <- renderPlot({
    # draw the histogram with the specified number of cells
    hist(x(), breaks = breaks(), col = "darkgray", border = "white", xlab = xlab(), main = title())
  })
}

my_app <- shinyApp(ui = ui, server = server)
# runApp(my_app)