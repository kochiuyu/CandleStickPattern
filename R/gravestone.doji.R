#' Determine Gravestoen Doji Pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @param delta Sensivity
#' @return TRUE if Doji pattern detected
#' @export
#'
gravestone.doji <- function(x,delta=0.1) {
  WC <- CandleStickLength(x)
  LS <- LowerShadowLength(x)

  result <- reclass(delta * WC >= LS & doji(x,delta), x)
  colnames(result) <- "gravestone.doji"
  return(result)
}
