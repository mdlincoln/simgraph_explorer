library(shiny)
library(shinydashboard)

graph_plot <- plotOutput("graph_plot")

nodes <- textInput("nodes", "Number of nodes", value = 100)
pa.exp <- textInput("pa.exp", "Attachment exponent", value = 0.5)
aging.exp <- textInput("aging.exp", "Aging exponent", value = -3)
m <- textInput("m", "Edges added each time", value = 2)
directed <- checkboxInput("directed", "Directed?", value = FALSE)

fluidPage(
  title = "Aging Graphs",
  inputPanel(nodes, pa.exp, aging.exp, m, directed),
  mainPanel(graph_plot, width = 12)
)
