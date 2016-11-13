## global.R
## Author: Yuan Wang

## http://stackoverflow.com/questions/9341635/check-for-installed-packages-before-running-install-packages
pkgTest <- function(x)
{
  print(paste("Installing Package", x))
  if (!require(x,character.only = TRUE))
  {
    install.packages(x,dep=TRUE)
    if(!require(x,character.only = TRUE)) stop("Package not found")
  }
}

required_source <- c(
  '../data_gen/data_gen.R'
)

required_packages <- c(
  "shiny",
  "plotly",
  "dygraphs",
  "datasets",
  "DT",
  "shinythemes",
  "xts",
  "TTR",
  "quantmod"
)

## source files
for (filename in required_source) {
  source(filename)
}

## install packages
for (package in required_packages) {
  pkgTest(package)
}
