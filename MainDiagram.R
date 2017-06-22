library(DiagrammeR)

nodes <- create_node_df(
  n=5,
  type=c("a","b","b","b","a"),
  label=c("Collect","Visualize","Transform","Model","Communicate"),
  shape=c("Rectangle",rep("Circle",3), "Rectangle")
)


edges <- create_edge_df(
  from=c(1,2,3,4,2),
  to = c(2,3,4,2,5)
)

graph <- create_graph(nodes_df = nodes, 
                      edges_df = edges)


render_graph(graph)
