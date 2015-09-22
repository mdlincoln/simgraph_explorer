library(shiny)
library(igraph)
library(ggplot2)

shinyServer(function(input, output) {

  nodes <- reactive(as.numeric(input$nodes))
  pa.exp <- reactive(as.numeric(input$pa.exp))
  aging.exp <- reactive(as.numeric(input$aging.exp))
  m <- reactive(as.numeric(input$m))
  directed <- reactive(input$directed)

  pref_graph <- reactive({
    g <- sample_pa_age(
      n = nodes(),
      pa.exp = pa.exp(),
      aging.exp = aging.exp(),
      m = m(),
      directed = directed())

    V(g)$weight <- 1
    g <- simplify(g, edge.attr.comb = (list(weight = "sum")))
    V(g)$size <- sqrt(degree(g, normalized = TRUE)) * 20
    return(g)
  })

  output$graph_plot <- renderPlot({
    plot(
      pref_graph(),
      vertex.label = ""
    )
  }, height = 800)
})
