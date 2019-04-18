#' Determine long candle using a OHLC price series
#'
#' @param x OHLC prices.
#' @param n period
#' @param delta sensitivity parameter
#' @return TRUE if long candle detected
#' @export


long.candle <- function(x, n=20, delta=1) {
  BL <- CandleBodyLength(x)
  BL.Median <- runMedian(BL,n)

  result <- reclass(BL >= BL.Median * delta, x)
  colnames(result) <- "long candle"
  return(result)
}
