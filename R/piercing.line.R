#' Determine piercing line pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if hammer pattern detected
#' @examples
#' getSymbols('AAPL',adjust=TRUE)
#' doji(AAPL)

piercing.line <- function(x) {
  CL <- Cl(x)
  M <- CandleBodyCenter(x)

  Lag.M <- Lag(M)

  U <- bullish.candle(x)
  D <- bearish.candle(x)

  Lag.D <- Lag(D)

  result <- reclass(U  &
                    Lag.D &
                    CL >= Lag.M,
                    x)
  colnames(result) <- "piercing line"
  return(result)
}
