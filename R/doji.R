#' Determine Doji Pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @param delta sensitivity parameter
#' @return TRUE if Doji pattern detected
#' @examples
#' getSymbols('AAPL',adjust=TRUE)
#' doji(AAPL)

doji <- function(x, delta = 0.1) {
  WC <- CandleStickLength(x)
  BL <- CandleBodyLength(x)
  result <- reclass(delta * WC >= BL, x)
  colnames(result) <- "doji"
  return(result)
}
