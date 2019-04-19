#' Determine bearish engulfing pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if bearish engulfing pattern detected
#' @export


bearish.engulf <- function(x) {
  BT <- CandleBodyTop(x)
  BB <- CandleBodyBottom(x)

  Lag.BT <- quantmod::Lag(BT)
  Lag.BB <- quantmod::Lag(BB)

  U <- bullish.candle(x)
  D <- bearish.candle(x)

  Lag.U <- quantmod::Lag(U)

  result <- xts::reclass(D  &
                    Lag.U &
                    BT >= Lag.BT &
                    BB <= Lag.BB, x)
  colnames(result) <- "bearish engulfing"
  return(result)
}
