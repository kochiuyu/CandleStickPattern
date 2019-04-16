#' Determine Doji Pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @param delta sensitivity parameter
#' @return TRUE if Doji pattern detected
#' @examples
#' getSymbols('AAPL',adjust=TRUE)
#' doji(AAPL)

doji <- function(x, delta = 0.1) {
  WC <- Hi(x) - Lo(x)
  BL <- abs(Op(x) - Cl(x))
  result <- reclass(delta * WC >= BL, x)
  colnames(result) <- "doji"
  return(result)
}
