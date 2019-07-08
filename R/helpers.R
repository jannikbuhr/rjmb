# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

#' Convert String to Math Expression
#'
#' First, all whitespace is replace by the tilde symbol
#' and then the string is converted to an expression.
#' For the full range of possible math expressions
#' that will be converted see \link[grDevices]{plotmath}
#'
#' @param x
#' A string
#'
#' @return
#' @export
#'
#' @examples
convert_to_math <- function(x) {
  x <- stringr::str_replace_all(x, "\\s", "~")
  parse(text = x)
}

