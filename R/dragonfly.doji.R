#' Determine Dragon Doji Pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @param delta Sensivity
#' @return TRUE if Dragon Doji pattern detected
#' @export


dragonfly.doji <- function(x, delta=0.1) {
  WC <- CandleStickLength(x)
  US <- UpperShadowLength(x)

  result <- xts::reclass(delta * WC >= US & doji(x,delta), x)
  colnames(result) <- "dragonfly doji"
  return(result)
}
