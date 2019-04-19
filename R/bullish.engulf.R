#' Determine bullish engulfing pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if hammer pattern detected
#' @export


bullish.engulf <- function(x) {
  BT <- CandleBodyTop(x)
  BB <- CandleBodyBottom(x)

  Lag.BT <- quantmod::Lag(BT)
  Lag.BB <- quantmod::Lag(BB)

  U <- bullish.candle(x)
  D <- bearish.candle(x)

  Lag.D <- quantmod::Lag(D)

  result <- xts::reclass(U  &
                    Lag.D &
                    BT >= Lag.BT &
                    BB <= Lag.BB, x)
  colnames(result) <- "bullish engulfing"
  return(result)
}
