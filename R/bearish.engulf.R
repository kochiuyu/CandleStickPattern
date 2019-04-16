#' Determine bearish engulfing pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if bearish engulfing pattern detected
#' @examples
#' getSymbols('AAPL',adjust=TRUE)
#' doji(AAPL)

bearish.engulf <- function(x) {
  BT <- CandleBodyTop(x)
  BB <- CandleBodyBottom(x)

  Lag.BT <- Lag(BT)
  Lag.BB <- Lag(BB)

  U <- bullish.candle(x)
  D <- bearish.candle(x)

  Lag.U <- Lag(U)

  result <- reclass(D  &
                    Lag.U &
                    BT >= Lag.BT &
                    BB <= Lag.BB, x)
  colnames(result) <- "bearish engulfing"
  return(result)
}
