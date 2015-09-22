library(shiny)
library(shinydashboard)

graph_plot <- plotOutput("graph_plot")

nodes <- textInput("nodes", "Number of nodes", value = 30)
pa.exp <- textInput("pa.exp", "Attachment exponent", value = 2)
aging.exp <- textInput("aging.exp", "Aging exponent", value = 2)
m <- textInput("m", "Edges added each time", value = 1)
directed <- checkboxInput("directed", "Directed?", value = FALSE)

fluidPage(
  title = "Aging Graphs",
  inputPanel(nodes, pa.exp, aging.exp, m, directed),
  mainPanel(graph_plot)
)
