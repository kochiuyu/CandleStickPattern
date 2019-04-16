#' Determine bullish harami pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if bullish harami  pattern detected
#' @examples
#' getSymbols('AAPL',adjust=TRUE)
#' doji(AAPL)

bullish.harami <- function(x) {
  BT <- CandleBodyTop(x)
  BB <- CandleBodyBottom(x)

  Lag.BT <- Lag(BT)
  Lag.BB <- Lag(BB)

  U <- bullish.candle(x)
  D <- bearish.candle(x)

  Lag.D <- Lag(D)

  result <- reclass(U  &
                      Lag.D &
                      BT <= Lag.BT &
                      BB >= Lag.BB, x)
  colnames(result) <- "bullish harami"
  return(result)
}
