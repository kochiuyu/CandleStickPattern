#' Determine hammer pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @param US.delta sensitivity parameter for upper shadow
#' @param LS.delta sensitivity parameter for lower shadow
#' @return TRUE if hammer pattern detected
#' @export


hammer <- function(x, US.delta = 0.1, LS.delta=0.7) {
  WC <- CandleStickLength(x)
  US <- UpperShadowLength(x)
  LS <- LowerShadowLength(x)
  result <- xts::reclass(US.delta * WC >= US &
                    LS.delta * WC <= LS, x)
  colnames(result) <- "hammer"
  return(result)
}
