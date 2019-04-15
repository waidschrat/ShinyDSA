library(RInno)

RInno::install_inno()
create_app(
  app_name = "myapp", 
  app_dir  = "path/to/myapp",
  pkgs     = c("shiny", "jsonlite", "magrittr", "plotly", "ggplot2"),
  include_R = TRUE
  )