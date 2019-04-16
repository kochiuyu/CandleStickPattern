#' Determine candle stick length using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if Dragon Doji pattern detected
#' @examples
#' getSymbols('AAPL',adjust=TRUE)
#' doji(AAPL)

CandleStickLength <- function(x) {
  WC <- Hi(x) - Lo(x)
  result <- reclass(WC, x)
  colnames(result) <- "CandleStickLength"
  return(result)
}
