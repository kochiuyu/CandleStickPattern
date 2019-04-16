#' Determine inverted harmer pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @param US.delta sensitivity parameter for upper shadow
#' @param LS.delta sensitivity parameter for lower shadow
#' @return TRUE if inverted hammer pattern detected


inverted.hammer <- function(x, US.delta = 0.7, LS.delta=0.1) {
  WC <- CandleStickLength(x)
  US <- UpperShadowLength(x)
  LS <- LowerShadowLength(x)
  result <- reclass(US.delta * WC <= US &
                    LS.delta * WC >= LS, x)
  colnames(result) <- "inverted hammer"
  return(result)
}
