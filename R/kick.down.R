#' Determine kicking down pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if kicking down pattern detected
#' @export



kick.down <- function(x) {
  U <- bullish.candle(x)
  D <- bearish.candle(x)
  GD <- gap.down(x)

  Lag.U <- quantmod::Lag(U)

  result <- xts::reclass(D  &
                    Lag.U &
                    GD,
                    x)
  colnames(result) <- "kick down"
  return(result)
}
