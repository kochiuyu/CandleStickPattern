#' Determine Gravestoen Doji Pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @param delta Sensivity
#' @return TRUE if Doji pattern detected
#' @examples
#' getSymbols('AAPL',adjust=TRUE)
#' doji(AAPL)

gravestone.doji <- function(x,delta=0.1) {
  WC <- CandleStickLength(x)
  LS <- LowerShadowLength(x)

  result <- reclass(delta * WC >= LS & doji(x,delta), x)
  colnames(result) <- "gravestone.doji"
  return(result)
}
