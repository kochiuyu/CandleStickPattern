#' Determine Doji Pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if Doji pattern detected
#' @examples
#' getSymbols('AAPL',adjust=TRUE)
#' doji(AAPL)

doji <- function(x) {
  result <- reclass(Op(x) == Cl(x), x)
  colnames(result) <- "doji"
  return(result)
}
