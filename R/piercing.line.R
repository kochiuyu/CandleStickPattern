#' Determine piercing line pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if hammer pattern detected
#' @export

piercing.line <- function(x) {
  Cl <- quantmod::Cl(x)
  M <- CandleBodyCenter(x)

  Lag.M <- quantmod::Lag(M)

  U <- bullish.candle(x)
  D <- bearish.candle(x)

  Lag.D <- quantmod::Lag(D)

  result <- xts::reclass(U  &
                    Lag.D &
                    Cl >= Lag.M,
                    x)
  colnames(result) <- "piercing line"
  return(result)
}
