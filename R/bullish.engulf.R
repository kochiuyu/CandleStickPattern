#' Determine bullish engulfing pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if hammer pattern detected


bullish.engulf <- function(x) {
  BT <- CandleBodyTop(x)
  BB <- CandleBodyBottom(x)

  Lag.BT <- Lag(BT)
  Lag.BB <- Lag(BB)

  U <- bullish.candle(x)
  D <- bearish.candle(x)

  Lag.D <- Lag(D)

  result <- reclass(U  &
                    Lag.D &
                    BT >= Lag.BT &
                    BB <= Lag.BB, x)
  colnames(result) <- "bullish engulfing"
  return(result)
}
