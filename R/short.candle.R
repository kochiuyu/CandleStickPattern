#' Determine short candle using a OHLC price series
#'
#' @param x OHLC prices.
#' @param n period
#' @param delta sensitivity parameter
#' @return TRUE if short candle detected
#' @export


short.candle <- function(x, n=20, delta=1) {
  BL <- CandleBodyLength(x)
  BL.Median <- TTR::runMedian(BL,n=n)

  result <- xts::reclass(BL <= BL.Median * delta, x)
  colnames(result) <- "long candle"
  return(result)
}
