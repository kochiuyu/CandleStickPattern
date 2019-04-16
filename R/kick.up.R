#' Determine kicking up pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if kicking up pattern detected


kick.up <- function(x) {
  U <- bullish.candle(x)
  D <- bearish.candle(x)
  GU <- gap.up(x)

  Lag.D <- Lag(D)

  result <- reclass(U  &
                    Lag.D &
                    GU ,
                    x)
  colnames(result) <- "kick up"
  return(result)
}
