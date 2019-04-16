#' Determine lower shadow length using a OHLC price series
#'
#' @param x OHLC prices.
#' @return length of lower shadow
#' @examples
#' getSymbols('AAPL',adjust=TRUE)
#' doji(AAPL)

LowerShadowLength <- function(x) {
  LS <- pmin(Op(x), Cl(x)) - Lo(x)
  result <- reclass(LS, x)
  colnames(result) <- "LowerShadowLength"
  return(result)
}
