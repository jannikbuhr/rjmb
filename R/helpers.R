# ggplot helpers ----------------------------------------------------------
#' Convert String to Math Expression
#'
#' First, all whitespace is replace by the specified
#' string (star by default)
#' and then the string is converted to an expression.
#' For the full range of possible math expressions
#' that will be converted see \link[grDevices]{plotmath}
#'
#' @param char
#  a string for whitespace replacement
#'
#' @return
#' Returns a function that turns a string into
#' an \link[base]{expression}. This can then
#' be used as a labeler function in ggplot2.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' df <- tibble(
#'   x = c("delta+1", "Delta AB", "alpha"),
#'   y = rep(1, length(x))
#' )
#'
#' ggplot(df, aes(x, y)) +
#'   geom_point() +
#'   scale_x_discrete(labels = str_to_math())
#' }
str_to_math <- function(char = "*") {
  stopifnot(is.character(char))
  function(x) {
    x <- stringr::str_replace_all(x, "\\s", char)
    parse(text = x)
  }
}

#' @export "+"
`+` <- function (e1, e2) UseMethod("+")

#' @export
`+.default` <- function (e1, e2) .Primitive("+")(e1, e2)

#' @export
`+.character` <- function(e1, e2)
  if(length(e1) == length(e2)) {
    paste0(e1, e2)
  } else stop('String Vectors of Different Lengths')
