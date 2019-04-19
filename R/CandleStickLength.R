#' Determine candle stick length using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if Dragon Doji pattern detected
#' @export


CandleStickLength <- function(x) {
  WC <- quantmod::Hi(x) - quantmod::Lo(x)
  result <- xts::reclass(WC, x)
  colnames(result) <- "CandleStickLength"
  return(result)
}
